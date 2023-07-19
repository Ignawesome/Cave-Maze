extends Node

@export var caves_path : String
@export var menu_path : String
@export var end_path : String

var caves_packed : Resource = preload("res://scenes/game/caves.tscn")
var caves_node : Node2D = caves_packed.instantiate()

var menu_packed : Resource = preload("res://scenes/menu/main_menu.tscn")
var menu_node : Control = menu_packed.instantiate()

var end_packed : Resource = preload("res://scenes/game/end.tscn")
var end_node : Node2D = end_packed.instantiate()
