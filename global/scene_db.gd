extends Node

@export var caves_path : String
var caves_packed : PackedScene = preload("res://scenes/game/caves.tscn")
var caves_node : Node2D = caves_packed.instantiate()

@export var menu_path : String
var menu_packed : PackedScene = preload("res://scenes/menu/main_menu.tscn")
var menu_node : Control = menu_packed.instantiate()

@export var end_path : String
var end_packed : PackedScene = preload("res://scenes/game/end.tscn")
var end_node : Node2D = end_packed.instantiate()
