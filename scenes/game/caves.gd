extends Node2D

signal check_door_signal(door_chosen : int)

@export var cursor : Resource
@export var arrow_up : Resource
@export var arrow_left : Resource
@export var arrow_right : Resource


func _on_left_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(1)
		Input.set_custom_mouse_cursor(cursor)
		print("Door 1 entered on frame: ", get_tree().get_frame())
	return 1


func _on_middle_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(2)
		Input.set_custom_mouse_cursor(cursor)
		print("Door 2 entered on frame: ", get_tree().get_frame())
	return 2


func _on_right_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(3)
		Input.set_custom_mouse_cursor(cursor)
		print("Door 3 entered on frame: ", get_tree().get_frame())
	return 3




func _on_mouse_exited():
	Input.set_custom_mouse_cursor(cursor)


func _on_left_door_mouse_entered():
		Input.set_custom_mouse_cursor(arrow_left)

func _on_middle_door_mouse_entered():
		Input.set_custom_mouse_cursor(arrow_up)

func _on_right_door_mouse_entered():
		Input.set_custom_mouse_cursor(arrow_right)



