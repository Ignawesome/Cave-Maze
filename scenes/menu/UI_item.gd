extends Button
class_name ItemUI

@onready var label = $PanelContainer/HBoxContainer/Label
@onready var texture = $PanelContainer/HBoxContainer/PanelContainer/TextureRect

@export var item_name : String
@export var item_texture : Texture

signal item_selected


func _ready():
	label.text = item_name
	texture.texture = item_texture


func _on_button_down():
	item_selected.emit(item_name)
	pass # Replace with function body.
