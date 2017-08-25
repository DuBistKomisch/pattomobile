/**
 *  filename: ediot/Ediot.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package ediot {
	import ediot.characters.*;
	import ediot.surfaces.*;
	import events.EdiotEvent;
	import flash.display.BlendMode;
	import flash.display.CapsStyle;
	import flash.display.DisplayObject;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.ui.Keyboard;
	import fl.controls.Button;
	
	public class Ediot extends Sprite {
		// XML data
		public var data:XML;
		// display layers
		private var bg:Sprite;
		private static var layerList:Array = ["below","fixed","middle","mobile","above"];
		private var layers:Object;
		private var preview:Sprite;
		// snapping x-axis settings
		private var xSize:Number = 25;
		private var xOffset:Number = 0;
		// snapping y-axis settings
		private var ySize:Number = 25;
		private var yOffset:Number = 0;
		// rotational snapping (degrees)
		private var rSize:Number = 15;
		private var rOffset:Number = 0;
		// objects
		private static var objectsList:Object = {
			car:EdiotCar,
			rectangle:EdiotRectangleSurface,
			circle:EdiotCircleSurface
		};
		private var ediotObjects:Vector.<IEdiotObject>;
		// mouse interactions
		private var draggingLevel:Object = null;
		private var draggingOperation:Boolean = false;
		private var lastMouse:Point;
		// operation flags
		public var operating:Boolean = false;
		public var inserting:Boolean = false;
		public var tooling:Boolean = false;
		// operation information
		private var operation:String;
		private var operationData:Object;
		
		public function Ediot (d:XML) {
			data = d;
			
			// set background
			bg = new Sprite();
			addChild(bg);
			setBackground();
			
			// add layers
			layers = new Object();
			for each (var layer:String in Ediot.layerList)
				layers[layer] = addChild(new Sprite());
			
			// add preview
			preview = new Sprite();
			preview.blendMode = BlendMode.INVERT;
			preview.visible = false;
			preview.mouseEnabled = false;
			addChild(preview);
			
			// load objects
			ediotObjects = new Vector.<IEdiotObject>();
			// --- characters
			for each (var character:XML in data.characters.children())
				addEdiotObject(character);
			// --- surfaces
			for each (var surface:XML in data.surfaces.children())
				addEdiotObject(surface);
			
			// set up events
			Global.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			Global.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			Global.stage.addEventListener(MouseEvent.CLICK, mouseClick);
			Global.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			Global.stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheel);
			Global.stage.addEventListener(Event.ENTER_FRAME, stepFrame);
		}
		
		// sets the background colour and redraws the backgroun with this new colour
		// no input or invalid colour means just redraw from level data
		public function setBackground (colour:int = -1) {
			if (colour >= 0 && colour < Math.pow(2, 24)) data.colours.background = Util.repeat("0", 6 - colour.toString(16).length) + colour.toString(16);
			bg.graphics.clear();
			bg.graphics.beginFill(Util.hex(data.colours.background));
			bg.graphics.drawRect(0,0,data.width,data.height);
			bg.graphics.endFill();
		}
		
		public function fadeout () {
			// cancel any current operations
			cancelOperation();
			// remove event listeners
			Global.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			Global.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			Global.stage.removeEventListener(MouseEvent.CLICK, mouseClick);
			Global.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			Global.stage.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheel);
			Global.stage.removeEventListener(Event.ENTER_FRAME, stepFrame);
		}
		
		public function unload () {
			// remove objects
			while (ediotObjects.length) removeEdiotObject(ediotObjects[0]);
			// remove layers
			while (layers.length) removeChild(layers.pop());
			layers = null;
			// remove background
			removeChild(bg);
			bg.graphics.clear();
			bg = null;
			// remove preview
			removeChild(preview);
			preview.graphics.clear();
			preview = null;
			// delete data
			data = null;
		}
		
	// --- ediot objects
		
		private function addEdiotObject (init:XML):IEdiotObject {
			if (Ediot.objectsList[init.name()] == null) {
				DebugConsole.trace("Ediot: encountered unknown IEdiotObject type: " + init.name());
				return null;
			}
			var object:IEdiotObject = new (Ediot.objectsList[init.name()])();
			if (init.parent() == undefined) {
				var container:XML = object.parentNode(data);
				if (container.name() == "characters") {
					removeEdiotObjectByNode(container.child(init.name())[0]);
					container.replace(init.name(), init);
				} else container.appendChild(init);
			}
			object.initialise(init);
			object.redraw();
			layers[object.layer].addChild(object);
			ediotObjects.push(object);
			return object;
		}
		
		private function removeEdiotObject (ediotObject:IEdiotObject) {
			layers[ediotObject.layer].removeChild(ediotObject);
			ediotObject.cleanup();
			ediotObjects.splice(ediotObjects.indexOf(ediotObject),1);
		}
		
		private function removeEdiotObjectByNode (node:XML) {
			for (var i:uint = 0; i < ediotObjects.length; i++) {
				if (ediotObjects[i].myNode == node) {
					removeEdiotObject(ediotObjects[i]);
					return;
				}
			}
		}
		
	// --- operations
		
		private function startOperation () {
			operating = true;
			operationData = new Object();
			preview.visible = true;
			Global.functions.stealFocus();
		}
		
		private function stopOperation () {
			operating = false;
			operationData = null;
			preview.visible = false;
			preview.graphics.clear();
			preview.x = preview.y = preview.rotation = 0;
			Global.functions.returnFocus();
		}
		
		public function cancelOperation () {
			if (tooling) stopTool();
			if (inserting) stopInsert();
			dragOff();
		}
		
	// --- insertion
		
		public function setForInsert (type:String) {
			cancelOperation();
			startOperation();
			operation = type;
			inserting = true;
		}
		
		public function stopInsert () {
			stopOperation();
			inserting = false;
		}
		
		private function insertReady () {
			addEdiotObject(getInsertData());
			stopInsert();
			setForInsert(operation);
		}
		
	// --- tooling
		
		public function setForTool (type:String) {
			cancelOperation();
			startOperation();
			operation = type;
			tooling = true;
		}
		
		public function stopTool () {
			stopOperation();
			tooling = false;
		}
		
		public function doneTool () {
			stopTool();
			setForTool(operation);
		}
		
	// --- dragging
		
		private function dragOn () {
			draggingOperation = true;
			Global.events.dispatchEvent(new EdiotEvent(EdiotEvent.UI_HIDE));
		}
		
		private function dragOff () {
			draggingOperation = false;
			Global.events.dispatchEvent(new EdiotEvent(EdiotEvent.UI_SHOW));
		}
	
	// --- snapping
		
		private function snap (n:Number, s:Number, o:Number):Number {
			if (s && !KeyDown.isDown(Keyboard.ALTERNATE)) return Math.round((n - o) / s) * s + o;
			else return n;
		}
		
		private function snapX (n:Number):Number {
			return snap(n, xSize, xOffset);
		}
		
		private function snapY (n:Number):Number {
			return snap(n, ySize, yOffset);
		}
		
		private function snapPoint (p:Point):Point {
			return new Point(snapX(p.x), snapY(p.y));
		}
		
		private function snapR (n:Number):Number {
			return snap(n, rSize, rOffset);
		}
		
	// --- UI handling events
	
		private function hoverOutline (s:DisplayObject) {
			if (draggingOperation || !tooling) return;
			preview.graphics.clear();
			preview.x = preview.y = preview.rotation = 0;
			if (!(s is IEdiotObject)) return;
			if (operation == "delete" && s.parentNode(data).name() == "characters" && data.characters.children().length() == 1) return;
			if (operation == "move" && s.moveability == Toolability.NONE) return;
			if (operation == "resize" && s.resizability == Toolability.NONE) return;
			if (operation == "rotate" && s.rotatability == Toolability.NONE) return;
			preview.graphics.lineStyle(3, 0xFFFFFF, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE, JointStyle.MITER);
			s.outline(preview);
		}
		
		private function mouseDown (event:MouseEvent) {
			if (!(event.target is IEdiotObject || event.target is Stage || event.target == bg)) return;
			if (draggingLevel) return;
			if (KeyDown.isDown(Keyboard.SPACE) || !operating) {
				draggingLevel = {start:new Point(event.stageX, event.stageY), init:new Point(x, y)};
				Mouse.cursor = MouseCursor.HAND;
				Global.events.dispatchEvent(new EdiotEvent(EdiotEvent.UI_HIDE));
				return;
			}
			var point:Point = globalToLocal(new Point(event.stageX, event.stageY));
			if (inserting) switch (operation) {
				case "rectangle":
				case "circle":
				case "car":
					operationData.start = point;
					dragOn();
					break;
			}
			if (tooling) switch (operation) {
				case "move":
					if (event.target is IEdiotObject) {
						if (event.target.moveability == Toolability.NORMAL) {
							operationData.start = point;
							operationData.init = new Point(event.target.x, event.target.y);
							operationData.target = event.target;
							dragOn();
						} else if (event.target.moveability == Toolability.COMPLEX) {
							// TODO
						}
					} else if (event.target == bg && event.ctrlKey) {
						operationData.start = point;
						operationData.init = new Point(0, 0);
						operationData.target = event.target;
						dragOn();
					}
					break;
				case "resize":
					if (event.target is IEdiotObject && event.target.resizability != Toolability.NONE) {
						operationData.start = point;
						operationData.initWidth = event.target.width;
						operationData.target = event.target;
						dragOn();
					}
					break;
				case "rotate":
					if (event.target is IEdiotObject) {
						if (event.target.rotatability == Toolability.NORMAL) {
							operationData.start = point;
							operationData.init = event.target.rotation;
							operationData.target = event.target;
							dragOn();
						} else if (event.target.rotatability == Toolability.COMPLEX) {
							// TODO
						}
					}
					break;
			}
		}
		
		private function mouseUp (event:MouseEvent) {
			if (draggingLevel) {
				draggingLevel = null;
				Mouse.cursor = MouseCursor.ARROW;
				Global.events.dispatchEvent(new EdiotEvent(EdiotEvent.UI_SHOW));
				return;
			}
			if (!draggingOperation) return;
			var point:Point = globalToLocal(new Point(event.stageX, event.stageY));
			if (inserting) switch (operation) {
				case "circle":
					if (operationData.start == null) break;
					operationData.vertical = event.shiftKey;
				case "rectangle":
					if (operationData.start == null) break;
					if (snapPoint(point).equals(snapPoint(operationData.start))) {
						operationData.start = null;
						dragOff();
						break;
					}
					operationData.end = point;
					operationData.centred = event.ctrlKey;
					dragOff();
					insertReady();
					break;
				case "car":
					operationData.start = point;
					dragOff();
					insertReady();
					break;
			}
			if (tooling) switch (operation) {
				case "move":
					var diff:Point;
					if (operationData.target is IEdiotObject) {
						if (operationData.target.moveability == Toolability.NORMAL) {
							dragOff();
							operationData.relative = !event.ctrlKey;
							diff = snapPoint(point).subtract(snapPoint(operationData.start));
							var offset:Point = operationData.relative ? new Point(0, 0) : snapPoint(operationData.init).subtract(operationData.init);
							operationData.target.moveBy(offset.x + diff.x, offset.y + diff.y);
							doneTool();
						} else if (operationData.target.moveability == Toolability.COMPLEX) {
							// TODO
						}
					} else if (operationData.target == bg) {
						dragOff();
						bg.x = bg.y = 0;
						diff = snapPoint(point).subtract(snapPoint(operationData.start));
						for each (var ediotObject:IEdiotObject in ediotObjects)
							ediotObject.moveBy(-diff.x, -diff.y);
						x += (diff.x) * scaleX;
						y += (diff.y) * scaleY;
						doneTool();
					}
					break;
				case "resize":
					if (operationData.target is IEdiotObject) {
						if (operationData.target.resizability == Toolability.NORMAL) {
							dragOff();
							var m:Number = Point.distance(point, new Point(operationData.target.x, operationData.target.y)) / Point.distance(operationData.start, new Point(operationData.target.x, operationData.target.y));
							if (isNaN(m)) m = 1; // clicked exact centre?
							operationData.target.resizeBy(m);
							doneTool();
						} else if (operationData.target.resizability == Toolability.COMPLEX) {
							dragOff();
							operationData.end = point;
							operationData.target.resize(operationData, true);
							doneTool();
						}
					}
					break;
				case "rotate":
					if (operationData.target is IEdiotObject) {
						if (operationData.target.rotatability == Toolability.NORMAL) {
							dragOff();
							operationData.relative = !event.ctrlKey;
							var deltaR:Number = Math.atan2(point.y - operationData.target.y, point.x - operationData.target.x) - Math.atan2(operationData.start.y - operationData.target.y, operationData.start.x - operationData.target.x);
							var offsetR:Number = operationData.relative ? 0 : snapR(operationData.init) - operationData.init;
							operationData.target.rotateBy(offsetR + snapR(isNaN(deltaR) ? 0 : deltaR * 180 / Math.PI));
							doneTool();
						} else if (operationData.target.rotatability == Toolability.COMPLEX) {
							// TODO
						}
					}
					break;
			}
			hoverOutline(event.target);
		}
		
		private function mouseClick (event:MouseEvent) {
			if (!(event.target is IEdiotObject || event.target == bg)) return;
			if (draggingLevel) return;
			var point:Point = globalToLocal(new Point(event.stageX, event.stageY));
			if (tooling) switch (operation) {
				case "delete":
					// cancel if we haven't clicked on an IEdiotObject
					if (!(event.target is IEdiotObject)) break;
					// check if we're removing a character
					if (event.target.parentNode(data).name() == "characters") {
						if (data.characters.children().length() == 1) {
							// cancel if this is the last character left
							break;
						} else if (event.target.myNode.name() == data.control) {
							// if the control is the character we're getting rid of, set control to some other one
							data.control = data.characters.children()[event.target.myNode.childIndex()?0:1].name();
						}
					}
					// remove node
					Util.deleteNode(event.target.myNode);
					// remove object
					removeEdiotObject(event.target);
					// if only one character left, set it as the control
					if (data.characters.children().length() == 1) data.control = data.characters.children()[0].name();
					// remove hover outline
					hoverOutline(null);
					break;
				case "bringfront":
					// cancel if we haven't clicked on an IEdiotObject
					if (!(event.target is IEdiotObject)) break;
					// reattach node
					Util.deleteNode(event.target.myNode);
					event.target.parentNode(data).appendChild(event.target.myNode);
					// send IEdiotObject to back of display list
					layers[event.target.layer].setChildIndex(event.target, layers[event.target.layer].numChildren - 1);
					// update hover outline
					hoverOutline(event.target);
					break;
				case "sendback":
					// cancel if we haven't clicked on an IEdiotObject
					if (!(event.target is IEdiotObject)) break;
					// reattach node
					Util.deleteNode(event.target.myNode);
					event.target.parentNode(data).prependChild(event.target.myNode);
					// send IEdiotObject to back of display list
					layers[event.target.layer].setChildIndex(event.target, 0);
					// update hover outline
					var oup:Array = getObjectsUnderPoint(new Point(event.stageX, event.stageY));
					if (oup[oup.length - 1] is IEdiotObject) hoverOutline(oup[oup.length - 1]);
					break;
			}
		}
		
		private function mouseMove (event:MouseEvent) {
			lastMouse = new Point(event.stageX, event.stageY);
			if (draggingLevel) return;
			var point:Point = globalToLocal(new Point(event.stageX, event.stageY));
			if (inserting) {
				switch (operation) {
					case "circle":
						operationData.vertical = event.shiftKey;
					case "rectangle":
						if (operationData.start == null) break;
						if (point.equals(operationData.start)) break;
						operationData.end = point;
						operationData.centred = event.ctrlKey;
						break;
					case "car":
						if (operationData.start == null) break;
						operationData.start = point;
						break;
				}
			}
			hoverOutline(event.target);
		}
		
		private function mouseWheel (event:MouseEvent) {
			if (draggingLevel) return;
			var m:Matrix = transform.matrix;
			var speed:Number = event.shiftKey ? 0.5 : 0.1;
			var scale:Number = Util.clamp(scaleX + speed * Util.sign(event.delta), Math.min(scaleX, speed), 2) / scaleX;
			m.tx -= event.stageX;
			m.ty -= event.stageY;
			m.scale(scale, scale);
			m.tx += event.stageX;
			m.ty += event.stageY;
			transform.matrix = m;
		}
		
		private function stepFrame (event:Event) {
			if (draggingLevel) {
				x = draggingLevel.init.x + (lastMouse.x - draggingLevel.start.x);
				y = draggingLevel.init.y + (lastMouse.y - draggingLevel.start.y);
			}
			if (draggingOperation) {
				var buffer:Number = 15;
				var speed:Number = 0;
				if (lastMouse.x < buffer) x += (buffer - lastMouse.x) / buffer / scaleX;
				if (lastMouse.x > 640 - buffer) x -= (lastMouse.x + buffer - 640) / buffer / scaleX;
				if (lastMouse.y < buffer) y += (buffer - lastMouse.y) / buffer / scaleY;
				if (lastMouse.y > 480 - buffer) y -= (lastMouse.y + buffer - 480) / buffer / scaleY;
			}
			if (lastMouse) var point:Point = globalToLocal(lastMouse);
			if (inserting) {
				var gid:XML;
				preview.graphics.clear();
				preview.graphics.lineStyle(3, 0xFFFFFF, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE, JointStyle.MITER);
				switch (operation) {
					case "circle":
						if (operationData.start == null || operationData.end == null) break;
						operationData.end = point;
						operationData.vertical = KeyDown.isDown(Keyboard.SHIFT);
						operationData.centred = KeyDown.isDown(Keyboard.CONTROL);
						EdiotCircleSurface.preview(preview, gid = getInsertData());
						if (!operationData.centred) {
							var xs = Util.sign(operationData.end.x-operationData.start.x);
							var ys = Util.sign(operationData.end.y-operationData.start.y);
							preview.graphics.moveTo(operationData.vertical?-gid.radius*xs:gid.radius*xs,operationData.vertical?gid.radius*ys:-gid.radius*ys);
							preview.graphics.lineTo(operationData.vertical?gid.radius*xs:gid.radius*xs,operationData.vertical?gid.radius*ys:gid.radius*ys);
						}
						break;
					case "rectangle":
						if (operationData.start == null || operationData.end == null) break;
						operationData.end = point;
						operationData.centred = KeyDown.isDown(Keyboard.CONTROL);
						EdiotRectangleSurface.preview(preview, getInsertData());
						break;
					case "car":
						if (operationData.start == null) break;
						operationData.start = point;
						EdiotCar.preview(preview, getInsertData());
						break;
				}
			}
			if (tooling) switch (operation) {
				case "move":
					var diff:Point;
					if (operationData.target is IEdiotObject) {
						if (operationData.target.moveability == Toolability.NORMAL) {
							operationData.relative = !KeyDown.isDown(Keyboard.CONTROL);
							diff = snapPoint(point).subtract(snapPoint(operationData.start));
							var offset:Point = operationData.relative ? new Point(0, 0) : snapPoint(operationData.init).subtract(operationData.init);
							operationData.target.x = operationData.init.x + offset.x + diff.x;
							operationData.target.y = operationData.init.y + offset.y + diff.y;
						} else if (operationData.target.moveability == Toolability.COMPLEX) {
							// TODO
						}
					} else if (operationData.target == bg) {
						diff = snapPoint(point).subtract(snapPoint(operationData.start));
						bg.x = diff.x;
						bg.y = diff.y;
					}
					break;
				case "resize":
					if (operationData.target is IEdiotObject) {
						if (operationData.target.resizability == Toolability.NORMAL) {
							var m:Number = Point.distance(point, new Point(operationData.target.x, operationData.target.y)) / Point.distance(operationData.start, new Point(operationData.target.x, operationData.target.y));
							if (isNaN(m)) m = 1; // clicked exact centre?
							operationData.target.scaleX = operationData.target.scaleY = m;
						} else if (operationData.target.resizability == Toolability.COMPLEX) {
							operationData.end = point;
							operationData.target.resize(operationData);
						}
					}
					break;
				case "rotate":
					if (operationData.target is IEdiotObject) {
						if (operationData.target.rotatability == Toolability.NORMAL) {
							operationData.relative = !KeyDown.isDown(Keyboard.CONTROL);
							var deltaR:Number = Math.atan2(point.y - operationData.target.y, point.x - operationData.target.x) - Math.atan2(operationData.start.y - operationData.target.y, operationData.start.x - operationData.target.x);
							var offsetR:Number = operationData.relative ? 0 : snapR(operationData.init) - operationData.init;
							operationData.target.rotation = operationData.init + offsetR + snapR(isNaN(deltaR) ? 0 : deltaR * 180 / Math.PI);
						} else if (operationData.target.rotatability == Toolability.COMPLEX) {
							// TODO
						}
					}
					break;
			}
		}
		
	// --- process insert data
		
		private function getInsertData ():XML {
			if (!inserting) return null;
			var gid:XML = new XML("<"+operation+"></"+operation+">");
			var start:Point = snapPoint(operationData.start);
			var end:Point = snapPoint(operationData.end);
			switch (operation) {
				case "rectangle":
					gid.appendChild(XML("<x>"+(operationData.centred?start.x:(start.x+end.x)/2)+"</x>"));
					gid.appendChild(XML("<y>"+(operationData.centred?start.y:(start.y+end.y)/2)+"</y>"));
					gid.appendChild(XML("<width>"+Math.abs((end.x-start.x)*(operationData.centred?2:1))+"</width>"));
					gid.appendChild(XML("<height>"+Math.abs((end.y-start.y)*(operationData.centred?2:1))+"</height>"));
					break;
				case "circle":
					var r = operationData.centred?Math.sqrt(Math.pow(end.x-start.x,2)+Math.pow(end.y-start.y,2)):Math.abs(operationData.vertical?end.y-start.y:end.x-start.x)/2;
					gid.appendChild(XML("<radius>"+r+"</radius>"));
					gid.appendChild(XML("<x>"+(operationData.centred?start.x:operationData.vertical?start.x+r*Util.sign(end.x-start.x):(start.x+end.x)/2)+"</x>"));
					gid.appendChild(XML("<y>"+(operationData.centred?start.y:operationData.vertical?(start.y+end.y)/2:start.y+r*Util.sign(end.y-start.y))+"</y>"));
					break;
				case "car":
					gid.appendChild(XML("<x>"+start.x+"</x>"));
					gid.appendChild(XML("<y>"+start.y+"</y>"));
					break;
			}
			return gid;
		}
	}
}