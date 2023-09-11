extends Interactible

var locked = true


func _ready():
	pass

func _on_interact():
	pass
	
func _on_examine():
	pass


func _on_item_interact():
	pass

#	if not held_item.interact.is_connected(_on_interact):
#		held_item.interact.connect(_on_interact)
#	print("Suitcase sees item: ", held_item)

#func _on_interact(item_name):
#	if item_name and item_name == "Key" and locked:
#		open_suitcase()
#	elif item_name and item_name == "Key" and not locked:
#		DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseAlreadyOpen")
#	else:
#		DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseLocked")


func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == 2 \
	and event.pressed:
		item.examine_item()
	if event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.pressed:
		var held_item = SceneDb.held_item.held_item_var
		print(held_item)
		if held_item:
			print(held_item.name)
			if held_item.name == &"Key":
				open_suitcase()
			else:
				DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "IncorrectItem")
			return
		elif locked:
			print("it's locked")
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseLocked")
			
			return
		elif not locked:
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseAlreadyOpen")


#		if dragged_item and dragged_item.name == "Key" and locked:
#			open_suitcase()
#		elif dragged_item and dragged_item.name == "Key" and not locked:
#			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseAlreadyOpen")
#		else:
#			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseLocked")
#	pass # Replace with function body.

func open_suitcase():
	locked = false
	DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseOpened")
