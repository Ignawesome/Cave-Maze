extends Node

@export var cave_scene_path : String
@export var end_scene_path : String
@export var main_menu_path : String

var cave_node_path : NodePath
var menu_node_path : NodePath
var cave_node
@onready var main_menu : Control = $UI/MainMenu
@onready var cave_scene_ready : Node2D = $GameWorld/CaveScene


func _ready():
	print(menu_node_path)
	connect_scene_signal(main_menu)
	$StateManager.change_state(2)


func new_room():
	await change_scene_to(cave_scene_path)
	$StateManager.change_state(1)

func game_over(win : bool):
	var end = await change_scene_to(end_scene_path)
	$StateManager.change_state(4)
	if win:
		end.win()
	else:
		end.lose()
	
func start_transition():
	await $TransitionManager.fade_out()

func end_transition():
	await $TransitionManager.fade_in()

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func change_scene_to(scene_file_path):
	$StateManager.change_state(3)
	await start_transition()
	delete_current_scene(cave_node)
	cave_node = instantiate_scene(scene_file_path)
	connect_scene_signal(cave_node)
	end_transition()
	return cave_node

func connect_scene_signal(node):
	if node != null:
		var signal_list = node.get_signal_list()
		for i in signal_list:
			match i.name:
				"new_room_signal":
					node.new_room_signal.connect(new_room)
				"new_game_signal":
					node.new_game_signal.connect(new_room)
				"game_over_signal":
					node.game_over_signal.connect(game_over)
				"retry_signal":
					node.retry_signal.connect(new_room)
	
func instantiate_scene(path : String):
	var scene = load(path)
	var node = scene.instantiate()
	if node != null:
		$GameWorld.add_child(node)
	if node.is_inside_tree():
		return node

func delete_current_scene(current_node):
	var menu = $UI.get_node_or_null("MainMenu") 
	if menu != null:
		menu.queue_free()
	if current_node != null:
		current_node.queue_free()
