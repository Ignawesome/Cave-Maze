extends Resource
class_name InventoryReference

@export var items_in_inventory : Array[ItemResource]
#@export var inventoryUI : Control

var owner = self.get_local_scene()


func add_item(item : ItemResource) -> void:
	if item == null:
		printerr("Tried to add a null item to inventory")
		return
	items_in_inventory.append(item)
	owner.update_inventory(items_in_inventory)
	
func remove_item(item : ItemResource) -> void:
	items_in_inventory.erase(item)
	owner.update_inventory(items_in_inventory)
	
func clear_inventory() -> void:
	items_in_inventory.clear()
	owner.update_inventory(items_in_inventory)

func has_item(item : ItemResource):
	if items_in_inventory.has(item):
		return true
	else:
		return false
		
func find_item(item_id : int = -1, item_name : StringName = ""):
	if item_id >= 0:
		return items_in_inventory[item_id]
	elif item_name:
		for item in items_in_inventory:
			if item.name == item_name:
				return item
	else:
		return null

