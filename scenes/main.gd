extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var current_room : int = room_number[0]

const cave_scene : PackedScene = preload("res://scenes/game/caves.tscn")
const end_scene : PackedScene = preload("res://scenes/game/end.tscn")
@onready var transition_manager = $TransitionManager
@onready var caves = $CaveScene

func _ready():
#	$CaveScene.check_door_signal.connect(self.check_door)
	print("ready")
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current room:", current_room)
	
func check_door(door : int):
	print("check door: ", door)
	match door :
		1:
			if 1 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 3:
					current_room += 1
					go_to_next_room()
				else:
					end_game(true)
			else:
				print("Wrong way")
				end_game(false)
		2:
			if 2 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 3:
					current_room += 1
					go_to_next_room()
				else:
					end_game(true)
			else:
				print("Wrong way")
				end_game(false)
		3:
			if 3 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 3:
					current_room += 1
					go_to_next_room()
				else:
					end_game(true)
			else:
				print("Wrong way")
				end_game(false)

	
func go_to_next_room() -> void:
	$CaveScene.queue_free()
	await get_tree().create_timer(1.0).timeout
	self.add_child(cave_scene.instantiate())
	$CaveScene.check_door_signal.connect(self.check_door)
	
	
func end_game(win : bool) -> void:
	$CaveScene.queue_free()
	self.add_child(end_scene.instantiate())
	$EndScene.win_or_lose(win)
	
	
	




































	
	
