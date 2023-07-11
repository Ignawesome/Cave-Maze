extends Control

const cave_level : PackedScene = preload("res://scenes/game/caves.tscn")
signal new_game
signal continue_game

func _on_new_game_button_pressed():
	new_game.emit()
	pass # Replace with function body.


func _on_continue_button_pressed():
	continue_game.emit()
	pass # Replace with function body.


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
