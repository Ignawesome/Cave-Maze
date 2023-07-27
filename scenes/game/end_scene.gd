extends Node2D

signal retry_signal

func win():
	maze.current_room = 0
	$CanvasLayer/MarginContainer/VBoxContainer/PanelContainer3/YouDiedText.hide()
	$CanvasLayer/MarginContainer/VBoxContainer/PanelContainer3/CongratulationsText.show()

func lose():
	maze.current_room = 0
	$CanvasLayer/MarginContainer/VBoxContainer/PanelContainer3/YouDiedText.show()
	$CanvasLayer/MarginContainer/VBoxContainer/PanelContainer3/CongratulationsText.hide()

func _on_retry_button_pressed():
	retry_signal.emit()

func _on_quit_button_pressed():
	get_tree().quit()
