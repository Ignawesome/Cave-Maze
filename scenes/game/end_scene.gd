extends Node2D

signal retry_signal

func _on_retry_button_pressed():
	retry_signal.emit()

func _on_quit_button_pressed():
	get_tree().quit()
