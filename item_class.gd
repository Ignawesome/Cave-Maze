extends Node2D
class_name Item

var item_name : String
var item_icon : Texture2D
var item_icon_size := Vector2i(32,32)
var item_texture := Texture2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func inventory_slot(invetory_node):
