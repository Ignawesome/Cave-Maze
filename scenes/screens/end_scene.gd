extends CanvasLayer

signal retry_signal

func win():
	maze.current_room = 0
	%YouDiedText.hide()
	%CongratulationsText.show()

func lose():
	maze.current_room = 0
	%YouDiedText.show()
	%CongratulationsText.hide()

func _on_retry_button_pressed():
	retry_signal.emit()

func _on_quit_button_pressed():
	get_tree().quit()
