extends Interactible

var locked := true :
	set(value):
		GlobalEvents.set_item_state("suitcase_locked", value)
		locked = value
	get:
		return locked


func _ready():
	super._ready()
	set("locked", GlobalEvents.items_state["suitcase_locked"])


func examine_item(item_name : ItemResource):
	DialogueManager.show_example_dialogue_balloon(item.dialogue, item.name + "Description")
	
func check_item_interaction(hand_item : ItemResource, other_item : ItemResource):
	#If the suitcase is still locked
	if locked:
		#Check the item
		#If the key is right
		if InteractionMng.check_interaction(hand_item.name, item.name): # if InteractionMng.use_item_with_item(hand_item, item):
			open_suitcase()
		#If it's some other item
		else:
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "IncorrectItem")
	#If the suitcase has already been opened
	elif not locked:
		#If you are trying to open it again with the key
		if InteractionMng.check_interaction(hand_item.name, item.name): # if InteractionMng.use_item_with_item(hand_item, item):
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseKeyAgain")
		#If you are using another item on the open suitcase
		else:
			DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "Suitcase")


func interact_with_item(item : ItemResource):
	DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "Suitcase")


func pick_up_interactible(item : ItemResource):
	pass

func open_suitcase():
	set("locked", false)
	DialogueManager.show_example_dialogue_balloon(SceneDb.ITEM_DESCRIPTIONS, "SuitcaseOpened")
	SceneDb.inventory.player_inventory.add_item(load("res://scenes/components/inventory/items/Money.tres"))
