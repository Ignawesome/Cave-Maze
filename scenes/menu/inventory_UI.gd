extends Control
class_name Inventory

@onready var inventory = %ItemContainer

func create_item(name, texture):
	var new_button = Button.new()
	inventory.add_child(new_button)
	new_button.text = name
	new_button.name = name
	new_button.set_button_icon(texture)
	new_button.set_expand_icon(true)
	new_button.alignment = 0
	print(name + " item created")
