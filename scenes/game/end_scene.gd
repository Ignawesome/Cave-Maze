extends Node2D



func win_or_lose(win:bool):
	if win:
		$CanvasLayer/Control/YouDiedText.hide()
		$CanvasLayer/Control/CongratulationsText.show()
	else:
		$CanvasLayer/Control/YouDiedText.show()
		$CanvasLayer/Control/CongratulationsText.hide()
