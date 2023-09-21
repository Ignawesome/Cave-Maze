extends Control
class_name MainMenu


signal new_game_signal
signal continue_signal
signal settings_signal


func _on_new_game_button_pressed():
	new_game_signal.emit()

func _on_continue_button_pressed():
	continue_signal.emit()

func _on_settings_button_pressed():
	settings_signal.emit()

func _on_quit_button_pressed():
	get_tree().quit()
