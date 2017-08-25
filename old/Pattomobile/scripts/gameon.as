var levels = new Array()
levels["level1_1"] = "<level grav='3' w='2000' h='2000' x='1000' y='500' txtcol='000000' bg='FFFFFF' col='808080' kill='FF0000' ep='1' lv='1' name='Caged'><desc>You have been captured by the evil corporation, DBK Software\n\n\n\nYou are trapped in a cage hanging in a large room, but you notice that it is somehow unlocked\n\n\n\nYou must now escape or die!\n\n\* Press _left_ to move left and _right_ to move right\n\n* Red land will kill you if you touch it\n\n* Don't worry if you flip over, it doesn't matter</desc><surfaces><rect x='1000' y='0' w='2000' h='100' r='0' /><!--roof--><rect x='0' y='1000' w='100' h='2020' r='0' /><!--left wall--><rect x='2000' y='1000' w='100' h='2020' r='0' /><!--right wall--><rect x='925' y='2000' w='1850' h='100' r='0' /><!--floor--><rect x='1000' y='1850' w='500' h='300' r='0' /><rect x='523.25' y='1971.63' w='640.3' h='300' r='155' /><rect x='0' y='1900' w='100.1' h='100' r='0' type='kill' /><rect x='1450' y='1900' w='400' h='200' r='0' /><rect x='1720' y='1915' w='250' h='100' r='36.87' /><rect x='1650' y='1950' w='100' h='100' r='0' /></surfaces><objects><exit x='1950' y='2200' w='300' h='100' /><graphic id='cage' x='1000' y='450' w='1' h='1' r='0' /></objects></level>"
levels["level1_2"] = "<level grav='3' w='2000' h='800' x='100' y='-40' txtcol='000000' bg='FFFFFF' col='808080' kill='FF0000' ep='1' lv='2' name='On the Run'><desc>You've made it out of your prison cell!\n\n\n\nYou still have to get out of the building though...\n\n\n\n* Try getting a run up to help get over ramps\n\n* If you get stuck, press R to reset the level or ESC to return to the menu</desc><surfaces><rect x='600' y='0' w='800' h='50' r='0' /><!--roof--><rect x='0' y='400' w='50' h='820' r='0' /><!--left wall--><rect x='1500' y='237.5' w='1050' h='555' r='0' /><rect x='2000' y='400' w='50' h='820' r='0' /><!--right wall--><rect x='900' y='800' w='1800' h='50' r='0' /><!--bottom floor--><rect x='650' y='485' w='700' h='60' r='0' /><!--middle floor--><rect x='375' y='150' w='750' h='50' r='0' /><!--top floor--><rect x='300' y='124' w='600' h='50' r='5' /><rect x='-50' y='240' w='600' h='80' r='160' /><rect x='803' y='213' w='200' h='50' r='45' /><rect x='927' y='452' w='200' h='100' r='328' /><rect x='620' y='468' w='175' h='100' r='45' /><rect x='490' y='430' w='250' h='50' r='0' /><rect x='303' y='498' w='200' h='100' r='150' /><rect x='200' y='575' w='200' h='100' r='120' /><rect x='293' y='458' w='165' h='50' r='159.5' /><rect x='75' y='775' w='150' h='50' r='20' /><rect x='756' y='532' w='222' h='50' r='175' /><rect x='600' y='800' w='300' h='50'r='0' type='kill' /><rect x='400' y='800' w='200' h='50' r='160' /><rect x='800' y='800' w='200' h='50' r='20' /><rect x='1300' y='800' w='500' h='50'r='0' type='kill' /><rect x='1000' y='800' w='200' h='50' r='160' /><rect x='1600' y='800' w='200' h='50' r='20' /></surfaces><objects><exit x='1950' y='950' w='300' h='100' /><graphic id='hazard_lava' x='350' y='700' w='1' h='1' behind='true' /></objects></level>"
levels["level1_3"] = "<level grav='3' w='4000' h='4000' x='100' y='-40' txtcol='000000' bg='FFFFFF' col='808080' kill='FF0000' ep='1' lv='3' name='Leap of Faith'><desc>A large pit looms ahead,\n\n\n\nCan you clear this massive jump?\n\n\n\n* Be careful of how you take off, try not to bounce too much</desc><surfaces><rect x='2100' y='0' w='3800' h='100' r='0' /><!--roof--><rect x='0' y='2000' w='50' h='4100' r='0' /><!--left wall--><rect x='4000' y='2000' w='50' h='4100' r='0' /><!--right wall--><rect x='1925' y='4000' w='3850' h='100' r='0' type='kill' /><!--floor of death--><rect x='3850' y='3600' w='100' h='1100' r='0' /><!--landing pad--><!--starting ramp--><rect x='451.5' y='317.3' w='1000' h='300' r='10' /><rect x='450' y='2220' w='1000' h='3750' r='0' /><rect x='1050' y='350' w='300' h='200' r='0' /><rect x='1280' y='334' w='200' h='200' r='170' /></surfaces><objects><exit x='3950' y='4200' w='300' h='100' /><graphic id='hazard' x='1050' y='200' w='1' h='1' behind='true' /><graphic id='arrow' x='2000' y='300' w='1' h='1' behind='true' r='90' /><graphic id='arrow' x='2600' y='500' w='1' h='1' behind='true' r='115' /><graphic id='arrow' x='3200' y='1000' w='1' h='1' behind='true' r='140' /><graphic id='arrow' x='3700' y='1750' w='1' h='1' behind='true' r='160' /></objects></level>"
levels["level1_4"] = "<level grav='3' w='4000' h='1000' x='100' y='-40' txtcol='000000' bg='FFFFFF' col='808080' kill='FF0000' ep='1' lv='4' name='Jumping Practice'><desc>You're nearly out!\n\n\n\nJust a few tough jumps to go...\n\n\n\n* Don't go to fast or too slow over the jumps\n\n* If you're stuck trying to get over a corner, you won't be able to make it</desc><surfaces><!--main walls and floors--><rect x='0' y='500' w='50' h='1020' r='0' /><rect x='4000' y='500' w='50' h='1020' r='0' /><rect x='2100' y='0' w='3800' h='50' r='0' /><rect x='1900' y='480' w='3800' h='60' r='0' /><rect x='2100' y='1000' w='3850' h='50' r='0' /><!--upper level area--><rect x='200' y='280' w='400' h='400' r='0' /><rect x='700' y='333' w='600' h='300' r='0' /><rect x='1250' y='380' w='500' h='200' r='0' /><rect x='1250' y='380' w='500' h='200' r='0' /><rect x='1240' y='280' w='510' h='100' r='11' /><rect x='1550' y='380' w='100' h='200' r='0' /><rect x='1950' y='475' w='250' h='60' r='0' type='kill'/><rect x='1694' y='404' w='220' h='300' r='160' /><!--upper level jumps #2--><rect x='2206' y='404' w='220' h='300' r='20' /><rect x='2350' y='400' w='200' h='250' r='0' /><rect x='2750' y='475' w='300' h='60' r='0' type='kill'/><rect x='2494' y='404' w='220' h='300' r='160' /><!--upper level jumps #3--><rect x='3006' y='404' w='220' h='300' r='20' /><rect x='3150' y='400' w='200' h='250' r='0' /><rect x='3550' y='475' w='300' h='60' r='0' type='kill'/><rect x='3294' y='404' w='220' h='300' r='160' /><!--big wall to the right--><rect x='3700' y='500' w='200' h='650' r='0' /><!--roof of bottom area--><rect x='3900' y='950' w='500' h='100' r='160' /><rect x='3215' y='706' w='800' h='100' r='10' /><rect x='1800' y='600' w='3600' h='200' r='0' /><rect x='3525' y='700' w='150' h='50' r='0' /><rect x='25' y='700' w='300' h='200' r='135' /><!--bottom area ramps--><rect x='1050' y='1000' w='300' h='60' r='0' type='kill'/><rect x='3050' y='1000' w='142' h='142' r='45' /><rect x='2550' y='950' w='142' h='142' r='45' /><rect x='2250' y='1000' w='142' h='142' r='45' /><rect x='1250' y='1000' w='142' h='142' r='45' /><rect x='850' y='1000' w='142' h='142' r='45' /><!--bottom area boxes--><rect x='2900' y='1000' w='100' h='60' r='0' type='kill'/><rect x='2400' y='1000' w='100' h='60' r='0' type='kill'/><rect x='3000' y='950' w='100' h='100' r='0' /><rect x='2700' y='950' w='300' h='100' r='0' /><rect x='2500' y='912.5' w='100' h='125' r='0' /><rect x='2300' y='950' w='100' h='100' r='0' /><rect x='1225' y='950' w='50' h='100' r='0' /><rect x='900' y='950' w='100' h='100' r='0' /></surfaces><objects><exit x='100' y='1150' w='300' h='100' /><graphic id='hazard_lava' x='1550' y='200' w='1' h='1' behind='true' /><graphic id='hazard_lava' x='2350' y='200' w='1' h='1' behind='true' /><graphic id='hazard_lava' x='3150' y='200' w='1' h='1' behind='true' /><graphic id='hazard_lava' x='1600' y='900' w='1' h='1' behind='true' /></objects></level>"
levels["level2_1"] = "<level grav='3' w='640' h='3000' x='320' y='-40' bg='664422' col='996633' kill='FF0000' ep='2' lv='1' name='Underground'><desc>You are out of the building!\n\n\n\nBut you are now underground, you must find a way out!\n\n\n\n* This is the first level with circular surfaces in it\n\n* If you haven't already, check the 'EXTRAS' section of the menu, you may have unlocked some extras!</desc><surfaces><rect x='100' y='0' w='200' h='100' r='0' /><rect x='540' y='0' w='200' h='100' r='0' /><rect x='0' y='1500' w='100' h='3020' r='0' /><!--left wall--><rect x='640' y='520' w='100' h='1060' r='0' /><!--right wall (top) --><rect x='640' y='1790' w='100' h='1220' r='0' /><!--right wall (middle) --><rect x='640' y='2675' w='100' h='350' r='0' /><!--right wall (bottom) --><rect x='500' y='3000' w='1000' h='100' r='0' /><!--floor--><circ x='320' y='400' r='150' /><rect x='455' y='650' w='270' h='50' r='0' type='kill' /><rect x='320' y='600' w='100' h='400' r='0' /><circ x='50' y='700' r='100' /><circ x='320' y='900' r='150' /><!--circ x='50' y='1200' r='100' /--><halfpipe x='150' y='1100' w='40' h='50' r='100' n='10' s='270' e='360' /><rect x='225' y='1250' w='450' h='100' r='0' /><circ x='450' y='1250' r='50' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' type='kill' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><circ x='50?590' y='1400?2200' r='25' /><rect x='125' y='2600' w='30' h='500' r='0' /><rect x='215' y='2600' w='30' h='500' r='0' /><rect x='305' y='2600' w='30' h='500' r='0' /><rect x='100?330' y='2850' w='100' h='50' type='kill' /><rect x='430' y='2600' w='100' h='500' r='0' /><rect x='535' y='2350' w='210' h='100' r='0' /><rect x='740' y='2550' w='200' h='100' r='0' /><rect x='840' y='1550' w='100' h='2000' r='0' /><circ x='430' y='2350' r='50' /><circ x='430' y='2850' r='50' /></surfaces><objects><exit x='840' y='2950' w='100' h='300' /><graphic id='cavespike' x='100' y='50' w='1' h='1' r='0' /><graphic id='cavespike' x='175' y='50' w='.5' h='.5' r='0' /><graphic id='cavespike' x='477.5' y='50' w='.75' h='.75' r='0' /><graphic id='cavespike' x='540' y='50' w='1' h='1' r='0' /><graphic id='cavespike' x='250' y='480' w='1' h='1' r='0' /><graphic id='cavespike' x='250' y='1000' w='.5' h='.5' r='0' /><graphic id='cavespike' x='350' y='1000' w='1' h='1' r='0' /><graphic id='cavespike' x='150' y='1300' w='1.5' h='1' r='0' /><graphic id='cavespike' x='300' y='1300' w='1' h='.75' r='0' /><graphic id='cavespike' x='630' y='1050' w='.4' h='.5' r='0' /><graphic id='cavespike' x='615' y='1050' w='.5' h='.4' r='0' /><extra x='535' y='2450' r='50' id='level7_1' /><graphic id='hazard_balls' x='320' y='200' w='1' h='1' behind='true' /></objects></level>"
levels["level2_2"] = "<level grav='3' w='6500' h='480' x='-100' y='300' bg='0080FF' col='00FF00' kill='0000FF' bounce='FF00FF' ep='2' lv='2' name='Free at Last'><desc>Fresh Air!\n\n\n\nOnly one mission remains:\n\n\n\nFind your owner, Patto!\n\n\n\n* Outdoor levels are usually a lot more open, and involve lots of jumps ;)\n\n* Falling in the rivers will kill you! (in case it wasn't obvious)</desc><surfaces><rect x='-200' y='240' w='50' h='480' r='0' /><!--left wall--><rect x='0' y='400' w='1000' h='200' r='20' /><!--left ramp--><rect x='3250' y='480' w='7000' h='100' r='0' /><!--floor--><rect x='1500' y='480' w='400' h='150' r='0' type='kill' /><rect x='1250' y='480' w='250' h='150' r='160' /><rect x='1750' y='480' w='250' h='150' r='20' /><rect x='2800' y='480' w='500' h='150' r='0' type='kill' /><rect x='2450' y='480' w='250' h='150' r='160' /><rect x='3150' y='480' w='250' h='150' r='20' /><!--islands--><rect x='4350' y='430' w='200' h='150' r='160' /><rect x='4950' y='430' w='200' h='150' r='170' /><rect x='4950' y='430' w='100' h='150' r='170' type='bounce' d='80,10' /><rect x='5700' y='430' w='150' h='100' r='170' /><rect x='4750' y='480' w='2300' h='150' r='0' type='kill' /><rect x='3500' y='480' w='300' h='150' r='160' /><rect x='6000' y='480' w='300' h='150' r='20' /></surfaces><objects><exit x='6750' y='240' w='100' h='500' /></objects></level>"
levels["level2_3"] = "<level grav='3' w='9000' h='480' x='-100' y='430' bg='CC6600' col='008000' kill='FF0000' bounce='FF0080' fake='884400' ep='2' lv='3' name='Into the Woods'><desc>You have made it to the forest near your house.\n\n\n\nBe careful as night approaches...\n\n\n\n* Purple land will bounce you around, use it to your advantage!\n\n* Not everything is solid, you may be able to go through it\n\n* That massive yellow star will unlock an extra if you can touch it</desc><surfaces><rect x='-200' y='240' w='50' h='500' r='0' /><!--left wall--><rect x='900' y='480' w='2200' h='60' r='0' /><rect x='1000' y='480' w='300' h='60' r='0' type='bounce' d='0,10' /><rect x='1975' y='480' w='150' h='60' r='0' type='bounce' d='0,10' /><rect x='2250' y='600' w='800' h='50' r='0' type='kill' /><rect x='2800' y='350' w='100' h='250' type='fake' /><circ x='2800' y='100' r='150' /><rect x='3500' y='300' w='100' h='300' col='994400' /><rect x='3400' y='250' w='200' h='75' col='994400' /><rect x='3575' y='300' w='150' h='75' col='994400' /><rect x='4050' y='250' w='100' h='400' col='994400' /><rect x='3950' y='300' w='200' h='75' col='994400' /><rect x='4125' y='250' w='150' h='75' col='994400' /><rect x='3500' y='480' w='2200' h='60' r='0' /><rect x='3150' y='480' w='100' h='60' r='0' type='bounce' d='0,25' /><rect x='3750' y='480' w='100' h='60' r='0' type='bounce' d='0,15' /><rect x='4075' y='400' w='50' h='100' r='0' type='bounce' d='90,40' /><rect x='4600' y='480' w='200' h='100' r='160' /><rect x='6250' y='600' w='3500' h='50' r='0' type='bounce' d='0,15' /><rect x='5500' y='400' w='100' h='300' col='994400' /><rect x='5400' y='350' w='200' h='75' col='994400' /><rect x='5600' y='400' w='200' h='75' col='994400' /><circ x='5500' y='150' r='120' type='fake' col='008000' /><rect x='5525' y='325' w='50' h='75' r='0' type='bounce' d='90,40' /><rect x='5780' y='368' w='200' h='75' r='160' col='994400' /><rect x='6500' y='400' w='100' h='300' col='994400' /><rect x='6400' y='300' w='200' h='75' col='994400' /><rect x='6650' y='400' w='200' h='75' col='994400' /><circ x='6500' y='150' r='120' type='fake' col='008000' /><circ x='6750' y='400' r='50' /><rect x='7500' y='430' w='100' h='200' col='994400' /><rect x='7400' y='450' w='200' h='75' col='994400' /><rect x='7650' y='380' w='200' h='75' col='994400' /><circ x='7500' y='280' r='120' type='fake' col='008000' /><rect x='8250' y='350' w='100' h='250' type='fake' /><rect x='8450' y='350' w='100' h='250' type='fake' /><rect x='8600' y='350' w='100' h='250' type='fake' /><rect x='8850' y='350' w='100' h='250' type='fake' /><circ x='8250' y='50' r='200' /><circ x='8450' y='50' r='200' /><circ x='8600' y='50' r='200' /><circ x='8850' y='50' r='200' /><rect x='8750' y='480' w='1500' h='60' r='0' /></surfaces><objects><exit x='9300' y='240' w='100' h='500' /><graphic id='evening' x='0' y='0' w='1' h='1' r='0' fixed='true' /><graphic id='minion_shifty' x='7500' y='150' w='1' h='1' r='0' behind='true' /><extra x='2250' y='50' r='50' id='level7_2' /><graphic id='hazard_bounce' x='2800' y='400' w='1' h='1' /></objects></level>"
levels["level2_4"] = "<level grav='3' w='9800' h='480' x='200' y='150' bg='000040' col='999999' kill='FF0000' bounce='FF0080' fake='999999' ep='2' lv='4' name='Pattoville'><desc>You're so close! and yet so far...\n\n\n\nAll you've got to do is get over the rooftops to your house\n\n\n\n* Your house is the one with a garden out the front\n\n* Try to keep your speed up as you're going over the rooftops\n\n* You can re-watch any unlocked cutscenes in the EXTRAS menu</desc><surfaces><rect x='-25' y='240' w='50' h='5000' r='0' /><!--left wall--><rect x='9825' y='240' w='50' h='5000' r='0' /><!--right wall--><rect x='5000' y='480' w='10000' h='60' r='0' /><!--first house--><rect x='250' y='350' w='500' h='200' col='664422' /><rect x='700' y='480' w='100' h='60' type='bounce' d='0,25' /><rect x='250' y='250' w='550' h='100' r='5' col='994422' /><rect x='0' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='200' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='400' y='375' w='100' h='100' col='CCCC00' type='fake' /><!--second house--><rect x='1500' y='350' w='1000' h='200' col='664422' /><rect x='1250' y='250' w='525' h='100' r='175' col='994422' /><rect x='1750' y='250' w='525' h='100' r='5' col='994422' /><rect x='1250' y='250' w='550' h='100' r='175' col='994422' type='fake' /><rect x='1750' y='250' w='550' h='100' r='5' col='994422' type='fake' /><rect x='2050' y='225' w='100' h='20' r='160' col='994422' /><rect x='2250' y='400' w='10' h='100' col='664422' /><rect x='3100' y='480' w='1700' h='60' type='kill' /><rect x='1125' y='385' w='100' h='130' col='000080' type='fake' /><rect x='1300' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='1500' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='1700' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='1900' y='375' w='100' h='100' col='CCCC00' type='fake' /><!--third house--><rect x='3200' y='350' w='1000' h='200' col='664422' /><rect x='2950' y='250' w='525' h='100' r='175' col='994422' /><rect x='3450' y='250' w='525' h='100' r='5' col='994422' /><rect x='2950' y='250' w='550' h='100' r='175' col='994422' type='fake' /><rect x='3450' y='250' w='550' h='100' r='5' col='994422' type='fake' /><rect x='3750' y='225' w='100' h='20' r='160' col='994422' /><rect x='3950' y='400' w='10' h='100' col='664422' /><rect x='2825' y='385' w='100' h='130' col='000080' type='fake' /><rect x='3000' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='3200' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='3400' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='3600' y='375' w='100' h='100' col='CCCC00' type='fake' /><!--fourth building--><rect x='4700' y='350' w='1000' h='200' /><rect x='4950' y='200' w='500' h='100' /><rect x='4450' y='250' w='100' h='10' type='bounce' d='0,15' /><rect x='4450' y='250' w='520' h='20' type='fake' col='666666' /><rect x='4950' y='150' w='520' h='20' type='fake' col='666666' /><rect x='4300' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='4500' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='4700' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='4900' y='325' w='100' h='250' col='CCCC00' type='fake' /><rect x='5100' y='325' w='100' h='250' col='CCCC00' type='fake' /><!--rubbish bin--><rect x='5300' y='412.5' w='50' h='75' /><rect x='5300' y='375' w='50' h='1' type='bounce' d='0,20' /><rect x='5300' y='380' w='60' h='10' type='fake' col='666666' /><rect x='5300' y='412.5' w='10' h='50' type='fake' col='666666' /><rect x='5285' y='412.5' w='10' h='50' type='fake' col='666666' /><rect x='5315' y='412.5' w='10' h='50' type='fake' col='666666' /><!--fifth building--><rect x='6150' y='350' w='500' h='200' /><rect x='5650' y='300' w='500' h='300' /><rect x='6700' y='325' w='600' h='250' /><rect x='6300' y='225' w='50' h='50' /><rect x='6275' y='250' w='70.7' h='70.7' r='45' /><rect x='6150' y='250' w='520' h='20' type='fake' col='666666' /><rect x='5650' y='150' w='520' h='20' type='fake' col='666666' /><rect x='6700' y='200' w='620' h='20' type='fake' col='666666' /><rect x='5500' y='325' w='100' h='250' col='CCCC00' type='fake' /><rect x='5700' y='325' w='100' h='250' col='CCCC00' type='fake' /><rect x='5900' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='6100' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='6300' y='375' w='100' h='150' col='CCCC00' type='fake' /><rect x='6500' y='350' w='100' h='200' col='CCCC00' type='fake' /><rect x='6700' y='350' w='100' h='200' col='CCCC00' type='fake' /><rect x='6900' y='350' w='100' h='200' col='CCCC00' type='fake' /><!--sixth house--><rect x='7700' y='350' w='1000' h='200' col='664422' /><rect x='7450' y='250' w='550' h='100' r='175' col='994422' /><rect x='7950' y='250' w='550' h='100' r='5' col='994422' /><rect x='8250' y='225' w='100' h='20' r='160' col='994422' /><rect x='7325' y='385' w='100' h='130' col='000080' type='fake' /><rect x='7500' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='7700' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='7900' y='375' w='100' h='100' col='CCCC00' type='fake' /><rect x='8100' y='375' w='100' h='100' col='CCCC00' type='fake' /><!--your garden--><rect x='8850' y='375' w='50' h='150' col='664422' type='fake' /><rect x='8750' y='375' w='50' h='150' col='664422' type='fake' /><rect x='9000' y='375' w='50' h='150' col='664422' type='fake' /><rect x='9125' y='375' w='50' h='150' col='664422' type='fake' /><circ x='8850' y='300' r='60' col='008000' /><circ x='8750' y='300' r='50' col='008000' /><circ x='9000' y='300' r='80' col='008000' /><circ x='9125' y='300' r='50' col='008000' /><rect x='8979' y='485' w='550' h='80' r='1' col='008000' type='fake' /><rect x='8700' y='400' w='10' h='100' col='664422' type='fake' /><!--your house LOL--><rect x='9550' y='225' w='515' h='75' r='0' /><rect x='9600' y='350' w='400' h='200' r='0' col='664422' /><rect x='9350' y='350' w='100' h='200' r='0' col='664422' type='fake' /><rect x='9300' y='250' w='100' h='75' r='120' /><rect x='9800' y='250' w='100' h='75' r='60' /><rect x='9400' y='375' w='100' h='150' col='000080' type='fake' /><rect x='9600' y='350' w='200' h='100' col='808000' type='fake' /><rect x='9600' y='350' w='200' h='10' col='664422' type='fake' /><rect x='9600' y='350' w='10' h='100' col='664422' type='fake' /><rect x='9650' y='188' w='150' h='1' type='bounce' d='0,10' /></surfaces><objects><exit x='9400' y='375' w='100' h='150' /><graphic id='moon' x='100' y='100' w='1' h='1' r='0' fixed='true' /><extra x='9650' y='100' r='50' id='level7_3' /></objects></level>"
levels["level3_1"] = "<level grav='3' w='2000' h='480' x='87.5' y='-100' px='87.5' py='-400' bg='333333' col='999999' kill='FF0000' bounce='FF0080' fake='999999' ep='3' lv='1' name='Escape from Pattoville'><desc>You must now escape and avoid being killed!\n\n\n\nYou descend into Patto's Basement...\n\n\n\n* Press TAB to switch between controlling the Pattomobile and Patto\n\n* Use the arrow keys to make Patto fly around\n\n* The Pattomobile can't drive as fast with Patto on it</desc><surfaces><rect x='0' y='-10' w='50' h='1000' r='0' /><!--left wall--><rect x='150' y='-260' w='50' h='500' r='0' /><!--left wall--><rect x='75' y='-510' w='150' h='50' r='0' /><!--high roof--><rect x='2000' y='240' w='50' h='500' r='0' /><!--right wall--><rect x='1075' y='480' w='1850' h='50' r='0' /><!--floor--><rect x='1075' y='0' w='1850' h='50' r='0' /><!--roof--><rect x='87.5' y='480' w='125' h='50' r='0' col='664422' id='4' /><!--trapdoor floor--><rect x='1250' y='285' h='50' w='500' type='kill' /><circ x='500' y='315' r='100' /><circ x='1000' y='315' r='100' /><rect x='750' y='110' w='500' h='50' /><circ x='750' y='750' r='320' id='3' /><rect x='750' y='480' w='100' h='50' type='bounce' d='0,10' /><rect x='500' y='222.5' h='275' w='100' /><rect x='1525' y='335' h='50' w='1050' /><rect x='1000' y='222.5' h='275' w='100' /><rect x='1500' y='185' h='350' w='100' id='2' /><rect x='500' y='450' h='100' w='100' id='1' /><rect x='1500' y='310' h='70.71' w='70.71' r='45' /></surfaces><objects><exit x='75' y='600' w='300' h='100' /><switch x='1250' y='150' id='1' /><switch x='1927.5' y='407.5' id='2' /><switch x='1750' y='200' id='3' /><switch x='750' y='200' id='4' /></objects></level>"
levels["level3_2"] = "<level grav='3' w='4000' h='2000' x='-100' y='150' px='-100' py='100' bg='999999' col='CCCCCC' kill='FF0000' bounce='FF0080' fake='CCCCCC' ep='3' lv='2' name='The Warehouse'><desc>As you leave the basement you enter Patto's warehouse...\n\n\n\nGet to the door in the roof to get out!\n\n\n\n* Use Patto to push around the boxes and make a path for the Pattomobile\n\n* Once the Pattomobile touches a pushable bounce box it will freeze where it is\n\n* Only the Pattomobile can collect an extra</desc><surfaces><rect x='-25' y='1100' w='100' h='1820' r='0' /><!--left wall--><rect x='-175' y='100' w='50' h='200' r='0' /><!--left wall--><rect x='4025' y='1000' w='100' h='2020' r='0' /><!--right wall--><rect x='2000' y='2000' w='4000' h='50' r='0' /><!--floor--><rect x='1450' y='0' w='3500' h='50' r='0' /><!--roof--><rect x='-150' y='200' w='350' h='50' r='0' /><!--roof--><rect x='3950' y='0' w='100' h='50' r='0' /><!--roof--><rect x='3550' y='0' w='700' h='50' r='0' col='996633' id='2' /><!--roof door--><rect x='250' y='500' w='100' h='1000' r='0' /><rect x='1050' y='750' w='100' h='1500' r='0' /><rect x='1550' y='600' w='100' h='1200' r='0' /><rect x='3050' y='930' w='100' h='860' r='0'/><rect x='3050' y='250' w='100' h='500' r='0' id='1' /><rect x='3200' y='550' w='200' h='100' r='0' /><rect x='3900' y='550' w='200' h='100' r='0' /><rect x='2500' y='1850' w='3000' h='300' r='0' /><rect x='1750' y='1550' w='500' h='300' r='0' /><rect x='3250' y='1550' w='1500' h='300' r='0' /><rect x='500' y='1000' w='600' h='200' r='0' /><rect x='800' y='1925' w='70.71' h='70.71' r='45' /><rect x='650' y='800' w='120' h='50' r='0' type='bounce' d='0,40' f='true' /><rect x='1400' y='900' w='120' h='50' r='0' type='bounce' d='0,40' f='true' /><rect x='3400' y='475' w='300' h='50' r='0' type='bounce' d='0,80' f='true' /><rect x='425' y='1950' w='850' h='50' r='0' /><!--raised floor--><rect x='1175' y='1675' w='350' h='50' r='0' /><!--raised floor--><rect x='1400' y='1100' w='300' h='200' r='0' /><rect x='1750' y='1000' w='500' h='100' r='0' /><rect x='1700' y='800' w='150' h='150' r='0' f='true' col='664422' /><rect x='1900' y='800' w='150' h='150' r='0' f='true' col='664422' /><rect x='1800' y='600' w='150' h='150' r='0' f='true' col='664422' /><rect x='2750' y='1000' w='500' h='100' r='0' /><rect x='2700' y='800' w='150' h='150' r='0' f='true' col='664422' /><rect x='2900' y='800' w='150' h='150' r='0' f='true' col='664422' /><rect x='2800' y='600' w='150' h='150' r='0' f='true' col='664422' /><rect x='3750' y='1425' w='70.71' h='70.71' r='45' /><rect x='3350' y='1425' w='70.71' h='70.71' r='45' /></surfaces><objects><exit x='3550' y='-200' w='2000' h='100' /><switch x='3975' y='1350' id='1' /><switch x='3900' y='425' id='2' /><extra x='387.5' y='825' r='50' id='level7_4' /><graphic id='hazard_bounce' x='110' y='450' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level3_3"] = "<level grav='3' w='2500' h='1000' x='-100' y='150' px='-100' py='100' bg='999999' col='CCCCCC' kill='FF0000' bounce='FF0080' fake='CCCCCC' ep='3' lv='3' name='Skilltester'><desc>You're nearly out!\n\n\n\nJust some really big jumps and stuff in the way...\n\n\n\n* Try to get Patto out first, because it's not always possible\n\n* The smoother you take off the more chance you have of making the jumps\n\n* Let the boosts do the work, especially on the last jump!</desc><surfaces><rect x='-25' y='1100' w='100' h='1820' r='0' /><!--left wall--><rect x='-175' y='100' w='50' h='200' r='0' /><!--left wall--><rect x='2525' y='400' w='100' h='820' r='0' /><!--right wall--><rect x='1500' y='1000' w='3000' h='50' r='0' /><!--floor--><rect x='1500' y='0' w='3000' h='50' r='0' /><!--roof--><rect x='-150' y='200' w='350' h='50' r='0' /><!--left roof--><rect x='-150' y='0' w='350' h='50' r='0' /><!--left roof--><rect x='1500' y='510' w='100' h='850' /><!--middle wall--><rect x='2500' y='892.5' w='100' h='165' id='1' col='666666' /><!--door--><!--level 1--><rect x='312.5' y='300' w='625' h='50' /><rect x='1112.5' y='300' w='425' h='50' /><rect x='667' y='292' w='100' h='50' r='170'/><rect x='857' y='292' w='100' h='50' r='10'/><!--level 2--><rect x='387.5' y='425' w='375' h='50' /><rect x='1237.5' y='425' w='575' h='50' /><rect x='617' y='413' w='100' h='50' r='165'/><rect x='908' y='413' w='100' h='50' r='15'/><!--level 3--><rect x='12.5' y='550' w='25' h='50' type='bounce' d='90,20'/><rect x='262.5' y='575' w='525' h='50' /><rect x='1162.5' y='575' w='325' h='50' /><rect x='564' y='559' w='100' h='50' r='160'/><rect x='962' y='559' w='100' h='50' r='20'/><!--level 4--><rect x='1462.5' y='725' w='25' h='50' type='bounce' d='270,25'/><rect x='337.5' y='750' w='275' h='50' /><rect x='1287.5' y='750' w='475' h='50' /><rect x='510' y='731' w='100' h='50' r='155'/><rect x='1015' y='731' w='100' h='50' r='25'/><!--level 5--><rect x='12.5' y='962.5' w='25' h='25' type='bounce' d='90,35'/><rect x='750' y='1000' w='800' h='50' type='kill' /><rect x='364' y='972' w='100' h='50' r='150'/><rect x='1132' y='972' w='100' h='50' r='30'/><!--balls of death--><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /><circ x='1600?2450' y='150?750' r='25' type='kill' /></surfaces><objects><exit x='2650' y='900' w='100' h='300' /><switch x='2425' y='750' id='1' /><graphic id='arrow' x='762' y='590' w='1' h='1' r='180' behind='true' /><graphic id='hazard_lava' x='762' y='600' w='1' h='1' r='0' behind='true' /><graphic id='arrow' x='772' y='150' w='1' h='1' r='90' behind='true' /><graphic id='hazard_balls' x='762' y='200' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level3_4"] = "<level grav='3' w='1280' h='1960' x='100' y='1910' px='100' py='1860' txtcol='FFFFFF' bg='333333' col='000000' kill='FF0000' bounce='FF0080' fake='666666' ep='3' lv='4' name='Boss #1 ~ Blue Ghost Minion'><desc>Only one final challenge to go!\n\n\n\nBut wait... What's going on?\n\n\n\n\This shouldn't be here!\n\n\n\n* To battle with the boss, just smash into him while trying to avoid getting hit by him\n\n* Whoever runs out of health first loses!\n\n* Hit the 6th switch with the Pattomobile while Patto is in the top room</desc><surfaces><rect x='640' y='-40' w='1280' h='100' /><!--roof--><rect x='640' y='960' w='1280' h='50' id='-6' /><!--id roof--><rect x='240' y='960' w='500' h='100' /><!--left roof--><circ x='490' y='960' r='50' /><!--left roof curve--><rect x='1040' y='960' w='500' h='100' /><!--right roof--><circ x='790' y='960' r='50' /><!--right roof curve--><rect x='590' y='2000' w='1380' h='100' /><!--floor--><rect x='1320' y='980' w='100' h='1960' /><!--right wall--><rect x='-40' y='980' w='100' h='1960' /><!--left wall--><rect x='640' y='1275' w='100' h='250' /><!--center wall--><rect x='640' y='1325' w='100' h='350' id='5' /><!--center wall--><rect x='640' y='1150' w='300' h='50' /><!--center floor--><circ x='490' y='1150' r='25' /><!--center floor curve 1--><rect x='477.5' y='1075' w='25' h='150' id='5' /><!--center id 1--><circ x='790' y='1150' r='25' /><!--center floor curve 2--><rect x='802.5' y='1075' w='25' h='150' id='5' /><!--center id 2--><circ x='640' y='1400' r='50' /><!--center curve--><circ x='640' y='1500' r='60' id='5' /><!--center curve id--><rect x='250' y='1835' w='100' h='150' /><!--left shield--><circ x='250' y='1760' r='50' /><!--left shield curve--><rect x='1030' y='1835' w='100' h='150' /><!--right shield--><rect x='1155' y='1735' w='250' h='50' /><!--right shield top--><circ x='1030' y='1760' r='50' /><!--right shield curve--><circ x='400' y='2130' r='200' id='2' /><!--left bounce cover id--><circ x='400' y='2130' r='190' type='bounce' d='0,40' /><!--left bounce--><circ x='880' y='2130' r='200' id='4' /><!--right bounce cover id--><circ x='880' y='2130' r='190' type='bounce' d='0,40' /><!--right bounce--><rect x='250' y='1415' w='100' h='110' /><!--left area--><rect x='275' y='1180' w='50' h='360' id='1' /><!--left area id--><rect x='162.5' y='1335' w='175' h='50' /><!--left area top--><rect x='125' y='1585' w='250' h='50' /><!--left area bottom--><rect x='150' y='1535' w='300' h='50' /><!--left area bottom 2--><circ x='250' y='1360' r='50' /><!--left area curve 1--><circ x='250' y='1560' r='50' /><!--left area curve 2--><circ x='75' y='1335' r='25' /><!--left area curve 3--><rect x='1030' y='1415' w='100' h='110' /><!--right area--><rect x='1005' y='1180' w='50' h='360' id='3' /><!--right area id--><rect x='1117.5' y='1335' w='175' h='50' /><!--right area top--><rect x='1155' y='1585' w='250' h='50' /><!--right area bottom--><rect x='1130' y='1535' w='300' h='50' /><!--right area bottom 2--><circ x='1030' y='1360' r='50' /><!--right area curve 1--><circ x='1030' y='1560' r='50' /><!--right area curve 2--><circ x='1205' y='1335' r='25' /><!--right area curve 3--></surfaces><objects><switch x='1175' y='1861' id='1' /><switch x='105' y='1105' id='2' /><switch x='125' y='1421' id='3' /><switch x='1175' y='1105' id='4' /><switch x='1155' y='1421' id='5' /><switch x='640' y='1500' id='6' /><boss x='640' y='500' id='bgm' t='6'/><extra x='640' y='1050' r='50' id='level7_5' /><graphic id='arrow' x='640' y='1100' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level4_1"] = "<level grav='3' w='2000' h='2000' x='1000' y='500' bg='FFFF00' col='808000' kill='FF0000' ep='4' lv='1' name='Caged'><desc>What's going on?\n\n\n\nYou are trapped in a cage hanging in a large room, but you notice that it is somehow unlocked\n\n\n\nYou must now escape or die!\n\n\n\n* Press LEFT to move left and RIGHT to move right\n\n* Red land will kill you if you touch it\n\n* Don't worry if you flip over, it doesn't matter</desc><surfaces><rect x='1000' y='0' w='2000' h='100' r='0' /><!--roof--><rect x='0' y='1000' w='100' h='2020' r='0' /><!--left wall--><rect x='2000' y='1000' w='100' h='2020' r='0' /><!--right wall--><rect x='925' y='2000' w='1850' h='100' r='0' /><!--floor--><rect x='1000' y='1850' w='500' h='300' r='0' ghost='true' /><rect x='523.25' y='1971.63' w='640.3' h='300' r='155' /><rect x='0' y='1900' w='100.1' h='100' r='0' type='kill' /><rect x='1450' y='1900' w='400' h='200' r='0' ghost='true' /><rect x='1720' y='1915' w='250' h='100' r='36.87' ghost='true' /><rect x='1650' y='1950' w='100' h='100' r='0' ghost='true' /></surfaces><objects><exit x='1950' y='2200' w='300' h='100' /><graphic id='cage' x='1000' y='450' w='1' h='1' r='0' /><extra x='1000' y='1850' r='50' id='level7_6' /></objects></level>"
levels["level4_2"] = "<level grav='3' w='1000' h='2275' x='100' y='-40' bg='FFFF00' col='808000' kill='FF0000' bounce='FF0080' ep='4' lv='2' name='Multi-tiered'><desc>You appear to be trapped in some sort of Nightmare...\n\n\n\nMaybe it was something to do with that yellow guy that shot you?\n\n\n\nThe only way to find out is to keep going!\n\n\n\n* You need to go at the right speeds to bounce off the walls correctly\n\n* If you don't hit all 8 switches you won't be able to exit the level</desc><surfaces><rect x='575' y='0' w='850' h='100' r='0' /><!--roof--><rect x='0' y='1500' w='100' h='3020' r='0' /><!--left wall--><rect x='1000' y='1087.5' w='100' h='2195' r='0' /><!--right wall--><rect x='550' y='2275' w='1100' h='100' r='0' /><!--floor--><!--wall bounce--><rect x='350' y='325' w='700' h='100' r='0' /><rect x='950' y='175' w='20' h='250' r='0' type='kill' /><rect x='950' y='375' w='20' h='150' r='0' type='bounce' d='300,20' /><rect x='950' y='525' w='20' h='150' r='0' type='kill' /><rect x='860' y='600' w='200' h='20' r='0' type='kill' /><rect x='570' y='650' w='860' h='100' r='0' /><circ x='140' y='650' r='50' /><!--switch platform area--><rect x='150' y='825' w='200' h='100' /><circ x='250' y='825' r='50' /><rect x='500' y='875' w='230' h='100' /><circ x='385' y='875' r='50' /><circ x='615' y='875' r='50' /><rect x='850' y='925' w='200' h='100' /><circ x='750' y='925' r='50' /><rect x='500' y='1025' w='300' h='100' /><circ x='350' y='1025' r='50' /><circ x='650' y='1025' r='50' /><rect x='125' y='1125' w='150' h='100' /><circ x='200' y='1125' r='50' /><rect x='495' y='1225' w='330' h='100' /><circ x='330' y='1225' r='50' /><circ x='660' y='1225' r='50' /><rect x='875' y='1225' w='150' h='100' /><circ x='800' y='1225' r='50' /><rect x='1000' y='1125' w='100' h='100' type='bounce' d='270,20' /><rect x='125' y='1375' w='150' h='100' /><circ x='200' y='1375' r='50' /><rect x='595' y='1425' w='530' h='100' /><circ x='330' y='1425' r='50' /><circ x='860' y='1425' r='50' /><rect x='150' y='1655' w='200' h='100' /><circ x='250' y='1655' r='50' /><rect x='875' y='1715' w='150' h='100' /><circ x='800' y='1715' r='50' /><rect x='495' y='1775' w='330' h='100' /><circ x='330' y='1775' r='50' /><circ x='660' y='1775' r='50' /><rect x='400' y='1750' w='100' h='50' type='bounce' d='0,20' /><rect x='150' y='1925' w='200' h='100' /><circ x='250' y='1925' r='50' /><rect x='560' y='1975' w='330' h='100' /><circ x='395' y='1975' r='50' /><circ x='725' y='1975' r='50' /><!--locked gates--><rect x='570' y='2135' w='860' h='100' r='0' /><circ x='140' y='2135' r='50' /><rect x='200' y='2205' w='50' h='40' id='1' col='C08000' /><rect x='300' y='2205' w='50' h='40' id='2' col='C08000' /><rect x='400' y='2205' w='50' h='40' id='3' col='C08000' /><rect x='500' y='2205' w='50' h='40' id='4' col='C08000' /><rect x='600' y='2205' w='50' h='40' id='5' col='C08000' /><rect x='700' y='2205' w='50' h='40' id='6' col='C08000' /><rect x='800' y='2205' w='50' h='40' id='7' col='C08000' /><rect x='900' y='2205' w='50' h='40' id='8' col='C08000' /></surfaces><objects><exit x='1200' y='2275' w='100' h='500' /><switch x='880' y='786' id='1' /><switch x='120' y='986' id='2' /><switch x='880' y='1086' id='3' /><switch x='120' y='1246' id='4' /><switch x='861' y='1566' id='5' /><switch x='120' y='1516' id='6' /><switch x='120' y='1786' id='7' /><switch x='860' y='1996' id='8' /><graphic id='arrow' x='450' y='760' w='1' h='1' r='90' behind='true' /><graphic id='arrow' x='450' y='1325' w='1' h='1' r='90' behind='true' /><graphic id='arrow' x='500' y='1625' w='1' h='1' r='315' behind='true' /></objects></level>"
levels["level4_3"] = "<level grav='3' w='5000' h='480' x='-100' y='410' bg='FFFF00' col='808000' kill='FF0000' bounce='FF0080' move='FF0000' ep='4' lv='3' name='The Hellevator'><desc>As time passes the landscape becomes more and more surreal...\n\n\n\nMore jumps, no way!\n\n\n\nHere we go again...\n\n\n\n* The way to get past this level is similar to 2-3\n\n* You've got to keep your speed up to get over the jumps</desc><surfaces><rect x='0' y='190' w='100' h='400' r='0' /><!--left wall--><rect x='5000' y='240' w='100' h='500' r='0' /><!--right wall--><rect x='2000' y='630' w='4000' h='100' r='0' type='kill' /><!--kill--><rect x='-200' y='240' w='100' h='500' /><rect x='200' y='480' w='800' h='100' r='0' /><!--floor--><rect x='250' y='0' w='900' h='100' r='0' /><!--roof--><rect x='600' y='430' w='200' h='50' r='160' /><move x='800' y='100' w='150' h='100' r='0' type='rect' minx='800' maxx='800' miny='-50' maxy='530' d='180' s='4' /><move x='800' y='380' w='150' h='100' r='0' type='rect' minx='800' maxx='800' miny='-50' maxy='530' d='180' s='4' /><rect x='1000' y='430' w='200' h='50' r='20' /><rect x='1400' y='480' w='800' h='100' r='0' /><!--floor--><rect x='1400' y='0' w='900' h='100' r='0' /><!--roof--><rect x='1800' y='430' w='200' h='50' r='160' /><move x='2000' y='70' w='150' h='100' r='0' type='rect' minx='2000' maxx='2000' miny='-50' maxy='530' d='180' s='4' /><move x='2000' y='350' w='150' h='100' r='0' type='rect' minx='2000' maxx='2000' miny='-50' maxy='530' d='180' s='4' /><move x='2300' y='0' w='150' h='100' r='0' type='rect' minx='2300' maxx='2300' miny='-50' maxy='530' d='180' s='4' /><move x='2300' y='280' w='150' h='100' r='0' type='rect' minx='2300' maxx='2300' miny='-50' maxy='530' d='180' s='4' /><rect x='2500' y='430' w='200' h='50' r='20' /><rect x='2925' y='480' w='850' h='100' r='0' /><!--floor--><rect x='2950' y='0' w='1000' h='100' r='0' /><!--roof--><rect x='3350' y='430' w='200' h='50' r='160' /><move x='3600' y='120' w='150' h='200' r='0' type='rect' minx='3600' maxx='3600' miny='-100' maxy='580' d='180' s='4' /><move x='3800' y='290' w='150' h='200' r='0' type='rect' minx='3800' maxx='3800' miny='-100' maxy='580' d='180' s='4' /><rect x='4050' y='430' w='200' h='50' r='20' /><rect x='4450' y='480' w='850' h='100' r='0' /><!--floor--><rect x='4475' y='0' w='1000' h='100' r='0' /><!--roof--></surfaces><objects><exit x='5000' y='680' w='500' h='100' /></objects></level>"
levels["level4_4"] = "<level grav='3' w='1280' h='960' x='640' y='-40' bg='808000' col='FFFF00' kill='FF0000' bounce='FF0080' ep='4' lv='4' name='Boss #2 ~ The Master of Nightmares'><desc>It was him!\n\n\n\nTime for you to beat him at his own game...\n\n\n\n* Touch the blue sparks to send them flying after him\n\n* If you get hit by him or the yellow sparks you'll get hurt\n\n* Be prepared for things to get harder as the battle progresses</desc><surfaces><rect x='270' y='0' w='540' h='100' r='0' /><!--left roof--><rect x='1010' y='0' w='540' h='100' r='0' /><!--right roof--><rect x='0' y='480' w='100' h='980' r='0' /><!--left wall--><rect x='1280' y='480' w='100' h='980' r='0' /><!--right wall--><rect x='640' y='960' w='1280' h='100' r='0' /><!--floor--><rect x='100' y='885' w='100' h='50' id='-2' /><rect x='200' y='885' w='100' h='50' id='-3' /><rect x='300' y='885' w='100' h='50' id='-4' /><rect x='400' y='885' w='100' h='50' id='-5' /><rect x='1180' y='885' w='100' h='50' id='-2' /><rect x='1080' y='885' w='100' h='50' id='-3' /><rect x='980' y='885' w='100' h='50' id='-4' /><rect x='880' y='885' w='100' h='50' id='-5' /></surfaces><objects><boss x='640' y='320' id='mnm'/></objects></level>"
levels["level5_1"] = "<level grav='3' w='1280' h='1000' x='320' y='-40' bg='404040' col='808080' kill='FF0000' bounce='FF0080' ep='5' lv='1' name='A New Power'><desc>You've beaten the Master of Nightmares and escaped from the Nightmare!\n\n\n\nBut now you're stuck in this room...\n\n\n\nAnd why do you have an overwhelming urge to press _space_?\n\n\n\nTime to find a way out!</desc><surfaces><rect x='122.5' y='0' w='245' h='100' r='0' /><!--left roof--><rect x='640' y='0' w='490' h='100' r='0' /><!--middle roof--><rect x='0' y='500' w='100' h='1020' r='0' /><!--left wall--><rect x='640' y='400' w='100' h='820' r='0' /><!--middle wall--><rect x='1280' y='500' w='100' h='1020' r='0' /><!--right wall--><rect x='640' y='1000' w='1280' h='100' r='0' ghost='true'/><!--floor--><rect x='640' y='1000' w='1280' h='50' r='0' type='kill' /><!--kill floor--><rect x='320' y='300' w='540' h='50' r='0' ghost='true' col='664422' /><rect x='320' y='500' w='540' h='50' r='0' ghost='true' col='664422' /><rect x='320' y='300' w='300' h='100' r='0' /><rect x='100' y='500' w='200' h='100' r='0' /><rect x='540' y='500' w='200' h='100' r='0' /><circ x='95' y='700?800' r='25' type='kill' ghost='true'/><circ x='170' y='700?800' r='25' type='kill' ghost='true'/><circ x='245' y='700?800' r='25' type='kill' ghost='true'/><circ x='320' y='700?800' r='25' type='kill' ghost='true'/><circ x='395' y='700?800' r='25' type='kill' ghost='true'/><circ x='470' y='700?800' r='25' type='kill' ghost='true'/><circ x='545' y='700?800' r='25' type='kill' ghost='true'/><rect x='1230' y='950' w='100' h='100' r='45' type='bounce' d='315,15' /><rect x='825' y='500' w='270' h='50' ghost='true' col='664422' /><rect x='1082.5' y='550' w='295' h='50' ghost='true' col='664422' /><rect x='960' y='425' w='50' h='200' type='kill' ghost='true' /><rect x='1230' y='525' w='60' h='60' r='45' type='bounce' d='330,20' ghost='true' /></surfaces><objects><exit x='1057.5' y='-50' w='345' h='100' /><extra x='740' y='100' r='50' id='level7_7' /><graphic id='hazard_balls' x='320' y='200' w='1' h='1' r='0' behind='true' /><graphic id='hazard_lava' x='960' y='800' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level5_2"] = "<level grav='3' w='640' h='1060' x='320' y='-40' bg='000040' col='808080' kill='FF0000' bounce='FF0080' fake='000040' ep='5' lv='2' name='Heading Down'><desc>So you have a new ability?\n\n\n\nAswell as allowing you to pass through some surfaces,\n\n\n\nIt also slightly reduces the effect of gravity!\n\n\n\nOh, and it can also give you a British accent if you use it too much\n\n\n\nSo why don't you practice a bit before rescuing Patto?</desc><surfaces><rect x='-40' y='530' w='100' h='1080' r='0' /><!--left wall--><rect x='680' y='530' w='100' h='1080' r='0' /><!--right wall--><rect x='320' y='200' w='180' h='40' ghost='true' /><rect x='320' y='420' w='260' h='40' ghost='true' /><rect x='100' y='240' w='180' h='40' ghost='true' /><rect x='540' y='240' w='180' h='40' ghost='true' /><rect x='100' y='340' w='180' h='40' ghost='true' /><rect x='540' y='340' w='180' h='40' ghost='true' /><rect x='100' y='380' w='180' h='40' type='kill' /><rect x='540' y='380' w='180' h='40' type='kill' /><rect x='210' y='290' w='40' h='220' /><rect x='430' y='290' w='40' h='220' /><circ x='320' y='290' r='25' type='kill' /><circ x='320' y='510' r='25' type='kill' /><rect x='320' y='600' w='260' h='40' /><rect x='320' y='640' w='260' h='40' ghost='true' /><rect x='120' y='680' w='220' h='40' /><rect x='520' y='680' w='220' h='40' /><circ x='320' y='750' r='25' type='kill' /><rect x='320' y='860' w='260' h='40' ghost='true' /><rect x='320' y='900' w='180' h='40' type='kill' /><rect x='120' y='900' w='220' h='40' ghost='true' /><rect x='520' y='900' w='220' h='40' ghost='true' /><rect x='120' y='1000' w='220' h='40' ghost='true' /><rect x='520' y='1000' w='220' h='40' ghost='true' /><circ x='230' y='1020' r='40' /><circ x='410' y='1020' r='40' /><rect x='120' y='1040' w='220' h='40' type='kill' /><rect x='520' y='1040' w='220' h='40' type='kill' /></surfaces><objects><exit x='320' y='1260' w='200' h='50' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='90?550' y='0?480' w='1' h='1' fixed='true' /><graphic id='moon' x='160' y='150' w='1' h='1' fixed='true' /><graphic id='window' x='320' y='30' w='640' h='80' behind='true' /><graphic id='window' x='320' y='310' w='640' h='80' behind='true' /><graphic id='window' x='320' y='590' w='640' h='80' behind='true' /><graphic id='window' x='320' y='870' w='640' h='80' behind='true' /><graphic id='window' x='40' y='530' w='80' h='1060' behind='true' /><graphic id='window' x='320' y='530' w='80' h='1060' behind='true' /><graphic id='window' x='600' y='530' w='80' h='1060' behind='true' /></objects></level>"
levels["level5_3"] = "<level grav='3' w='1920' h='1440' x='100' y='-40' px='960' py='720' bg='E0E0FF' col='808080' kill='FF0000' bounce='FF0080' ep='5' lv='3' name='The Freezer'><desc>You've finally found Patto!\n\n\n\nBut you've still got to break him out,\n\n\n\nThat cage looks a bit stronger than the one you were kept in....\n\n\n\nBetter put that new ability to good use!</desc><surfaces><rect x='0' y='720' w='100' h='1460' /><!--left wall--><rect x='1920' y='795' w='100' h='1310' /><!--right wall--><rect x='1908.5' y='137' w='24' h='10' /><!--right wall lip--><rect x='1060' y='0' w='1720' h='100' ghost='true' /><!--ghost roof--><rect x='1060' y='0' w='1670' h='50' type='kill' /><!--kill roof--><rect x='960' y='1450' w='1920' h='80' /><!--floor--><rect x='960' y='1400' w='500' h='20' type='bounce' d='0,20' /><!--bounce floor--><!--top section--><circ x='300' y='75?170' r='25' type='kill' ghost='true' /><circ x='400' y='75?190' r='25' type='kill' ghost='true' /><circ x='500' y='75?210' r='25' type='kill' ghost='true' /><circ x='600' y='75?230' r='25' type='kill' ghost='true' /><circ x='700' y='75?250' r='25' type='kill' ghost='true' /><circ x='1620' y='150?170' r='25' type='kill' ghost='true' /><circ x='1520' y='150?190' r='25' type='kill' ghost='true' /><circ x='1420' y='150?210' r='25' type='kill' ghost='true' /><circ x='1320' y='150?230' r='25' type='kill' ghost='true' /><circ x='1220' y='150?250' r='25' type='kill' ghost='true' /><rect x='400' y='300' w='800' h='200' r='10' /><rect x='400' y='400' w='800' h='200' /><rect x='1520' y='300' w='800' h='200' r='170' /><rect x='1520' y='400' w='800' h='200' /><!--left section--><rect x='422.5' y='925' w='625' h='160' /><rect x='710' y='1272.5' w='50' h='335' /><rect x='147.5' y='1025' w='75' h='40' /><rect x='710' y='1055' w='50' h='100' type='fake' col='808080' /><rect x='735' y='895' w='70' h='70' r='45' /><rect x='50' y='500' w='100' h='100' r='45' /><rect x='435' y='1420' w='500' h='20' type='bounce' d='0,20' /><!--bounce floor--><rect x='435' y='1400' w='500' h='20' ghost='true' /><!--ghost floor--><rect x='435' y='1015' w='500' h='20' type='kill' /><!--kill roof--><rect x='435' y='1035' w='500' h='20' ghost='true' /><!--ghost roof--><!--death circles--><!--top--><circ x='135' y='525?820' r='25' type='kill' ghost='true' /><circ x='185' y='525?820' r='25' type='kill' ghost='true' /><circ x='235' y='525?820' r='25' type='kill' ghost='true' /><circ x='285' y='525?820' r='25' type='kill' ghost='true' /><circ x='335' y='525?820' r='25' type='kill' ghost='true' /><circ x='385' y='525?820' r='25' type='kill' ghost='true' /><circ x='435' y='525?820' r='25' type='kill' ghost='true' /><circ x='485' y='525?820' r='25' type='kill' ghost='true' /><circ x='535' y='525?820' r='25' type='kill' ghost='true' /><circ x='585' y='525?820' r='25' type='kill' ghost='true' /><circ x='635' y='525?820' r='25' type='kill' ghost='true' /><circ x='685' y='525?820' r='25' type='kill' ghost='true' /><!--bottom--><circ x='210' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='260' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='310' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='360' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='410' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='460' y='1200?1365' r='25' type='kill' ghost='true' id='1' /><circ x='510' y='1100?1365' r='25' type='kill' ghost='true' id='1' /><circ x='560' y='1100?1365' r='25' type='kill' ghost='true' id='1' /><circ x='610' y='1100?1365' r='25' type='kill' ghost='true' id='1' /><circ x='660' y='1100?1365' r='25' type='kill' ghost='true' id='1' /><rect x='120' y='1390' w='20' h='100' r='0' /><rect x='130' y='1360' w='28.5' h='28.5' r='45' /><rect x='150' y='1390' w='42.5' h='42.5' r='45' /><rect x='80' y='1420' w='60' h='20' type='bounce' d='0,30' /><rect x='147.5' y='1400' w='75' h='20' /><!--right section--><rect x='1497.5' y='925' w='625' h='160' /><rect x='1210' y='1272.5' w='50' h='335' /><rect x='1772.5' y='1025' w='75' h='40' /><rect x='1210' y='1055' w='50' h='100' type='fake' col='808080' /><rect x='1185' y='895' w='70' h='70' r='45' /><rect x='1870' y='500' w='100' h='100' r='45' /><rect x='1485' y='1420' w='500' h='20' type='bounce' d='0,20' /><!--bounce floor--><rect x='1485' y='1400' w='500' h='20' ghost='true' /><!--ghost floor--><rect x='1485' y='1015' w='500' h='20' type='kill' /><!--kill roof--><rect x='1485' y='1035' w='500' h='20' ghost='true' /><!--ghost roof--><!--death circles--><!--top--><circ x='1785' y='525?820' r='25' type='kill' ghost='true' /><circ x='1735' y='525?820' r='25' type='kill' ghost='true' /><circ x='1685' y='525?820' r='25' type='kill' ghost='true' /><circ x='1635' y='525?820' r='25' type='kill' ghost='true' /><circ x='1585' y='525?820' r='25' type='kill' ghost='true' /><circ x='1535' y='525?820' r='25' type='kill' ghost='true' /><circ x='1485' y='525?820' r='25' type='kill' ghost='true' /><circ x='1435' y='525?820' r='25' type='kill' ghost='true' /><circ x='1385' y='525?820' r='25' type='kill' ghost='true' /><circ x='1335' y='525?820' r='25' type='kill' ghost='true' /><circ x='1285' y='525?820' r='25' type='kill' ghost='true' /><circ x='1235' y='525?820' r='25' type='kill' ghost='true' /><!--bottom--><circ x='1710' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1660' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1610' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1560' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1510' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1460' y='1200?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1410' y='1100?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1360' y='1100?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1310' y='1100?1365' r='25' type='kill' ghost='true' id='2' /><circ x='1260' y='1100?1365' r='25' type='kill' ghost='true' id='2' /><rect x='1800' y='1390' w='20' h='100' r='0' /><rect x='1790' y='1360' w='28.5' h='28.5' r='45' /><rect x='1770' y='1390' w='42.5' h='42.5' r='45' /><rect x='1840' y='1420' w='60' h='20' type='bounce' d='0,30' /><rect x='1772.5' y='1400' w='75' h='20' /><!--patto's cage--><rect x='960' y='520' w='450' h='50' col='6699CC' ghost='true' id='1' /><rect x='960' y='520' w='450' h='50' col='6699CC' ghost='true' id='2' /><rect x='960' y='920' w='450' h='50' col='6699CC' id='99' /><rect x='960' y='920' w='450' h='50' col='6699CC' ghost='true' /><rect x='760' y='720' w='50' h='450' col='6699CC' ghost='true' /><rect x='1160' y='720' w='50' h='450' col='6699CC' ghost='true' /><rect x='835' y='920' w='100' h='50' type='bounce' d='0,40' id='-1' /><rect x='1085' y='920' w='100' h='50' type='bounce' d='0,40' id='-2' /></surfaces><objects><exit x='2020' y='200' w='100' h='5000' /><graphic id='icecave' x='785' y='545' w='.55' h='0.73' behind='true' /><switch x='610' y='1220' id='1' /><switch x='1310' y='1220' id='2' /><switch x='960' y='1100' id='99' /><extra x='960' y='1301' r='50' id='level7_8' /><graphic id='hazard_lava' x='960' y='225' w='1' h='1' r='0' behind='true' /><graphic id='hazard_balls' x='960' y='425' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level5_4"] = "<level grav='2' w='6000' h='480' x='-65' y='260' bg='000020' col='008000' kill='FF0000' bounce='FF0080' move='FF0000' ep='5' lv='4' name='High Flyer'><desc>Patto and The Boss are dead!\n\n\n\nThank god it's all over... but what did he mean 'You're too late'?\n\n\n\nYou're out of the complex for the last time, all you've got to do is get past their outer defense systems.\n\n\n\nThen maybe you can get some sleep...</desc><surfaces><rect x='0' y='-350' w='100' h='1000' col='808080' /><!--left wall top--><rect x='-170' y='280' w='100' h='200' col='808080' /><!--left wall back--><rect x='-90' y='305' w='180' h='50' col='808080' /><!--left wall floor--><rect x='-90' y='125' w='180' h='50' col='808080' /><!--left wall roor--><rect x='0' y='380' w='100' h='200' col='808080' /><!--left wall bottom--><rect x='3000' y='550' w='6000' h='50' type='kill' /><!--kill floor--><rect x='300' y='480' w='600' h='100' /><!--grass 1--><rect x='1300' y='480' w='600' h='100' /><!--grass 2--><rect x='1600' y='450' w='100' h='50' r='175' /><!--ramp 1--><rect x='2000' y='450' w='100' h='50' r='5' /><!--ramp 2--><rect x='3000' y='480' w='2000' h='100' /><!--grass 3--><move x='2300' y='380' w='150' h='100' r='0' type='rect' minx='2100' maxx='2500' miny='380' maxy='380' d='90' s='4' m='reverse' /><move x='2900' y='380' w='150' h='100' r='0' type='rect' minx='2500' maxx='2900' miny='380' maxy='380' d='270' s='4' m='reverse' /><move x='3100' y='380' w='150' h='100' r='0' type='rect' minx='2900' maxx='3300' miny='380' maxy='380' d='270' s='4' m='reverse' /><move x='3300' y='380' w='150' h='100' r='0' type='rect' minx='3300' maxx='3700' miny='380' maxy='380' d='90' s='4' m='reverse' /><rect x='2500' y='380' w='100' h='110' /><rect x='2900' y='380' w='100' h='110' /><rect x='3300' y='380' w='100' h='110' /><rect x='4000' y='450' w='100' h='50' r='175' /><!--ramp 3--><rect x='4400' y='450' w='100' h='50' r='5' /><!--ramp 4--><rect x='5200' y='480' w='1600' h='100' /><!--grass 4--><move x='4800?5000' y='115?315' w='150' h='150' r='0' type='rect' minx='4600' maxx='5200' miny='75' maxy='355' d='45' s='4' m='reverse' /><move x='5100?5300' y='115?315' w='150' h='150' r='0' type='rect' minx='4900' maxx='5500' miny='75' maxy='355' d='45' s='6' m='reverse' /><move x='5400?5600' y='115?315' w='150' h='150' r='0' type='rect' minx='5200' maxx='5800' miny='75' maxy='355' d='45' s='8' m='reverse' /></surfaces><objects><exit x='6150' y='240' w='100' h='5000' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='moon' x='160' y='150' w='1' h='1' fixed='true' /><graphic id='star' x='500' y='80' w='2' h='2' fixed='true' /><graphic id='star' x='500' y='130' w='2' h='2' fixed='true' /><graphic id='star' x='480' y='100' w='2' h='2' fixed='true' /><graphic id='star' x='520' y='100' w='2' h='2' fixed='true' /><graphic id='star' x='510' y='110' w='1' h='1' fixed='true' /></objects></level>"
levels["level6_1"] = "<level grav='3' w='4000' h='480' x='120' y='410' bg='000080' col='008000' kill='FF0000' bounce='FF0080' fake='004000' ep='6' lv='1' name='The Invasion has begun!'><desc>This must have been what The Boss was talking about!\n\n\n\nThey kidnapped Patto so that they could make an army of robot clones...\n\n(This world wasn't even big enough for one Patto...)\n\n\n\nYou must stop them at any cost!</desc><surfaces><rect x='-50' y='240' w='100' h='1000' /><!--left wall--><rect x='2950' y='240' w='100' h='100000' id='1' col='664422' /><!--middle wall--><rect x='2950' y='190' w='100' h='400' col='664422' /><!--proper middle wall--><rect x='3900' y='240' w='100' h='100000' id='2' col='664422' /><!--right wall--><rect x='3400' y='-50' w='1000' h='100' /><!--right roof--><rect x='1000' y='480' w='2000' h='100' /><!--floor 1--><rect x='2850' y='480' w='900' h='100' /><!--floor 2--><rect x='3425' y='480' w='250' h='100' ghost='true' /><!--floor 3 ghost--><rect x='3425' y='480' w='250' h='50' type='bounce' d='0,15' /><!--floor 3 bounce--><rect x='3775' y='480' w='450' h='100' /><!--floor 4--><rect x='2200' y='590' w='400' h='100' type='kill' /><rect x='2200' y='590' w='400' h='100' type='kill' /><rect x='350' y='480' w='100' h='100' type='kill' /><rect x='900' y='210' w='100' h='440' type='kill' /><rect x='1400' y='410' w='200' h='40' type='kill' /><rect x='1300' y='430' w='70.71' h='70.71' r='45' /><rect x='1500' y='430' w='70.71' h='70.71' r='45' /><rect x='2040' y='495' w='100' h='100' r='10' type='bounce' d='10,20' /><rect x='2360' y='495' w='100' h='100' r='170' type='bounce' d='350,20' /><rect x='3425' y='15' w='400' h='50' type='kill' /><rect x='3425' y='15' w='400' h='50' type='kill' /><rect x='3425' y='15' w='400' h='50' type='kill' /><rect x='3225' y='-10' w='70.71' h='70.71' r='45' /><rect x='3625' y='-10' w='70.71' h='70.71' r='45' /></surfaces><objects><exit x='4150' y='240' w='100' h='1000' /><switch x='1400' y='440' id='1' /><switch x='3425' y='-15' id='2' /><graphic id='window' x='2200' y='460' w='400' h='60' behind='true' r='0' /><graphic id='house' x='250' y='430' w='1' h='1' fixed='true' /><graphic id='house2' x='100' y='430' w='2' h='2' fixed='true' /><graphic id='house2' x='350' y='430' w='-1.5' h='1.5' fixed='true' /><graphic id='house' x='500' y='430' w='2.5' h='2.5' fixed='true' /><graphic id='house2' x='700' y='430' w='-3' h='3' fixed='true' /><graphic id='house2' x='1050' y='430' w='10' h='10' behind='true' /><graphic id='house' x='2300' y='430' w='10' h='10' behind='true' /><patto type='bounce' x='700' y='200' vx='-2' vy='0' /><patto type='bounce' x='700' y='100' vx='0' vy='0' /><patto type='bounce' x='2700' y='20' vx='0' vy='0' /><patto type='bounce' x='3200' y='90?110' vx='.05' vy='0' /><patto type='bounce' x='3425' y='90?110' vx='-.05' vy='0' /><patto type='bounce' x='3650' y='90?110' vx='.05' vy='0' /><graphic id='window' x='240' y='350' w='20' h='300' behind='true' r='0' /><graphic id='hazard_patto' x='240' y='200' w='1' h='1' r='0' behind='true' /><graphic id='hazard_lava' x='240' y='320' w='1' h='1' r='0' behind='true' /></objects></level>"
levels["level6_2"] = "<level grav='3' w='4000' h='480' x='50' y='435' bg='CC6600' col='008000' kill='FF0000' bounce='FF0080' fake='884400' ep='6' lv='2' name='King of the Jungle'><desc>These laser-pattos look a lot smarter than those other guys!\n\n\n\nThose must have been the dumb clones...\n\n\n\nAnd I thought the real Patto was ugly!\n\n\n\nYou better find a way past these clones and get to the Patto-Factory fast...</desc><surfaces><rect x='-25' y='240' w='50' h='1000' /><!--left wall--><rect x='320' y='480' w='640' h='50' /><!--floor 1--><rect x='880' y='580' w='480' h='50' type='kill' /><rect x='1450' y='480' w='900' h='50' /><!--floor 2--><rect x='2050' y='580' w='300' h='50' type='kill' /><rect x='3200' y='480' w='2000' h='50' /><!--floor 3--><!--bounces--><rect x='480' y='480' w='100' h='50' type='bounce' d='0,15'/><rect x='1200' y='480' w='100' h='50' type='bounce' d='0,20'/><rect x='1800' y='480' w='100' h='50' type='bounce' d='0,15'/><rect x='2450' y='480' w='100' h='50' type='bounce' d='0,20'/><rect x='3050' y='480' w='100' h='50' type='bounce' d='0,20'/><!--tree 1--><rect x='1500' y='290' w='100' h='330' col='884400' /><circ x='1500' y='75' r='100' /><!--tree 2--><rect x='2800' y='305' w='100' h='300' col='994400' /><rect x='2700' y='255' w='200' h='75' col='994400' /><rect x='2875' y='305' w='150' h='75' col='994400' /><!--tree 3--><rect x='3350' y='255' w='100' h='400' col='994400' /><rect x='3250' y='305' w='200' h='75' col='994400' /><rect x='3425' y='255' w='150' h='75' col='994400' /><!--tree 4--><rect x='3900' y='90' w='100' h='730' type='fake' col='884400' /><rect x='3900' y='90' w='100' h='730' col='884400' id='1' /><circ x='3900' y='75' r='100' /></surfaces><objects><exit x='4150' y='240' w='100' h='500' /><graphic id='evening' x='0' y='0' w='1' h='1' r='0' fixed='true' /><patto type='laser' x='480' y='100' minx='0' maxx='1450' int='150' /><patto type='laser' x='1200' y='200' minx='0' maxx='1450' int='180' /><patto type='laser' x='1700' y='150' minx='1610' maxx='4000' int='120' /><patto type='laser' x='2500' y='75' minx='2200' maxx='4000' int='180' /><patto type='laser' x='3000' y='200' minx='2000' maxx='4000' int='150' /><patto type='laser' x='3750' y='100' minx='2000' maxx='4000' int='150' /><patto type='laser' x='3750' y='200' minx='2000' maxx='4000' int='120' /><switch id='1' x='3450' y='370' /><graphic id='window' x='240' y='350' w='20' h='300' behind='true' r='0' /><graphic id='hazard_patto' x='240' y='200' w='1' h='1' r='0' behind='true' /><graphic id='hazard_bounce' x='240' y='320' w='1' h='1' r='0' behind='true' /></objects>"
levels["level6_3"] = "<level grav='3' w='10000' h='480' x='-100' y='300' bg='0080FF' col='00FF00' kill='0000FF' ep='6' lv='3' name='Armada'><desc>You're almost at the Patto-Factory,\n\n\n\nOnce you get there you just need to find a way to shut it down!\n\n\n\nWhat are these hideous abominations? Oh, more pattos...\n\n\n\nThese ones look pretty dangerous though!</desc><surfaces><rect x='-200' y='240' w='50' h='480' r='0' /><!--left wall--><rect x='0' y='400' w='1000' h='200' r='20' /><!--left ramp--><rect x='5000' y='480' w='11000' h='100' r='0' /><!--floor--><rect x='1500' y='480' w='400' h='150' r='0' type='kill' /><rect x='1250' y='480' w='250' h='150' r='160' /><rect x='1750' y='480' w='250' h='150' r='20' /><rect x='2800' y='480' w='500' h='150' r='0' type='kill' /><rect x='2450' y='480' w='250' h='150' r='160' /><rect x='3150' y='480' w='250' h='150' r='20' /><rect x='3900' y='480' w='600' h='150' r='0' type='kill' /><rect x='3500' y='480' w='300' h='150' r='160' /><rect x='4300' y='480' w='300' h='150' r='20' /><rect x='5500' y='480' w='800' h='150' r='0' type='kill' /><rect x='5000' y='480' w='300' h='150' r='160' /><rect x='6000' y='480' w='300' h='150' r='20' /><rect x='7100' y='480' w='1000' h='150' r='0' type='kill' /><rect x='6500' y='480' w='300' h='150' r='160' /><rect x='7700' y='480' w='300' h='150' r='20' /><rect x='8900' y='480' w='1000' h='150' r='0' type='kill' /><rect x='8300' y='480' w='300' h='150' r='160' /><rect x='9500' y='480' w='300' h='150' r='20' /></surfaces><objects><exit x='10250' y='240' w='100' h='1000' /><extra x='4650' y='50' r='50' id='level7_9' /><patto type='kamikaze' x='450' y='200' n='8' /><patto type='kamikaze' x='2000' y='350' n='8' /><patto type='kamikaze' x='4000' y='100' n='8' /><patto type='kamikaze' x='6000' y='350' n='8' /><patto type='kamikaze' x='9000' y='300' n='16' /><graphic id='window' x='480' y='350' w='20' h='300' behind='true' r='0' /><graphic id='hazard_patto' x='480' y='200' w='1' h='1' r='0' behind='true' /><graphic id='hazard_balls' x='480' y='320' w='1' h='1' r='0' behind='true' /></objects>"
levels["level6_4"] = "<level grav='3' w='5500' h='480' x='50' y='410' bg='808080' col='404040' kill='FF0000' bounce='FF0080' smash='996633' ep='6' lv='4' name='Boss #3 ~ MEGAPATTO!'><desc>A giant mutated pattobot is guarding the Patto-Factory!\n\n\n\nMaybe you can find some way of using it to destroy the building?\n\n\n\nOh... and one more thing,\n\n\n\nRUN!!!!!!</desc><surfaces><rect x='1812.5' y='2720' w='5125' h='4580' /><!--top-level left floor--><rect x='2500' y='0' w='6000' h='100' /><!--top-level roof--><rect x='5500' y='240' w='100' h='500' /><!--top-level right wall--><rect x='4625' y='680' w='500' h='100' id='1' /><!--top-level right id--><rect x='6475' y='2500' w='3200' h='4140' /><!--column right wall--><rect x='6175' y='5000' w='2600' h='100' /><!--bottom-level floor--><rect x='5400' y='4760' w='200' h='400' id='2' /><!--bottom-level id--><rect x='8000' y='4760' w='100' h='500' /><!--bottom-level right wall--><!--smashable blocks [top-level]--><rect x='-50' y='440' w='100' h='100' type='smash' /><rect x='50' y='100' w='100' h='100' type='smash' /><rect x='150' y='250' w='100' h='100' type='smash' /><rect x='300' y='150' w='100' h='100' type='smash' /><rect x='425' y='75' w='100' h='100' type='smash' /><rect x='650' y='380' w='100' h='100' type='smash' /><rect x='800' y='120' w='100' h='100' type='smash' /><rect x='910' y='320' w='100' h='100' type='smash' /><rect x='1100' y='160' w='100' h='100' type='smash' /><rect x='1230' y='390' w='100' h='100' type='smash' /><rect x='1600' y='370' w='100' h='100' type='smash' /><rect x='1630' y='260' w='100' h='100' type='smash' /><rect x='1880' y='100' w='100' h='100' type='smash' /><rect x='1940' y='220' w='100' h='100' type='smash' /><rect x='2140' y='170' w='100' h='100' type='smash' /><rect x='2330' y='450' w='100' h='100' type='smash' /><rect x='2500' y='250' w='100' h='100' type='smash' /><rect x='2610' y='270' w='100' h='100' type='smash' /><rect x='2800' y='130' w='100' h='100' type='smash' /><rect x='2860' y='460' w='100' h='100' type='smash' /><rect x='3000' y='260' w='100' h='100' type='smash' /><rect x='3340' y='130' w='100' h='100' type='smash' /><rect x='3350' y='350' w='100' h='100' type='smash' /><rect x='3550' y='170' w='100' h='100' type='smash' /><rect x='3600' y='330' w='100' h='100' type='smash' /><rect x='3940' y='230' w='100' h='100' type='smash' /><rect x='3990' y='360' w='100' h='100' type='smash' /><rect x='4625' y='140' w='50' h='50' type='smash' ghost='true' /><rect x='4625' y='190' w='50' h='50' type='smash' ghost='true' /><rect x='4625' y='240' w='50' h='50' type='smash' ghost='true' /><rect x='4625' y='290' w='50' h='50' type='smash' ghost='true' /><rect x='4625' y='340' w='50' h='50' type='smash' ghost='true' /><rect x='4525' y='240' w='50' h='50' type='smash' ghost='true' /><rect x='4550' y='265' w='50' h='50' type='smash' ghost='true' /><rect x='4575' y='290' w='50' h='50' type='smash' ghost='true' /><rect x='4600' y='315' w='50' h='50' type='smash' ghost='true' /><rect x='4650' y='315' w='50' h='50' type='smash' ghost='true' /><rect x='4675' y='290' w='50' h='50' type='smash' ghost='true' /><rect x='4700' y='265' w='50' h='50' type='smash' ghost='true' /><rect x='4725' y='240' w='50' h='50' type='smash' ghost='true' /><!--smashable blocks [column]--><rect x='4475' y='750' w='100' h='100' type='smash' /><rect x='4800' y='850' w='100' h='100' type='smash' /><rect x='4725' y='700' w='100' h='100' type='smash' /><rect x='4525' y='1000' w='100' h='100' type='smash' /><rect x='4625' y='1000' w='100' h='100' type='smash' /><rect x='4725' y='1000' w='100' h='100' type='smash' /><rect x='4825' y='1000' w='100' h='100' type='smash' /><rect x='4525' y='1050' w='100' h='100' type='smash' /><rect x='4625' y='1050' w='100' h='100' type='smash' /><rect x='4725' y='1050' w='100' h='100' type='smash' /><rect x='4825' y='1050' w='100' h='100' type='smash' /><rect x='4425' y='1400' w='100' h='100' type='smash' /><rect x='4525' y='1400' w='100' h='100' type='smash' /><rect x='4625' y='1400' w='100' h='100' type='smash' /><rect x='4725' y='1400' w='100' h='100' type='smash' /><rect x='4475' y='1425' w='100' h='100' type='smash' /><rect x='4575' y='1425' w='100' h='100' type='smash' /><rect x='4675' y='1425' w='100' h='100' type='smash' /><rect x='4525' y='1800' w='100' h='100' type='smash' /><rect x='4625' y='1800' w='100' h='100' type='smash' /><rect x='4725' y='1800' w='100' h='100' type='smash' /><rect x='4825' y='1800' w='100' h='100' type='smash' /><rect x='4625' y='1810' w='100' h='100' type='smash' /><rect x='4725' y='1810' w='100' h='100' type='smash' /><rect x='4425' y='2200' w='100' h='100' type='smash' /><rect x='4525' y='2200' w='100' h='100' type='smash' /><rect x='4625' y='2200' w='100' h='100' type='smash' /><rect x='4725' y='2200' w='100' h='100' type='smash' /><rect x='4425' y='2600' w='100' h='100' type='smash' /><rect x='4525' y='2650' w='100' h='100' type='smash' /><rect x='4725' y='2650' w='100' h='100' type='smash' /><rect x='4825' y='2600' w='100' h='100' type='smash' /><rect x='4625' y='3000' w='100' h='100' type='smash' /><rect x='4425?4825' y='3200' w='100' h='100' type='smash' /><rect x='4425?4825' y='3300' w='100' h='100' type='smash' /><rect x='4425?4825' y='3400' w='100' h='100' type='smash' /><rect x='4425?4825' y='3500' w='100' h='100' type='smash' /><rect x='4425?4825' y='3600' w='100' h='100' type='smash' /><rect x='4425?4825' y='3700' w='100' h='100' type='smash' /><rect x='4425?4825' y='3800' w='100' h='100' type='smash' /><rect x='4425?4825' y='3900' w='100' h='100' type='smash' /><rect x='4425?4825' y='4000' w='100' h='100' type='smash' /><rect x='4425?4825' y='4100' w='100' h='100' type='smash' /><rect x='4425?4825' y='4200' w='100' h='100' type='smash' /><rect x='4425?4825' y='4300' w='100' h='100' type='smash' /><rect x='4425?4825' y='4400' w='100' h='100' type='smash' /><rect x='4425?4825' y='4500' w='100' h='100' type='smash' /><rect x='4425?4825' y='4600' w='100' h='100' type='smash' /><rect x='4425' y='4950' w='100' h='100' type='smash' /><rect x='4525' y='4950' w='100' h='100' type='smash' /><rect x='4625' y='4950' w='100' h='100' type='smash' /><rect x='4725' y='4950' w='100' h='100' type='smash' /><rect x='4825' y='4950' w='100' h='100' type='smash' /><rect x='4425' y='5000' w='100' h='100' type='smash' /><rect x='4525' y='5000' w='100' h='100' type='smash' /><rect x='4625' y='5000' w='100' h='100' type='smash' /><rect x='4725' y='5000' w='100' h='100' type='smash' /><rect x='4825' y='5000' w='100' h='100' type='smash' /><rect x='4425' y='5050' w='100' h='100' type='smash' /><rect x='4525' y='5050' w='100' h='100' type='smash' /><rect x='4625' y='5050' w='100' h='100' type='smash' /><rect x='4725' y='5050' w='100' h='100' type='smash' /><rect x='4825' y='5050' w='100' h='100' type='smash' /><!--smashable blocks [bottom-level]--><rect x='5650' y='4700' w='100' h='100' type='smash' /><rect x='5850' y='4900' w='100' h='100' type='smash' /><rect x='6000' y='4620' w='100' h='100' type='smash' /><rect x='6200' y='4680' w='100' h='100' type='smash' /><rect x='6400' y='4900' w='100' h='100' type='smash' /><rect x='6600' y='4710' w='100' h='100' type='smash' /><rect x='6950' y='4630' w='100' h='100' type='smash' /><rect x='7100' y='4810' w='100' h='100' type='smash' /><rect x='7250' y='4870' w='100' h='100' type='smash' /><!--bouncers [top-level]--><rect x='400' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='1050' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='1450' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='2200' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='2700' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='3200' y='480' w='100' h='100' type='bounce' d='0,20' /><rect x='3800' y='480' w='100' h='100' type='bounce' d='0,20' /><!--bouncers & kills [bottom-level]--><rect x='5700' y='5000' w='100' h='100' type='bounce' d='0,20' /><rect x='6000' y='5000' w='200' h='100' type='kill' /><rect x='6250' y='5000' w='100' h='100' type='bounce' d='0,20' /><rect x='6450' y='4520' w='300' h='100' type='kill' /><rect x='6750' y='5000' w='100' h='100' type='bounce' d='45,20' /><rect x='7100' y='5000' w='500' h='100' type='kill' /></surfaces><objects><boss id='megapatto' x='-300' y='240' /><extra x='5150' y='240' r='100' id='skin1' /><graphic id='hazard_lava' x='5100' y='4810' w='1' h='1' behind='true' /><graphic id='hazard_patto' x='480' y='300' w='1' h='1' r='20' behind='true' /><graphic id='hazard_bounce' x='1400' y='200' w='1' h='1' r='320' behind='true' /><graphic id='arrow' x='2300' y='250' w='1' h='1' r='45' behind='true' /><graphic id='arrow' x='4375' y='240' w='1' h='1' r='180' behind='true' /><graphic id='arrow' x='4875' y='240' w='1' h='1' r='180' behind='true' /><graphic id='arrow' x='4625' y='1200' w='1' h='1' r='135' behind='true' /><graphic id='arrow' x='4625' y='1200' w='1' h='1' r='135' behind='true' /><graphic id='arrow' x='4625' y='1600' w='1' h='1' r='225' behind='true' /><graphic id='arrow' x='4625' y='2000' w='1' h='1' r='135' behind='true' /><graphic id='arrow' x='4625' y='2400' w='1' h='1' r='180' behind='true' /><graphic id='arrow' x='4625' y='4810' w='1' h='1' r='90' behind='true' /><graphic id='arrow' x='5650' y='4900' w='1' h='1' r='45' behind='true' /><graphic id='arrow' x='5850' y='4760' w='1' h='1' r='100' behind='true' /><graphic id='arrow' x='6050' y='4820' w='1' h='1' r='120' behind='true' /><graphic id='arrow' x='6260' y='4820' w='1' h='1' r='45' behind='true' /><graphic id='arrow' x='6480' y='4790' w='1' h='1' r='135' behind='true' /><graphic id='arrow' x='6850' y='4850' w='1' h='1' r='50' behind='true' /></objects></level>"
levels["bonus1"] = "<level grav='3' w='3000' h='960' x='110' y='-40' bg='224466' col='664422' kill='FF0000' bounce='FF0080' vine='226644' ep='7' lv='1' name='Jungle Hi-jinx'><desc>Welcome to Patto's real home!\n\n\n\nEr, yes, he does live in the jungle (sorry if you thought he lived in a bin)</desc><surfaces><rect x='0' y='475' w='100' h='970' /><rect x='0' y='960' w='300' h='300' r='45' /><rect x='320' y='960' w='640' h='100' /><rect x='900' y='850' w='620' h='240' /><rect x='640' y='860' w='100' h='100' type='bounce' d='315,20' /><rect x='2800' y='570' w='500' h='800' /><vine x='320' y='-10' l='600' n='10' s='.5' /><vine x='1800' y='-10' l='750' n='20' s='.8' /><rect x='1500' y='1300' w='3000' h='100' type='kill' /></surfaces><objects><exit x='3200' y='480' w='100' h='1000' /></objects></level>"
levels["bonus2"] = "<level grav='3' w='2000' h='10000' x='1000' y='9940' bg='FF80C0' col='FF0080' kill='FF0000' bounce='FF0080' ep='7' lv='2' name='Jumping Castle'><desc>How high can you bounce?\n\n\n\nCan you reach the top?</desc><surfaces><rect x='1000' y='10000' w='2000' h='100' type='bounce' d='0,10' r='0' /><!--floor--><rect x='0' y='0' w='100' h='20020' type='bounce' d='90,20' r='0' /><!--left wall--><rect x='2000' y='0' w='100' h='20020' type='bounce' d='270,20' r='0' /><!--right wall--><!--bouncey circles lol--><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100?1900' y='100?9900' r='50' type='bounce' d='0, 20' /><circ x='100' y='9950' r='100' type='fake' col='FF0080' /><circ x='300' y='9950' r='100' type='fake' col='FF0080' /><circ x='500' y='9950' r='100' type='fake' col='FF0080' /><circ x='700' y='9950' r='100' type='fake' col='FF0080' /><circ x='900' y='9950' r='100' type='fake' col='FF0080' /><circ x='1100' y='9950' r='100' type='fake' col='FF0080' /><circ x='1300' y='9950' r='100' type='fake' col='FF0080' /><circ x='1500' y='9950' r='100' type='fake' col='FF0080' /><circ x='1700' y='9950' r='100' type='fake' col='FF0080' /><circ x='1900' y='9950' r='100' type='fake' col='FF0080' /></surfaces><objects><exit x='1000' y='-500' w='2000' h='200' /></objects></level>"
levels["bonus3"] = "<level grav='3' w='1400' h='1120' x='180' y='-40' bg='8080FF' col='808080' kill='FF0000' bounce='FF0080' ep='7' lv='3' name='Skate Park'><desc>What does the Pattomobile do when not transporting Patto?\n\n\n\nSkate, of course!</desc><surfaces><rect x='60' y='855' w='120' h='310' /><rect x='580' y='855' w='120' h='310' /><rect x='320' y='1050' w='640' h='260' /><rect x='120' y='920' w='160' h='160' r='45' /><rect x='520' y='920' w='160' h='160' r='-45' /><halfpipe x='320' y='720' w='40' h='20' r='200' n='20' s='270' e='450' /><rect x='640' y='1120' w='300' h='275' r='45' /><rect x='1280' y='1120' w='300' h='275' r='-45' /><halfpipe x='960' y='800' w='40' h='40' r='320' n='40' s='270' e='450' /><rect x='1340' y='560' w='120' h='10000' /><rect x='60' y='555' w='120' h='10000' id='1' /><rect x='60' y='555' w='120' h='10000' id='2' /><rect x='1305' y='800' w='50' h='50' type='bounce' d='0,10' /></surfaces><objects><switch x='320' y='420' id='1' /><switch x='960' y='420' id='2' /><exit x='-100' y='640' w='200' h='1120' /></objects></level>"
levels["bonus4"] = "<level grav='3' w='2000' h='2000' x='110' y='-400' px='210' py='1900' bg='C0C0C0' col='808080' kill='FF0000' bounce='FF0080' ep='7' lv='4' name='This is just getting ridiculous!'><desc>The most hated enemy in the game wants revenge...\n\n\n\nGuide patto through this maze of randomly placed red balls of lava!\n\n\n\nYou'll need some l33t flying skills to get past this level.\n\n\n\n(And don't blame me if you get RSI from doing this...)</desc><surfaces><rect x='0' y='850' w='100' h='2600' /><rect x='220' y='-250' w='100' h='400' /><rect x='2000' y='1000' w='100' h='2020' /><rect x='1085' y='0' w='1830' h='100' /><rect x='110' y='-500' w='320' h='100' /><rect x='1085' y='2050' w='1830' h='200' /><rect x='110' y='1000' w='120' h='1400' id='1' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' /><circ x='1000?1800' y='100?1000' r='25' type='kill' /><circ x='200?1000' y='1000?1900' r='25' type='kill' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /><circ x='200?1000' y='100?1000' r='25' type='kill' id='-1' /><circ x='1000?1800' y='100?1000' r='25' type='kill' id='-1' /><circ x='200?1000' y='1000?1900' r='25' type='kill' id='-1' /><circ x='1000?1800' y='1000?1900' r='25' type='kill' id='-1' /></surfaces><objects><exit x='110' y='2200' w='100' h='50' /><switch x='1900' y='1000' id='1' /></objects></level>"
levels["bonus5"] = "<level grav='1' w='1920' h='960' x='320' y='720' px='1600' py='720' bg='000000' col='808080' kill='FF0000' bounce='FF0080' move='FF0000' ep='7' lv='5' name='Anti-gravity Chamber'><desc>The rematch of the century!\n\n\n\nCan you defeat the Blue Ghost Minion again?\n\n\n\nThis low-gravity means the Pattomobile can fly!</desc><surfaces><rect x='0' y='2010' w='100' h='2000' /><rect x='1920' y='2010' w='100' h='2000' /><rect x='960' y='3060' w='1920' h='100' /><!--room #1: Pattomobile start (640x480)--><rect x='0' y='720' w='100' h='480' /><rect x='640' y='575' w='100' h='190' /><rect x='640' y='720' w='100' h='100' id='5' /><rect x='640' y='890' w='100' h='240' /><rect x='135' y='480' w='270' h='100' /><rect x='320' y='480' w='100' h='100' id='3' /><rect x='505' y='480' w='270' h='100' /><rect x='320' y='960' w='640' h='100' /><!--room #2: Patto start (640x480)--><rect x='1920' y='720' w='100' h='480' /><rect x='1280' y='575' w='100' h='190' /><rect x='1280' y='720' w='100' h='100' id='1' /><rect x='1280' y='890' w='100' h='240' /><rect x='1600' y='480' w='640' h='100' /><rect x='1600' y='960' w='640' h='100' /><!--room #3: Balls of Death (640x480)--><rect x='775' y='480' w='270' h='100' /><rect x='960' y='480' w='100' h='100' id='2' /><rect x='1145' y='480' w='270' h='100' /><circ x='690?1230' y='530?910' r='25' type='kill' id='5' /><circ x='1100?1230' y='530?670' r='25' type='kill' id='5' /><circ x='690?910' y='530?910' r='25' type='kill' id='5' /><circ x='690?1230' y='770?910' r='25' type='kill' id='5' /><circ x='1100?1230' y='530?670' r='25' type='kill' id='5' /><circ x='690?910' y='530?910' r='25' type='kill' id='5' /><circ x='690?1230' y='770?910' r='25' type='kill' id='5' /><circ x='1100?1230' y='530?670' r='25' type='kill' id='5' /><circ x='690?910' y='530?910' r='25' type='kill' id='5' /><circ x='690?1230' y='770?910' r='25' type='kill' id='5' /><rect x='960' y='960' w='540' h='100' type='kill' id='5' /><!--room #4: Switch #3 (640x480)--><rect x='640' y='240' w='100' h='480' /><rect x='1280' y='95' w='100' h='190' /><rect x='1280' y='240' w='100' h='100' id='4' /><rect x='1280' y='385' w='100' h='190' /><rect x='960' y='0' w='640' h='100' /><!--room #5: Switch #4 (640x480)--><rect x='0' y='240' w='100' h='480' /><rect x='320' y='0' w='640' h='100' /><move x='75?565' y='230' w='50' h='50' r='0' type='rect' minx='75' maxx='565' miny='320' maxy='320' d='90' s='3' m='reverse' /><move x='75?565' y='310' w='50' h='50' r='0' type='rect' minx='75' maxx='565' miny='320' maxy='320' d='90' s='-4' m='reverse' /><move x='75?565' y='390' w='50' h='50' r='0' type='rect' minx='75' maxx='565' miny='320' maxy='320' d='90' s='2' m='reverse' /><!--room #6: Switch #5 (640x480)--><rect x='1600' y='0' w='640' h='100' /><rect x='1920' y='240' w='100' h='480' /><move x='1355?1845' y='160' w='50' h='50' r='0' type='rect' minx='1355' maxx='1845' miny='75' maxy='405' d='45' s='4' m='reverse' /><move x='1355?1845' y='320' w='50' h='50' r='0' type='rect' minx='1355' maxx='1845' miny='75' maxy='405' d='45' s='3' m='reverse' /></surfaces><objects><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='star' x='0?640' y='0?480' w='1' h='1' fixed='true' /><graphic id='moon' x='160' y='150' w='1' h='1' fixed='true' /><boss x='960' y='720' id='bgm' t='5'/><switch x='320' y='620' id='1' /><switch x='1600' y='620' id='2' /><switch x='960' y='140' id='3' /><switch x='320' y='140' id='4' /><switch x='1600' y='240' id='5' /></objects></level>"
levels["bonus6"] = "<level grav='3' w='6000' h='2000' x='160' y='-120' bg='00C0F0' col='0080FF' kill='FF0000' bounce='FF0080' hover='0080FF' ep='7' lv='6' name='Mmmm... Squishy stuff!'><desc>OK, so maybe i've gone a bit overboard with the physics...\n\n\n\nBut it's so much fun!</desc><surfaces><squish s='.5'><p x='-100' y='100' /><p x='0' y='150' /><p x='50' y='225' /><p x='100' y='300' /><p x='150' y='350' /><p x='200' y='450' /><p x='300' y='550' /><p x='400' y='600' /><p x='450' y='650' /><p x='550' y='750' /><p x='650' y='800' /><p x='700' y='800' /><p x='800' y='800' /><p x='910' y='750' /><p x='1000' y='650' /><p x='1100' y='700' /><p x='1200' y='700' /><p x='1300' y='750' /><p x='1400' y='850' /><p x='1500' y='900' /><p x='1600' y='950' /><p x='1700' y='1050' /><p x='1800' y='1150' /><p x='1900' y='1300' /><p x='2000' y='1400' /><p x='1950' y='1550' /><p x='1850' y='1650' /><p x='1700' y='1700' /><p x='1550' y='1750' /><p x='1200' y='1650' /><p x='1000' y='1600' /><p x='850' y='1450' /><p x='600' y='1350' /><p x='400' y='1250' /><p x='250' y='1000' /><p x='100' y='800' /><p x='-50' y='650' /><p x='-100' y='450' /><p x='-150' y='200' /></squish><squish s='.5' ><p x='2300' y='1600' /><p x='2400' y='1550' /><p x='2500' y='1550' /><p x='2600' y='1650' /><p x='2650' y='1750' /><p x='2550' y='1700' /><p x='2450' y='1650' /></squish><squish s='.5' ><p x='2800' y='1950' /><p x='2900' y='1900' /><p x='3000' y='1850' /><p x='3100' y='1850' /><p x='3250' y='1875' /><p x='3150' y='1900' /><p x='3050' y='1900' /><p x='2950' y='1950' /></squish><squish s='.5' ><p x='3400' y='2000' /><p x='3500' y='1950' /><p x='3600' y='1900' /><p x='3700' y='1850' /><p x='3800' y='1800' /><p x='3900' y='1750' /><p x='4000' y='1700' /><p x='4100' y='1700' /><p x='4200' y='1800' /><p x='4100' y='2000' /><p x='3800' y='2200' /><p x='3600' y='2100' /></squish><squish s='.02' ><p x='4400' y='1900' /><p x='4500' y='1900' /><p x='4600' y='1900' /><p x='4700' y='1900' /><p x='4800' y='1900' /><p x='4900' y='1900' /><p x='5000' y='1900' /><p x='5100' y='1900' /><p x='5200' y='1900' /><p x='5300' y='1900' /><p x='5400' y='1900' /><p x='5500' y='1900' /><p x='5600' y='1900' /><p x='5700' y='1900' /><p x='5800' y='1900' /><p x='5900' y='1900' /><p x='6000' y='1900' /><p x='6100' y='1900' /><p x='6100' y='2000' /><p x='4400' y='2000' /></squish><rect x='3000' y='3000' w='10000' h='100' type='kill' /></surfaces><objects><exit x='6200' y='1000' w='100' h='2020' /></objects></level>"
levels["bonus7"] = "<level grav='3' w='3000' h='10000' x='1500' y='9930' px='1500' py='100' bg='000040' col='008000' kill='FF0000' fake='004000' bounce='FF0080' ep='7' lv='7' name='It's raining Patto'><desc>Patto's are falling from the sky!\n\n\n\nIt the end of the world as we know it...\n\n\n\nThe only way to survive is by escape!</desc><surfaces><rect x='1500' y='10450' w='3000' h='1000' ghost='true' /><!--floor--><rect x='1500' y='-450' w='3000' h='1000' ghost='true' /><!--roof--><rect x='1500' y='10000' w='3000' h='80' type='bounce' d='0,20' /><!--bouncey floor--><rect x='-450' y='0' w='1000' h='20020' /><!--left wall--><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /><rect x='3450' y='0' w='1000' h='20020' type='kill' /></surfaces><objects><exit x='3200' y='5000' w='200' h='10020' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /><patto type='bounce' x='100?1900' y='100?9900' vx='0' vy='0' /></objects></level>"
levels["bonus8"] = "<level grav='3' w='6000' h='2000' x='240' y='240' bg='404040' col='808080' fake='FF0000' kill='FF0000' bounce='FF0080' ep='7' lv='8' name='Catch a Ride'><desc>Feeling tired?\n\n\n\nThen hop on top of a Pattobot and let them do all the work!</desc><surfaces><rect x='0' y='1000' w='100' h='2020' /><rect x='6000' y='1305' w='100' h='1410' /><rect x='240' y='285' w='480' h='50' /><rect x='240' y='1155' w='320' h='1690' type='fake' /><rect x='1760' y='375' w='480' h='50' /><rect x='1760' y='1200' w='320' h='1600' type='fake' /><rect x='4000' y='465' w='480' h='50' /><rect x='4000' y='1290' w='320' h='1600' type='fake' /><rect x='5000' y='2000' w='10000' h='100' type='kill' /></surfaces><objects><patto type='laser' x='800' y='340' minx='0' maxx='1600' int='10000' /><patto type='laser' x='2320' y='430' minx='1250' maxx='4000' int='10000' /><patto type='laser' x='4560' y='520' minx='3500' maxx='6500' int='10000' /><graphic id='hazard_lava' x='240' y='160' w='1' h='1' behind='true' /><graphic id='hazard_patto' x='480' y='160' w='1' h='1' behind='true' /><exit x='6200' y='1000' w='200' h='2020' /></objects></level>"
levels["bonus9"] = "<level grav='3' w='6000' h='3000' x='320' y='240' bg='664422' col='996633' fake='FF0000' kill='FF0000' hover='0080FF' bounce='FF0080' ep='7' lv='9' name='When the laws of physics go out the window'><desc>What do you get when I mess around with the physics in Pattomobile?\n\n\n\nA level full of wierd objects that do impossible things!\n\n\n\nAs this level is highly experimental,\n\n\n\ndon't expect everything to work perfectly or even be remotely realistic.</desc><surfaces><rect x='0' y='1500' w='100' h='3020' /><rect x='6000' y='-4285' w='100' h='11470' /><rect x='6000' y='2510' w='100' h='1420' /><circ x='6000' y='1800' r='50' /><rect x='500' y='1400' w='1000' h='100' /><rect x='320' y='1375' w='200' h='50' r='0' type='hover' d='0,.5,500' /><rect x='3000' y='1400' w='2000' h='100' /><rect x='3000' y='1375' w='1000' h='50' r='0' type='hover' d='0,.5,1000' /><bridge x='1168' y='1460' x2='1833' y2='1460' n='16' s='.8' /><rect x='1058' y='1450' w='200' h='115' r='30' type='hover' d='30,.5,500' /><rect x='1942' y='1450' w='200' h='115' r='330' type='hover' d='330,.5,500' /><bridge x='4168' y='1660' x2='5833' y2='1460' n='16' s='.7' /><rect x='4058' y='1450' w='200' h='115' r='30' type='hover' d='30,.5,500' /><rect x='5942' y='1450' w='200' h='115' r='330' type='hover' d='330,.5,500' /><vine x='5885' y='1500' l='200' n='16' s='.8' col='0080FF' /><bridge x='2040' y='1840' x2='3928' y2='1700' n='32' s='1' /><vine x='4068' y='1700' l='800' n='32' s='.8' /><rect x='4068' y='1700' w='200' h='100' /><circ x='4168' y='1700' r='50' /><circ x='3968' y='1700' r='50' /><vine x='1900' y='1840' l='800' n='16' s='.5' /><rect x='1900' y='1840' w='200' h='100' /><circ x='2000' y='1840' r='50' /><circ x='1800' y='1840' r='50' /><squish s='0.5'><p x='1800' y='1810' /><p x='1700' y='1860' /><p x='1600' y='1900' /><p x='1500' y='1950' /><p x='1400' y='2010' /><p x='1300' y='2080' /><p x='1200' y='2140' /><p x='1100' y='2220' /><p x='1000' y='2310' /><p x='900' y='2360' /><p x='800' y='2400' /><p x='700' y='2440' /><p x='600' y='2470' /><p x='500' y='2500' /><p x='450' y='2550' /><p x='440' y='2650' /><p x='500' y='2750' /><p x='600' y='2800' /><p x='800' y='2850' /><p x='1200' y='2850' /><p x='1450' y='2800' /><p x='1650' y='2500' /><p x='1800' y='2000' /><p x='1900' y='1800' /></squish><squish s='0.2'><p x='-50' y='2700' /><p x='100' y='2800' /><p x='200' y='2850' /><p x='250' y='2950' /><p x='300' y='3000' /><p x='300' y='3100' /><p x='200' y='3200' /><p x='100' y='3300' /><p x='50' y='3400' /><p x='-50' y='3050' /></squish><rect x='3000' y='3200' w='6000' h='50' r='0' type='hover' d='0,.3,500' /></surfaces><objects><graphic id='hazard' x='160' y='160' w='1' h='1' behind='true' /><graphic id='hazard' x='480' y='160' w='1' h='1' behind='true' /><graphic id='hazard' x='160' y='640' w='1' h='1' behind='true' /><graphic id='hazard' x='480' y='640' w='1' h='1' behind='true' /><graphic id='hazard' x='160' y='1120' w='1' h='1' behind='true' /><graphic id='hazard' x='480' y='1120' w='1' h='1' behind='true' /><graphic id='hazard' x='2750' y='160' w='1' h='1' behind='true' /><graphic id='hazard' x='3250' y='160' w='1' h='1' behind='true' /><graphic id='hazard' x='2750' y='640' w='1' h='1' behind='true' /><graphic id='hazard' x='3250' y='640' w='1' h='1' behind='true' /><graphic id='hazard' x='2750' y='1120' w='1' h='1' behind='true' /><graphic id='hazard' x='3250' y='1120' w='1' h='1' behind='true' /><graphic id='arrow' x='5800' y='1750' w='1' h='1' r='45' behind='true' /><exit x='6200' y='1000' w='200' h='2020' /></objects></level>"

