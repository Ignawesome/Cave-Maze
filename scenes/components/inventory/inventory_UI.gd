extends Control
class_name Inventory

@onready var inventory_slots = %Items
@onready var dragged_item = $"../DraggedItem"
@onready var notes = %Notes


@export var player_inventory : InventoryReference

var item_selected : ItemResource


signal item_dragging


func _ready():
	update_inventory(player_inventory.items_in_inventory)


#Updates the inventory when passing an array of items
func update_inventory(item_array : Array[ItemResource]):
	inventory_slots.clear()
	for item in item_array:
		if item:
			inventory_slots.set_item_tooltip(inventory_slots.add_item(item.name,
			 item.texture, true), item.tooltip)


func add_item(item : ItemResource):
	if item == null:
		return FAILED
	player_inventory.add_item(item)
	update_inventory(player_inventory.items_in_inventory)
	return OK
	
func remove_item(item : ItemResource):
	if item == null:
		return FAILED
	player_inventory.remove_item(item)
	update_inventory(player_inventory.items_in_inventory)
	return OK


func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	item_selected = player_inventory.find_item(index)
	if mouse_button_index == 2:
		instance_context_menu(index, at_position)
	elif mouse_button_index == 1:
		if not item_selected.undraggable:
			start_item_drag(item_selected)
	
	
func start_item_drag(item_clicked : ItemResource):
	item_dragging.emit(item_clicked)
	print("Item: " + item_clicked.name + " used")



func instance_context_menu(index, position):
	var menu_scene = SceneDb.context_menu
	var menu = menu_scene.instantiate()
	self.add_child(menu, true)
	menu.position = position
	menu.context_menu.connect(context_menu_clicked)

func context_menu_clicked(index : int):
	match index:
		#Use
		0:
			start_item_drag(item_selected)
			print(item_selected.name, " used.")
			
			pass
		#Examine
		1:
			print(item_selected.name, " examined.")
			pass
		#Combine
		2:
			print(item_selected.name, " combined.")
			pass
		#Drop
		3:
			print(item_selected.name, " dropped.")
			remove_item(item_selected)
			pass


func use_item_effect(item_clicked):
	
	pass
		


func item_examined(item_clicked):
	var item_name = inventory_slots.get_item_text(item_clicked)
	print("Item: " + item_name + " examined")

func item_dropped(item_clicked):
	var item_name = inventory_slots.get_item_text(item_clicked)
	inventory_slots.remove_item(item_clicked)
	print("Item: " + item_name + " dropped")
	
func item_combined(item_clicked):
	var item_name = inventory_slots.get_item_text(item_clicked)
	print("Item: " + item_name + " combined")

#Hide the inventory when mouse leaves
func _on_inventory_mouse_exit():
	if get_viewport().get_mouse_position().x > 125:
		await get_tree().create_timer(2)
		StateManager.change_state(1)



#func find_item_resource(item):
#	if item == int:
#		player_inventory.find_item(inventory_slots.get_item_text(item))
#		pass
#	elif item == StringName:
#		pass
#	else:
#		return FAILED
#	return item_selected
