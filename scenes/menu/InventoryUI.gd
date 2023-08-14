extends Control
class_name Inventory

@onready var inventory = $Panel/MarginContainer/TabContainer/Items/VBoxContainer
@onready var items = $Panel/MarginContainer/TabContainer/Items
@onready var notes = $Panel/MarginContainer/TabContainer/Notes
@onready var item_button = $Panel/MarginContainer/TabContainer/Items/VBoxContainer/Perthro
var icon_size := Vector2i(24, 24)


func _ready():
	item_button.item_selected.connect(item_selected)
#	items.fixed_icon_size = icon_size
#	notes.fixed_icon_size = icon_size
	pass
	
func item_selected(item):
	print("Item selected: " + item)
	
func add_item_to_inventory(item : ItemUI):
	items.add_item(item.name, item.texture)
	

func add_note_to_inventory(item : ItemUI):
	notes.add_item(item.name, item.texture)
