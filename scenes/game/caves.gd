extends Node2D

signal check_door_signal(door_chosen : int)

@export var cursor : Resource
@export var arrow_up : Resource
@export var arrow_left : Resource
@export var arrow_right : Resource

#func _process(delta):
#	Input.set_custom_mouse_cursor(cursor)

func _on_left_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	Input.set_custom_mouse_cursor(arrow_left)
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(1)
		print("Door 1 entered on frame: ", get_tree().get_frame())


func _on_middle_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	Input.set_custom_mouse_cursor(arrow_up)
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(2)
		print("Door 2 entered on frame: ", get_tree().get_frame())


func _on_right_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	Input.set_custom_mouse_cursor(arrow_right)
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed :
		check_door_signal.emit(3)
		print("Door 3 entered on frame: ", get_tree().get_frame())


#func _on_back_input_event(_viewport, event, _shape_idx, _extra_arg_0):
#	if event is InputEventMouseButton and event.button_index == 1 and Input.is_action_just_pressed("left_click", true) :
#		await get_tree().create_timer(0.2).timeout
#		going_back.emit()
#		get_viewport().set_input_as_handled()
#		print("back signal")
#		return


func _on_mouse_exited():
	Input.set_custom_mouse_cursor(cursor)
