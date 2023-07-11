extends Control

const cave_level : PackedScene = preload("res://scenes/game/caves.tscn")

signal new_game_signal
signal continue_game
signal quit_signal


func _on_new_game_button_pressed():
#	self.add_sibling(cave_level.instantiate())
	new_game_signal.emit()
	self.queue_free()
	pass # Replace with function body.


func _on_continue_button_pressed():
	continue_game.emit()
	pass # Replace with function body.


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	quit_signal.emit()
