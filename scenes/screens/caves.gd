extends Level

signal new_room_signal
signal game_over_signal

var held_item : ItemResource = SceneDb.held_item.held_item_var
@onready var interactibles = $Interactibles

var locked = true


func _ready():
#	SceneDb.held_item.interact.connect(interact_with_item)
	for interactible in interactibles.get_children():
		pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current Room: ", maze.current_room)

func interact_with_item(item_held : ItemResource):
	if item_held:
		if item_held.name == "Key":
			locked = false
	else:
		return



func check_door(door : int):
	match door:
		1: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 1:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		2: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 2:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)
		3: 
			if maze.solution.get(maze.room_number[maze.current_room]) == 3:
				correct_door_chosen(true)
			else:
				correct_door_chosen(false)


func correct_door_chosen(correct : bool):
	print(StateManager)
	if correct:
		if maze.current_room >= 2:
			game_over_signal.emit(true)
		else:
			maze.current_room += 1
			new_room_signal.emit(SceneDb.cave_scene_path)
	else:
		game_over_signal.emit(false)



func _on_left_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if StateManager.current_state != 3:
			check_door(1)

func _on_middle_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if StateManager.current_state != 3:
			check_door(2)

func _on_right_door_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		if StateManager.current_state != 3:
			check_door(3)


func _on_berkano_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.pressed:
		print("berkano sent to inventory manager")
		DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "Berkano")
		var item_count = SceneDb.inventory.inventory.get_item_count()
		if "Berkano" in SceneDb.inventory.inventory:
			print("Berkano already in inventory")
			$Berkano.queue_free()
#		else:
#			InventoryDb.add_to_inventory("Berkano")
		


func _on_algiz_input_event(viewport, event, shape_idx):
	print("it worksss")
	pass # Replace with function body.


#func _on_suitcase_interacted_left_click(target_item):
#	if dragged_item.name in target_item.combinations:
#		print("Used %s on %s", dragged_item.name, target_item)
#		SceneDb.inventory.add_item(load("res://scenes/components/inventory/items/Money.tres"))
	
	


func _on_suitcase_click(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.pressed:
		if locked:
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseLocked")
		if not locked:
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseOpened")