import org.cove.ape.*
import DBK.Global
import DBK.EncDec

stop()
Global.global.hideBananaMaker()

var level,car,lwidth,lheight,surfaces,objects,info,bg,behind,patto,best_txt,time_txt,tfb,tft,os,ss,id,tmpG
var pregame:Boolean = true
Global.global.paused = true
Global.global.debug = false

function loadLevel () {
	try {
		level = Global.global.level = XML(levels[data])
	} catch (error:Error) {
		returnToMenu()
		alert("XML Parser - "+error.message.split(" ")[1].split(":")[0], "The XML Parser has encountered a fatal error while trying to parse \""+data+".xml\":\n\nThe Document may be malformed or contain invalid data, please reinstall the application.")
		return
	}
	
	try {
		if (Global.global.replay) {
			RandomSeed.reseed(Global.global.rpd.split(":")[0])
			Global.global.frame = 0
			Global.global.data = Global.global.rpd.split(":")[1].split("")
			Global.global.fdata = getReplayBinary(Global.global.data[0])
		} else {
			Global.global.rpd = RandomSeed.reseed(Math.random() * RandomSeed.LIMIT) + ":"
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Init Replays - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the replay system was being initialised.\n\nThis is probably due to invalid or corrupted replay data.", true)
		return
	}

	try {
		lwidth = level.@w
		lheight = level.@h
		stage.frameRate = 180 / checkData("speed", 3)
		APEngine.init(1 / 3)
		APEngine.container = new Sprite()
		APEngine.addMasslessForce(new Vector(0,level.@grav))
		
		Global.global.fixed = new Group(false)
		Global.global.mobile = new Group(true)
		Global.global.mobile.addCollidable(Global.global.fixed)
		APEngine.addGroup(Global.global.fixed)
		APEngine.addGroup(Global.global.mobile)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Physics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the APE physics was being initialised.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		bg = new Sprite()
		bg.graphics.beginFill(Number("0x"+level.@bg))
		bg.graphics.drawRect(0,-10,640,500)
		bg.graphics.endFill()
		addChild(bg)
		behind = new Sprite()
		addChild(behind)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Graphics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the graphics were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		car = new Car(level.@x, level.@y)
		addChild(car)
		if (level.@px.toString() != "" && level.@py.toString() != "") {
			patto = new Patto(level.@px, level.@py)
			addChild(patto)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Car/Patto - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to create the 'Car' or 'Patto' object.\n\nThis is most likely a problem with the level data.", true)
		return
	}
	
	try {
		surfaces = new Sprite()
		addChild(surfaces)
		objects = new Sprite()
		addChild(objects)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Graphics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the graphics were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		ss = level.surfaces.children()
		for each (id in ss) {
			if (id.@x.toString() != "") {
				if (id.@x.indexOf("?") != -1) id.@x = Number(id.@x.split("?")[0]) + RandomSeed.nextFloat() * (id.@x.split("?")[1] - id.@x.split("?")[0])
			}
			if (id.@y.toString() != "") {
				if (id.@y.indexOf("?") != -1) id.@y = Number(id.@y.split("?")[0]) + RandomSeed.nextFloat() * (id.@y.split("?")[1] - id.@y.split("?")[0])
			}
			switch (String(id.name())) {
				case "rect":
					surfaces.addChild(new RectangleSurface(id.@x,id.@y,id.@w,id.@h,id.@r,(id.@col.toString()=="")?((id.@type.toString()=="") ? level.@col : level.attribute(id.@type.toString())) : id.@col, id.@type, id.@f, id.@ghost.toString() == "true", id.@d, id.@id))
					break
				case "circ":
					surfaces.addChild(new CircleSurface(id.@x,id.@y,id.@r,(id.@col.toString()=="")?((id.@type.toString()=="") ? level.@col : level.attribute(id.@type.toString())) : id.@col,id.@type,id.@f,id.@ghost.toString() == "true",id.@d,id.@id))
					break
				case "move":
					switch (id.@type.toString()) {
						case "rect":
							surfaces.addChild(new MoveRectangle(id.@x,id.@y,id.@w,id.@h,id.@r, id.@col.toString() == "" ? level.@move : id.@col, id.@minx, id.@maxx, id.@miny, id.@maxy, id.@d, id.@s, id.@m, id.@id))
							break
					}
					break
				case "bridge":
					surfaces.addChild(new Bridge(id.@x,id.@y,id.@x2,id.@y2,id.@n,id.@s,(id.@col.toString()=="") ? (level.@bridge.toString()=="" ? level.@col : level.@bridge) : id.@col))
					break
				case "squish":
					surfaces.addChild(new Squish(id.children(),id.@s,(id.@col.toString()=="") ? (level.@squish.toString()=="" ? level.@col : level.@squish) : id.@col))
					break
				case "vine":
					surfaces.addChild(new Vine(id.@x,id.@y,id.@l,id.@n,id.@s,(id.@col.toString()=="") ? (level.@vine.toString()=="" ? level.@col : level.@vine) : id.@col))
					break
				case "halfpipe":
					surfaces.addChild(new Halfpipe(id.@x,id.@y,id.@r,id.@s*Math.PI/180,id.@e*Math.PI/180,id.@n,id.@w,id.@h,(id.@col.toString()=="") ? (level.@halfpipe.toString()=="" ? level.@col : level.@halfpipe) : id.@col))
					break
			}
		}
		Global.global.fixed._particles.sort(arrangeParticles)
	} catch (error:Error) {
		returnToMenu()
		alert("Surfaces - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while surfaces were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		os = level.objects.children()
		for each (id in os) {
			if (id.@x.toString() != "") {
				if (id.@x.indexOf("?") != -1) id.@x = Number(id.@x.split("?")[0]) + RandomSeed.nextFloat() * (id.@x.split("?")[1] - id.@x.split("?")[0])
			}
			if (id.@y.toString() != "") {
				if (id.@y.indexOf("?") != -1) id.@y = Number(id.@y.split("?")[0]) + RandomSeed.nextFloat() * (id.@y.split("?")[1] - id.@y.split("?")[0])
			}
			switch (String(id.name())) {
				case "exit":
					objects.addChild(new Exit(id.@x,id.@y,id.@w,id.@h,id.@r))
					break
				case "switch":
					objects.addChild(new Switch(id.@x,id.@y,id.@id))
					break
				case "extra":
					if (! checkData(id.@id.toString(), false)) {
						objects.addChild(new Extra(id.@x,id.@y,id.@r,id.@id))
					}
					break
				case "graphic":
					tmpG = getGraphic(id.@id)
					tmpG.x = id.@x
					tmpG.y = id.@y
					tmpG.scaleX = id.@w
					tmpG.scaleY = id.@h
					tmpG.rotation = id.@r
					if (id.@fixed.toString() == "true") {
						bg.addChild(tmpG)
					} else if (id.@behind.toString() == "true") {
						behind.addChild(tmpG)
					} else {
						objects.addChild(tmpG)
					}
					break
				case "boss":
					switch (String(id.@id)) {
						case "bgm":
							objects.addChild(new BGM(id.@x,id.@y,id.@t))
							break
						case "mnm":
							objects.addChild(new MNM(id.@x,id.@y,bg))
							break
						case "megapatto":
							objects.addChild(new MegaPatto(id.@x,id.@y))
							break
					}
					break
				case "patto":
					switch (String(id.@type)) {
						case "bounce":
							objects.addChild(new BouncePatto(id.@x,id.@y,id.@vx,id.@vy))
							break
						case "laser":
							objects.addChild(new LaserPatto(id.@x,id.@y,id.@minx,id.@maxx,id.@int))
							break
						case "kamikaze":
							objects.addChild(new KamikazePatto(id.@x,id.@y,id.@n))
							break
					}
					break
			}
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Objects - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while objects were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		if (getData("level6_4") == "beaten") {
			tfb = new TextFormat("Tahoma",16,Number("0x"+level.@txtcol),false,false,false,null,null,TextFormatAlign.LEFT)
			tft = new TextFormat("Tahoma",16,Number("0x"+level.@txtcol),false,false,false,null,null,TextFormatAlign.RIGHT)
			best_txt = new TextField()
			time_txt = new TextField()
			best_txt.height = time_txt.height = 24
			best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480))) + 456
			best_txt.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
			time_txt.x = best_txt.x + 540
			best_txt.defaultTextFormat = tfb
			time_txt.defaultTextFormat = tft
			best_txt.text = formatTime(checkData("time_" + data, 3599999))
			time_txt.text = formatTime(0)
			addChild(best_txt)
			addChild(time_txt)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Time Trial - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to setup Time Trial Mode.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		if (pregame) {
			info = new Info(level.@ep, level.@lv, level.@name, level.desc, so)
			info.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640))) + 320
			info.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480))) + 240
			addChild(info)
		} else {
			setupListen()
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Pregame Info - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to display Pregame Info.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey)
		if (car != null) {
			car.addEvent("kill", death)
			car.addEvent("exit", exit)
			if (! Global.global.replay) car.addEvent("extra", extra)
		}
		if (patto != null) {
			patto.addEvent("kill", death)
			patto.addEvent("exit", exit)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Event Setup - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to setup event listeners.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		bg.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
		bg.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480)))
		x = Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
		y = Math.min(0, Math.max(240 - level.@y, -(lheight - 480)))
	} catch (error:Error) {
		returnToMenu()
		alert("Scrolling - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to scroll the screen???\n\n(No trobleshooting info availiable!)", true)
		return
	}
}

