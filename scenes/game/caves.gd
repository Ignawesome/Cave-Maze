extends Node2D

signal check_door

func _on_left_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("correct")
		check_door.emit(1)


func _on_middle_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("correct")
		check_door.emit(2)


func _on_right_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("correct")
		check_door.emit(3)
