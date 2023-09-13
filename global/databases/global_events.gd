# GlobalEventTracker.gd
extends Node


#Dictionary to track items solved
var items_state := {
	"suitcase_locked" : true
}

# Dictionary to track unlocked doors (door name as key, boolean as value)
var unlocked_doors := {
	"start_cell" : false,
	"first_room1" : false,
	"first_room2" : false
}

# List to track items that should not spawn
var banned_items := []


func set_item_state(item : String, state : Variant):
	items_state[item] = state
	print("Global state of " + item + "changed to: " + str(state))
	print(items_state)


# Function to mark a door as unlocked
func mark_door_as_unlocked(door_name: String):
	unlocked_doors[door_name] = true

# Function to check if a door is unlocked
func is_door_unlocked(door_name: String) -> bool:
	return unlocked_doors.has(door_name)

# Function to add an item to the banned list
func ban_item(item_name: String):
	banned_items.append(item_name)

# Function to check if an item is banned
func is_item_banned(item_name: String) -> bool:
	return item_name in banned_items
