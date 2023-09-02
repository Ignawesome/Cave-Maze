extends Node

var item_path = "res://scenes/menu/UI_item.gd"
@onready var main = get_tree().get_current_scene()
@onready var inventory : Node = SceneDb.inventory
#var item

#func _ready():
#	print(main)
#	print(inventory)

var InventoryDict = {
	"Berkano" : preload("res://assets/items/Berkano.tres"),
	"Algiz" : preload("res://assets/items/Algiz.tres"),
	"Perthro" : preload("res://assets/items/Perthro.tres"),
	"Jera" : preload("res://assets/items/Jera.tres"),
	"Dagaz" : preload("res://assets/items/Dagaz.tres")
}

func add_to_inventory(item):
	var item_resource = InventoryDict.get(item)
	if inventory.add_item(item_resource) == OK:
		print("item added to inventory")
	
	
