extends Node2D

signal check_door_signal(door_chosen : int)
signal going_back(bool)



func _on_left_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1:
#	if Input.is_action_just_pressed("left_click", false) and not event.is_echo():
		await get_tree().create_timer(0.2).timeout
		check_door_signal.emit(1)
		print("door 1 signal emitted")
		print("Frame: ", get_tree().get_frame())


func _on_middle_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1:
		await get_tree().create_timer(0.2).timeout
		check_door_signal.emit(2)
		print("door 2 signal emitted")
		print("Frame: ", get_tree().get_frame())


func _on_right_door_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1:
		await get_tree().create_timer(0.2).timeout
		check_door_signal.emit(3)
		print("door 3 signal emitted")
		print("Frame: ", get_tree().get_frame())
		


func _on_back_input_event(_viewport, event, _shape_idx, _extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1:
		await get_tree().create_timer(0.2).timeout
		going_back.emit()
		print("back signal")
		return



