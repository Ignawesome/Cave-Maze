class_name Maze extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
const room = preload("res://caves.tscn")

#var current_room = room_number[0]
#var next_room = current_room + 1
#var previous_room = current_room - 1

@export var solution : Dictionary = {
	room_number[0] : 1,
	room_number[1] : 1,
	room_number[2] : 1,
	room_number[3] : 1,
	room_number[4] : 1,
	room_number[5] : 1,
	room_number[6] : 1,
	room_number[7] : 1,
	room_number[8] : 1,
	room_number[9] : 1
	}
	
@export var rooms : Dictionary = {
	room_number[0] : room,
	room_number[1] : room,
	room_number[2] : room,
	room_number[3] : room,
	room_number[4] : room,
	room_number[5] : room,
	room_number[6] : room,
	room_number[7] : room,
	room_number[8] : room,
	room_number[9] : room
	}


