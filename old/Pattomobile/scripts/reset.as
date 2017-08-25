stop()

quit_btn.addEventListener("click", quit)
extras_btn.addEventListener("click", extras)
credits_btn.addEventListener("click", credits)
menu_btn.addEventListener("click", menu)
reset_btn.addEventListener("click", resetSO)
options_btn.addEventListener("click", options)
replays_btn.addEventListener("click", replays)

function resetSO (event:Event) {
	so.clear()
	fscommand("quit")
}