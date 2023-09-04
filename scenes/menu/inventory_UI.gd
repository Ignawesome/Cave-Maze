extends Control
class_name Inventory

@onready var inventory = %Items

var item_selected

func _hide_inventory_on_external_click(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		SceneDb.main.show_inventory()

func add_item(item : ItemResource):
	inventory.add_item(item.name, item.texture, true)
	return OK


func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	item_selected = index
	if mouse_button_index == 2:
		instance_context_menu(index, at_position)
	pass # Replace with function body.

func instance_context_menu(index, position):
	var menu_scene = SceneDb.context_menu
	var menu = menu_scene.instantiate()
	self.add_child(menu, true)
	menu.position = position
	menu.context_menu.connect(context_menu_clicked)

func context_menu_clicked(index : int):
	var selected = inventory.get_item_text(item_selected)
	match index:
		#Use
		0:
			print(selected, " used.")
			pass
		#Examine
		1:
			print(selected, " examined.")
			pass
		#Combine
		2:
			print(selected, " combined.")
			pass
		#Drop
		3:
			print(selected, " dropped.")
			inventory.remove_item(item_selected)
			pass


func item_used(item_clicked):
	var item_name = inventory.get_item_text(item_clicked)
	print("Item: " + item_name + " used")


func item_examined(item_clicked):
	var item_name = inventory.get_item_text(item_clicked)
	print("Item: " + item_name + " examined")

func item_dropped(item_clicked):
	var item_name = inventory.get_item_text(item_clicked)
	inventory.remove_item(item_clicked)
	print("Item: " + item_name + " dropped")
	
func item_combined(item_clicked):
	var item_name = inventory.get_item_text(item_clicked)
	print("Item: " + item_name + " combined")