function death (event:Event) {
	if (! Global.global.replay && getData("rp_death")) {
		saveReplay("Death")
	}
	resetLevel()
	loadLevel()
}

function exit (event:Event) {
	if (event.s.type == "patto") {
		removeChild(patto)
		patto.cleanup()
		patto = null
		if (car != null)  {
			car.control = true
		}
	} else if (event.s.type == "car") {
		removeChild(car)
		car.cleanup()
		car = null
		if (patto != null) {
			patto.control = true
		}
	}
	if (car == null && patto == null) {
		if (Global.global.replay) {
			resetLevel()
			loadLevel()
			return
		}
		if (Global.global.time < getData("time_"+data)) {
			setData("time_"+data, Global.global.time)
			saveReplay("Record")
		} else if (getData("rp_win")) {
			saveReplay("Win")
		}
		resetLevel()
		if (getData("speed") == 3) {
			if (data.substr(0, 5) == "bonus") {
				if (getData(data) != "beaten") {
					setData(data, "beaten")
					if (getData("bonus1") == "beaten" && getData("bonus2") == "beaten" && getData("bonus3") == "beaten" && getData("bonus4") == "beaten" && getData("bonus5") == "beaten" && getData("bonus6") == "beaten" && getData("bonus7") == "beaten" && getData("bonus8") == "beaten" && getData("bonus9") == "beaten") {
						setData("bonus", true)
						Global.global.bananaMaker = new BananaMaker()
						returnToMenu()
						alert("All Bonuses Beaten!", "Congratulations!\n\nYou've beaten every bonus level, and unlocked a final bonus skin and cutscene!")
					} else {
						returnToMenu()
					}
				} else {
					returnToMenu()
				}
			} else {
				var w:Number = data.substr(5, 1)
				var l:Number = data.substr(7, 1)
				if (l == 4) {
					if (getData("level"+(w+1)+"_1") == "locked") {
						setData("level"+(w+1)+"_1", "unbeaten")
					}
				} else {
					if (getData("level"+w+"_"+(l+1)) == "locked") {
						setData("level"+w+"_"+(l+1), "unbeaten")
					}
				}
			
				if (getData(data) != "beaten") {
					setData(data, "beaten")
					playCutscene(w, l)
				} else {
					returnToMenu()
				}
			}
		} else {
			returnToMenu()
		}
	}
}

