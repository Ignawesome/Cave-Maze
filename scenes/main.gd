extends Node

@export var cave_scene_path : String
@export var end_scene_path : String
@export var main_menu_path : String
@export var inventory_path : String

var current_node
@onready var inventory_node = $UI/Inventory

@onready var main_menu : Control = $UI/MainMenu


func _ready():
	connect_scene_signals(main_menu)
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
		show_menu()
	if Input.is_action_just_pressed("inventory"):
		show_inventory()


func change_scene_to(scene_file_path):
	$StateManager.change_state(3)
	await start_transition()
	await delete_current_scene(current_node)
	current_node = instantiate_scene(scene_file_path)
	connect_scene_signals(current_node)
	end_transition()
	return current_node



func show_menu():
	if $StateManager.current_state == 1 or $StateManager.current_state == 6:
		var new_menu : PackedScene = load(main_menu_path)
		var node : Node = new_menu.instantiate()
		if node != null:
			$UI.add_child(node)
			connect_scene_signals(node)
			inventory_node.hide()
			$StateManager.change_state(2)

func show_inventory():
	if $StateManager.current_state == 6:
		inventory_node.hide()
		$StateManager.change_state(1)
	elif $StateManager.current_state == 1:
		inventory_node.show()
		$StateManager.change_state(6)
	else:
		pass




func connect_scene_signals(node : Node):
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
