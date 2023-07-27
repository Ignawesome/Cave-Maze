extends Node2D
class_name CaveLevel

signal new_room_signal
signal game_over_signal

var current_room : int = 0

func check_door(door):
	match door:
		1: 
			if maze.solution.get(maze.room_number[current_room]) == 1:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		2: 
			if maze.solution.get(maze.room_number[current_room]) == 2:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		3: 
			if maze.solution.get(maze.room_number[current_room]) == 3:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)


func correct_door_chosen(correct):
	if correct:
		current_room += 1
		new_room_signal.emit()
	else:
		current_room = 0
		game_over_signal.emit()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current Room:", current_room)
		var list = self.get_signal_list()
		print(list)
#		game_over_signal.emit()
#		new_room_signal.emit()

func _on_left_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("Door 1")
		check_door(1)

func _on_middle_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("Door 2")
		check_door(2)

func _on_right_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		print("Door 3")
		check_door(3)
