extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var current_room : int = room_number[0]

#@onready var transition_manager = TransitionManager

@onready var main_menu_node : Control = SceneDb.menu_node
@onready var cave_node : Node2D = SceneDb.caves_node
@onready var end_node : Node2D = SceneDb.end_node

#@onready var main_menu_node : Control = SceneDb.menu_packed.instantiate()
#@onready var cave_node : Node2D = SceneDb.caves_packed.instantiate()
#@onready var end_node : Node2D = SceneDb.end_packed.instantiate()
#	var scene = load(caves_path)
#	game_world = scene.instantiate()
#	add_child(game_world)


func _ready():
	self.add_child(main_menu_node)
	main_menu_node.new_game_signal.connect(new_game, CONNECT_PERSIST)
	TransitionManager.fade_in()

func new_game():
	TransitionManager.fade_out()
	await get_tree().create_timer(1).timeout
	add_child(cave_node)
	cave_node.check_door_signal.connect(check_door, CONNECT_PERSIST)
	TransitionManager.fade_in()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current room:", current_room)
	if Input.is_action_just_pressed("fade_in"):
		TransitionManager.fade_in()
		print("faded in")
	if Input.is_action_just_pressed("fade_out"):
		TransitionManager.fade_out()
		print("faded out")

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
				current_room = 0
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
				current_room = 0
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
				current_room = 0
				end_game(false)

func go_to_next_room() -> void:
	TransitionManager.fade_out()
	await get_tree().create_timer(1).timeout
	$CaveScene.queue_free()
	await get_tree().create_timer(1.0).timeout
	cave_node = SceneDb.caves_packed.instantiate()
	self.add_child(cave_node)
	cave_node.check_door_signal.connect(check_door)
	TransitionManager.fade_in()

func end_game(win : bool) -> void:
	TransitionManager.fade_out()
	await get_tree().create_timer(1).timeout
	$CaveScene.queue_free()
	var end = SceneDb.end_packed.instantiate()
	self.add_child(end)
	$EndScene.win_or_lose(win)
	end.retry.connect(retry)
	TransitionManager.fade_in()

func retry():
	TransitionManager.fade_out()
	await get_tree().create_timer(1).timeout
	get_child(0).queue_free()
	var cave = SceneDb.caves_packed.instantiate()
	add_child(cave)
	cave.check_door_signal.connect(check_door)
	TransitionManager.fade_in()
































#	var scene = load(caves_path)
#	game_world = scene.instantiate()
#	add_child(game_world)

