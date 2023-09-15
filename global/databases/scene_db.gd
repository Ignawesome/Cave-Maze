extends Node

#Mice
var mouse_grab := preload("res://assets/textures/icons/skel_hand_grab.png")
var mouse_point := preload("res://assets/textures/icons/skel_hand_point.png")
var mouse_drag := preload("res://assets/textures/icons/item_pointer.png")


#Scene paths
var cave_scene_path : String = "res://scenes/screens/caves.tscn"
var cave_scene : Resource = preload("res://scenes/screens/caves.tscn")
var main_menu : Resource = preload("res://scenes/menu/main_menu.tscn")
var end_scene : Resource = preload("res://scenes/screens/end.tscn")
var inventory_UI : Resource = preload("res://scenes/components/inventory/inventory_UI.tscn")

var context_menu := preload("res://scenes/menu/context_menu.tscn")

#Dialogues
const ITEM_DESCRIPTIONS := preload("res://dialogues/item_descriptions.dialogue")

#Nodes
@onready var held_item = get_node("/root/Main/UI/DraggedItem")
@onready var main = get_node("/root/Main")
@onready var transition_manager = get_node("/root/Main/TransitionManager")
@onready var music_manager = get_node("/root/Main/MusicManager")
@onready var game_world = get_node("/root/Main/GameWorld")
@onready var user_interface = get_node("/root/Main/UI")
@onready var inventory = get_node("/root/Main/UI/Inventory")
@onready var music_node = get_node("/root/Main/MusicManager/AudioStreamPlayer")
@onready var pause_menu = get_node("/root/Main/UI/PauseMenu")
@onready var settings  = get_node("/root/Main/UI/Settings")
@onready var main_menu_node = get_node("/root/Main/UI/MainMenu")
