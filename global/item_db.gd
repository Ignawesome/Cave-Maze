extends Node

var item_path = "res://scenes/menu/UI_item.gd"
@onready var main = get_tree().get_current_scene()
@onready var inventory : Node = SceneDb.inventory
#var item

#func _ready():
#	print(main)
#	print(inventory)

var InventoryDict = {
	"Berkano" : "res://assets/textures/runes/runeBlack_tile_002.png",
	"Algiz" : "res://assets/textures/runes/runeBlack_tile_026.png",
	"Perthro" : "res://assets/textures/runes/runeBlack_tile_008.png",
	"Jera" : "res://assets/textures/runes/runeBlack_tile_032.png",
	"Dagaz" : "res://assets/textures/runes/runeBlack_tile_004.png"
}

func add_to_inventory(item):
	var item_texture = InventoryDict.get(item)
	item_texture = load(item_texture)
	inventory.create_item(item, item_texture)
	print("item added to inventory")
	
	
