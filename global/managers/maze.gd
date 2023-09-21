extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var current_room := 0

var solution : Dictionary = {
	room_number[0] : randi() % 3 +1,
	room_number[1] : randi() % 3 +1,
	room_number[2] : randi() % 3 +1,
#	room_number[3] : randi() % 3 +1,
#	room_number[4] : randi() % 3 +1,
#	room_number[5] : randi() % 3 +1,
#	room_number[6] : randi() % 3 +1,
#	room_number[7] : randi() % 3 +1,
#	room_number[8] : randi() % 3 +1,
#	room_number[9] : randi() % 3 +1
	}

func _ready():
	print(solution)
