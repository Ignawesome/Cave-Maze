extends Node2D

signal retry


func win_or_lose(win:bool):
	if win:
		$CanvasLayer/Control/MarginContainer/VBoxContainer/PanelContainer3/YouDiedText.hide()
		$CanvasLayer/Control/MarginContainer/VBoxContainer/PanelContainer3/CongratulationsText.show()
	else:
		$CanvasLayer/Control/MarginContainer/VBoxContainer/PanelContainer3/YouDiedText.show()
		$CanvasLayer/Control/MarginContainer/VBoxContainer/PanelContainer3/CongratulationsText.hide()


func _on_retry_button_pressed():
	retry.emit()
	
	pass


func _on_quit_button_pressed() -> void:
	get_tree().quit()
