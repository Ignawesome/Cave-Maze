extends Resource
class_name InventoryReference

@export var items_in_inventory : Array[ItemResource]

func add_item(item : ItemResource):
	items_in_inventory.append(item)
	
func remove_item(item : ItemResource) -> void:
	items_in_inventory.erase(item)
	
func clear_inventory() -> void:
	items_in_inventory.clear()

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


func use_item(item : ItemResource):
	item.use_effect()

func combine_items(item : ItemResource, other_item : ItemResource):
	if item.combinations.has(other_item):
		pass