function extra (event:Event) {
	if (getData("speed") == 3) {
		setData(event.p.data, true)
		event.p.dispatchEvent(new Event("collect"))
		Global.global.fixed.removeParticle(event.p)
	}
}

function run (event:Event):void {
	try {
	if (car != null && ! (Global.global.debug && Global.global.replay)) {
		if (car.control) {
			bg.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		} else {
			bg.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		}
	} else if (patto != null && ! (Global.global.debug && Global.global.replay)) {
		if (! patto.control) {
			bg.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		} else {
			bg.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		}
	}
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Scrolling - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured while trying to scroll the screen???\n\n(No trobleshooting info availiable!)")
		return
	}
	
	try {
		APEngine.step()
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Physics Step - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured during physics and collision checking. \n\n(No trobleshooting info availiable!)")
		return
	}
	
	try {
	if (Global.global.replay) {
		Global.global.frame++
		if (Global.global.frame >= Global.global.data.length) {
			resetLevel()
			loadLevel()
			return
		}
		Global.global.fdata = getReplayBinary(Global.global.data[Global.global.frame])
		if (Global.global.fdata[4] == "1" && getReplayBinary(Global.global.data[Global.global.frame-1])[4] == "0") {
			car.control = ! car.control
			patto.control = ! patto.control
		}
		if (getData("level6_4") == "beaten") {
			Global.global.time = (Global.global.frame + 1) * 1000 / 60
			time_txt.text = formatTime(Global.global.time)
		}
	} else {
		Global.global.rpd += String.fromCharCode(recordKey("key1") + recordKey("key2") * 2 + recordKey("key3") * 4 + recordKey("key4") * 8 + recordKey("key7") * 16 + recordKey("key10") * 32)
		if (getData("level6_4") == "beaten") {
			Global.global.time = (Global.global.rpd.length - (Global.global.rpd.indexOf(":") + 1)) * 1000 / 60
			time_txt.text = formatTime(Global.global.time)
		}
	}
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Replay Step - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured while trying to read or write replay data.\n\nProbably due to invalid or corrupted replay data.")
		return
	}
}

