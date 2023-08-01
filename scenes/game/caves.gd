extends Node2D
class_name CaveLevel

signal new_room_signal
signal game_over_signal

@onready var state_manager = get_node("/root/Main/StateManager")

func check_door(door : int):
	match door:
		1: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 1:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		2: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 2:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		3: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 3:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)


func correct_door_chosen(correct : bool):
	print(state_manager)
	if correct:
		if maze.current_room >= 2:
			game_over_signal.emit(true)
		else:
			maze.current_room += 1
			new_room_signal.emit()
	else:
		game_over_signal.emit(false)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current Room: ", maze.current_room)

func _on_left_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if state_manager.current_state != 3:
			check_door(1)

func _on_middle_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if state_manager.current_state != 3:
			check_door(2)

func _on_right_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if state_manager.current_state != 3:
			check_door(3)
