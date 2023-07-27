extends Node

@onready var cave_scene : Resource = preload("res://scenes/game/caves.tscn")
@onready var main_menu : Resource = preload("res://scenes/menu/main_menu.tscn")
@onready var end_scene : Resource = preload("res://scenes/game/end.tscn")

@onready var state_manager = get_node("/root/Main/StateManager")
@onready var transition_manager = get_node("/root/Main/TransitionManager")
@onready var music_manager = get_node("/root/Main/MusicManager")
@onready var game_world = get_node("/root/Main/GameWorld")
@onready var user_interface = get_node("/root/Main/UI")