function recordKey (key:String) {
	return Global.global.key.isDown(getData(key)) ? 1 : 0
}

function getReplayBinary(ch:String) {
	var code = ch.charCodeAt(0)
	var bin = []
	bin[5] = Math.floor(code/32)
	code -= bin[5] * 32
	bin[4] = Math.floor(code/16)
	code -= bin[4] * 16
	bin[3] = Math.floor(code/8)
	code -= bin[3] * 8
	bin[2] = Math.floor(code/4)
	code -= bin[2] * 4
	bin[1] = Math.floor(code/2)
	code -= bin[1] * 2
	bin[0] = code
	return bin
}

function pressKey (event:KeyboardEvent) {
	if (event.keyCode == checkData("key6", Keyboard.ESCAPE) && ! pregame && ! Global.global.paused) {
		if (! Global.global.replay && getData("rp_exit")) {
			saveReplay("Exit")
		}
		resetLevel()
		returnToMenu()
	} else if (event.keyCode == checkData("key5", 82) && ! pregame && ! Global.global.paused) {
		if (! Global.global.replay && getData("rp_reset")) {
			saveReplay("Reset")
		}
		resetLevel()
		loadLevel()
	} else if (event.keyCode == checkData("key7", Keyboard.TAB) && ! pregame && patto != null && car != null && ! Global.global.paused && ! Global.global.replay) {
		car.control = ! car.control
		patto.control = ! patto.control
	} else if (event.keyCode == checkData("key9", 19) && ! pregame) {
		Global.global.paused = hasEventListener(Event.ENTER_FRAME)
		if (hasEventListener(Event.ENTER_FRAME)) {
			removeEventListener(Event.ENTER_FRAME, run)
		} else {
			addEventListener(Event.ENTER_FRAME, run)
		}
	} else if (pregame) {
		pregame = false
		info.close(setupListen)
	} else if (Global.global.debug && (Global.global.paused || Global.global.replay)) {
		if (event.keyCode == Keyboard.LEFT) {
			x += event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.RIGHT) {
			x -= event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.UP) {
			y += event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.DOWN) {
			y -= event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		bg.x = -x
		bg.y = -y
		if (getData("level6_4") == "beaten") {
			best_txt.y = time_txt.y = -y + 456
			best_txt.x = -x
			time_txt.x = best_txt.x + 540
		}
	}
}

function setupListen () {
	Global.global.paused = false
	addEventListener(Event.ENTER_FRAME, run)
	addEventListener(Event.DEACTIVATE, deactivate)
	addEventListener(Event.ACTIVATE, activate)
	Global.global.key.addEventListener("up_debug", toggleDebug)
}

function toggleDebug (event:Event) {
	Global.global.debug = ! Global.global.debug
}

function deactivate (event:Event) {
	if (Global.global.paused) {
		if (hasEventListener(Event.ACTIVATE)) {
			removeEventListener(Event.ACTIVATE, activate)
		}
	} else {
		Global.global.paused = true
		removeEventListener(Event.ENTER_FRAME, run)
		if (! hasEventListener(Event.ACTIVATE)) {
			addEventListener(Event.ACTIVATE, activate)
		}
	}
}

function activate (event:Event) {
	Global.global.paused = false
	addEventListener(Event.ENTER_FRAME, run)
}

function resetLevel () {
	removeEventListener(Event.ENTER_FRAME, run)
	removeEventListener(Event.DEACTIVATE, deactivate)
	removeEventListener(Event.ACTIVATE, activate)
	Global.global.key.removeEventListener("up_debug", toggleDebug)
	
	APEngine.removeGroup(Global.global.fixed)
	APEngine.removeGroup(Global.global.mobile)
	
	if (car != null) {
		removeChild(car)
		car.cleanup()
		car = null
	}
	if (patto != null) {
		removeChild(patto)
		patto.cleanup()
		patto = null
	}
	if (bg != null) {
		var n = bg.numChildren
		for (var i:uint = 0; i < n; i++) {
			if (bg.getChildAt(0).cleanup is Function) bg.getChildAt(0).cleanup()
			bg.removeChildAt(0)
		}
		removeChild(bg)
		bg = null
	}
	if (surfaces != null) {
		n = surfaces.numChildren
		for (i = 0; i < n; i++) {
			if (surfaces.getChildAt(0).cleanup is Function) surfaces.getChildAt(0).cleanup()
			surfaces.removeChildAt(0)
		}
		removeChild(surfaces)
		surfaces = null
	}
	if (objects != null) {
		n = objects.numChildren
		for (i = 0; i < n; i++) {
			if (objects.getChildAt(0).cleanup is Function) objects.getChildAt(0).cleanup()
			objects.removeChildAt(0)
		}
		removeChild(objects)
		objects = null
	}
	if (behind != null) {
		n = behind.numChildren
		for (i = 0; i < n; i++) {
			if (behind.getChildAt(0).cleanup is Function) behind.getChildAt(0).cleanup()
			behind.removeChildAt(0)
		}
		removeChild(behind)
		behind = null
	}
	if (time_txt != null) {
		removeChild(best_txt)
		removeChild(time_txt)
	}
	
	x = y = 0
}

function getGraphic (id:String) {
	switch (id.toLowerCase()) {
		case "cage":
			return new g_cage()
			break
		case "cavespike":
			return new g_cavespike()
			break
		case "evening":
			return new g_evening()
			break
		case "moon":
			return new g_moon()
			break
		case "minion":
			return new g_minion()
			break
		case "minion_shifty":
			return new g_minion_shifty()
			break
		case "icecave":
			return new g_icecave()
			break
		case "icycle":
			return new g_icycle()
			break
		case "window":
			return new g_window()
			break
		case "star":
			return new g_star()
			break
		case "house":
			return new g_house()
			break
		case "house2":
			return new g_house2()
			break
		case "hazard":
			return new g_hazard()
			break
		case "hazard_balls":
			return new g_hazard_balls()
			break
		case "hazard_bounce":
			return new g_hazard_bounce()
			break
		case "hazard_lava":
			return new g_hazard_lava()
			break
		case "hazard_patto":
			return new g_hazard_patto()
			break
		case "arrow":
			return new g_arrow()
			break
		default:
			return new Sprite()
			break
	}
}

function playCutscene (w, l) {
	switch (w+"_"+l) {
		case "1_4":
			cs = new cs1_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "2_3":
			cs = new cs2_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "2_4":
			cs = new cs2_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "3_4":
			cs = new cs3_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "4_4":
			cs = new cs4_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "5_3":
			cs = new cs5_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "5_4":
			cs = new cs5_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "6_3":
			cs = new cs6_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "6_4":
			cs = new cs6_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		default:
			returnToMenu()
			if (data.substr(7, 1) == "4") alert("Extra Unlocked!", "\nA new Skin is now available for use!\n\nCheck the EXTRAS menu to see what it is.")
			break
	}
}

function endCutscene (event:Event) {
	removeChild(cs)
	cs = null
	returnToMenu()
	if (data == "level6_4") {
		alert("Game Complete!", "Congratulations!\nYou have beaten Pattomobile!\n\nBut it ain't over yet...\nHave you got all 9 stars? 10 skins?")
		alert("Time Trial Mode!", "\nYou're best times are now recorded when you beat a level.\n\nSee if you can finish faster then all your friends!")
	}
	alert("Extra Unlocked!", "\nA new Cutscene is now available to watch!\n\nCheck the EXTRAS menu to watch it.")
	if (data.substr(7, 1) == "4") alert("Extra Unlocked!", "\nA new Skin is now available for use!\n\nCheck the EXTRAS menu to see what it is.")
	if (data == "level3_4" || data == "level4_4" || data == "level5_3" || data == "level6_4") alert("Extra Unlocked!", "\nA new Game Speed can now be selected!\n\nCheck the OPTIONS menu to set the Game Speed.")
}

function returnToMenu () {
	if (Global.global.replay) {
		gotoAndStop("replays")
		Global.global.replay = false
	} else if (data.substr(0, 5) == "bonus") {
		gotoAndStop("extras")
	} else {
		gotoAndStop("menu")
	}
	Global.global.showBananaMaker()
}

function saveReplay (r) {
	var rp = new Object()
	rp.Level = Global.global.level.@ep + " - " + Global.global.level.@lv + ": " + Global.global.level.@name
	rp.Result = r
	rp.Time = new Date().toLocaleString()
	rp.Seed = Global.global.rpd.split(":")[0]
	rp.Size = Math.ceil(Global.global.rpd.length / 102.4) / 10 + " kb"
	rp.level = data
	rp.data = Global.global.rpd
	so.data.replay2.push(rp)
}

function exitReplay (event:MouseEvent) {
	resetLevel()
	returnToMenu()
}

function formatTime (t:uint) {
	var ms = t % 1000
	var sec = (t - ms) / 1000 % 60
	var min = (t - ms - sec * 1000) / 60000 % 60
	var hr = (t - ms - sec * 1000 - min * 60000) / 3600000 % 24
	return (hr ? hr+":" : "") + (min ? (min < 10 ? (hr ? "0" : "")+min+":" : min+":") : "") + (sec < 10 ? (sec ? (min ? "0" : "")+sec+"." : (min ? "00." : "0.")) : sec+".") + (ms < 100 ? (ms < 10 ? "00"+ms : "0"+ms) : ms)
}

function arrangeParticles (A, B) {
	if (A.type == B.type) {
		return 0
	} else if (A.type == "bounce") {
		return -1
	} else if (B.type == "bounce") {
		return 1
	} else if (A.type == "kill") {
		return -1
	} else if (B.type == "kill") {
		return 1
	} else {
		return 0
	}
}

checkData("key1", Keyboard.LEFT)
checkData("key2", Keyboard.RIGHT)
checkData("key3", Keyboard.UP)
checkData("key4", Keyboard.DOWN)
checkData("key7", Keyboard.TAB)
checkData("key10", Keyboard.SPACE)

loadLevel()