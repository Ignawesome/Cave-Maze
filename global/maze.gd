class_name Maze extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
const room = preload("res://scenes/game/caves.tscn")

@export var solution : Dictionary = {
	room_number[0] : 1,
	room_number[1] : 2,
	room_number[2] : 3,
	room_number[3] : 1,
	room_number[4] : 2,
	room_number[5] : 3,
	room_number[6] : 1,
	room_number[7] : 2,
	room_number[8] : 3,
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


