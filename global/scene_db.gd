extends Node

@onready var cave_scene_path : String = "res://scenes/game/caves.tscn"
@onready var cave_scene : Resource = preload("res://scenes/game/caves.tscn")
@onready var main_menu : Resource = preload("res://scenes/menu/main_menu.tscn")
@onready var end_scene : Resource = preload("res://scenes/game/end.tscn")
@onready var inventory_scene : Resource = preload("res://scenes/menu/inventory_UI.tscn")
@onready var settings : Resource = preload("res://scenes/menu/settings.tscn")
@onready var context_menu := preload("res://scenes/menu/context_menu.tscn")
@onready var item_descriptions = preload("res://dialogues/item_descriptions.dialogue")

@onready var main = get_node("/root/Main")
@onready var state_manager = get_node("/root/Main/StateManager")
@onready var transition_manager = get_node("/root/Main/TransitionManager")
@onready var music_manager = get_node("/root/Main/MusicManager")
@onready var game_world = get_node("/root/Main/GameWorld")
@onready var user_interface = get_node("/root/Main/UI")
@onready var inventory = get_node("/root/Main/UI/Inventory")
@onready var music_node = get_node("/root/Main/MusicManager/AudioStreamPlayer")

