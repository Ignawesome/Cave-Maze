extends Node

@export var cave_scene_path : String
@export var end_scene_path : String
@export var main_menu_path : String
@export var inventory_path : String

var current_node
var config_file = ConfigFile.new()

@onready var inventory_node := %Inventory
@onready var main_menu := %MainMenu

func _ready():
	Input.set_custom_mouse_cursor(SceneDb.mouse_point,Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(SceneDb.mouse_grab,Input.CURSOR_POINTING_HAND)
	Input.set_custom_mouse_cursor(SceneDb.mouse_drag,Input.CURSOR_DRAG)
	
	connect_scene_signals(main_menu)
	StateManager.change_state(StateManager.GAME_STATES.MENU)
	%Settings.load_and_apply_all_settings_from_file(config_file)

func new_game():
	# Show intro
	new_room(cave_scene_path)
	# Clean inventory
	# Clean events
	# Shuffle doors

func new_room(scene_path : String):
	await change_scene_to(scene_path)
	StateManager.change_state(1)

func game_over(win : bool):
	var end = await change_scene_to(end_scene_path)
	StateManager.change_state(4)
	if win:
		end.win()
	else:
		end.lose()
	
func start_transition():
	await $TransitionManager.fade_out()

func end_transition():
	await $TransitionManager.fade_in()

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		show_inventory()





func change_scene_to(scene_file_path : String):
	await start_transition()
	StateManager.change_state(3)
	await delete_current_scene(current_node)
	current_node = instantiate_scene(scene_file_path)
	connect_scene_signals(current_node)
	end_transition()
	return current_node



func show_menu():
	if StateManager.confirm_current_game_state(StateManager.GAME_STATES.PLAYING) or \
	StateManager.confirm_current_game_state(StateManager.GAME_STATES.INVENTORY):
#		var new_menu : PackedScene = load(main_menu_path)
#		var node : Node = new_menu.instantiate()
#		if StateManager.confirm_current_game_state(StateManager.GAME_STATES.PLAYING):
#			$GameWorld.find_child("CaveScene", false, false).queue_free()
#		if node != null:
#			$UI.add_child(node, true)
#			connect_scene_signals(node)
#			%Inventory.hide()
			StateManager.change_state(StateManager.GAME_STATES.MENU)
	elif StateManager.confirm_current_game_state(StateManager.GAME_STATES.MENU):
		get_tree().quit()

func show_settings():
	if not StateManager.confirm_current_game_state(StateManager.GAME_STATES.SETTINGS):
#		%Settings.show()
		StateManager.change_state(StateManager.GAME_STATES.SETTINGS)



func show_inventory():
	if StateManager.current_state == 6:
		%Inventory.hide()
		StateManager.change_state(1)
	elif StateManager.current_state == 1:
		%Inventory.show()
		StateManager.change_state(6)


func connect_scene_signals(node : Node):
	if node != null:
		var signal_list = node.script.get_script_signal_list()
		
		for i in signal_list:
			match i.name:
				"new_room_signal":
					node.new_room_signal.connect(new_room)
				"new_game_signal":
					node.new_game_signal.connect(new_game)
				"game_over_signal":
					node.game_over_signal.connect(game_over)
				"retry_signal":
					node.retry_signal.connect(new_game)
				"settings_signal":
					node.settings_signal.connect(show_settings)


func instantiate_scene(path : String):
	var scene = load(path)
	var node = scene.instantiate()
	if node != null:
		$GameWorld.add_child(node)
	if node.is_inside_tree():
		return node


func delete_current_scene(current_node):
	var menu = $UI.find_child("MainMenu*", false, false)
	if menu != null:
		menu.hide()
	if current_node != null:
		current_node.queue_free()

