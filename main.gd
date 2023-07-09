extends Node



# Start -> First Room
# Click on correct door -> Instantiate new scene, free first scene, store first scene in previous_room
# Click on wrong door -> new scene, room count = 0
# If room_count = 0 - Click on back -> Nothing
# Room count +1
#
# Other rooms
# Click on correct door -> Instantiate new scene, free first scene, room count +1
# Click on wrong door = start over, room count = 0
# Click on back -> Go to previous_scene, room count -1 but not less than 0
# 
# Final room
# If room count >= 9
# Click on correct door = final scene
# Click on wrong door = start over, room count = 0
# Click on back -> go to previous scene
# Change


var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var current_room = room_number[0]
var next_room = current_room + 1
var previous_room = current_room - 1

const end_scene : PackedScene = preload("res://end.tscn")

func _on_left_door_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		if 1 == maze.solution.get(room_number[current_room]) :
			print("Correct")
			if room_number[current_room] < 9:
				current_room += 1
				go_to_next_room()
			else:
				print("You win!")
				#end_game()
				pass
		else:
			print("Wrong way")
			current_room = room_number[0]
		print("Entered door 1")



func _on_middle_door_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		if 2 == maze.solution.get(room_number[current_room]) :
			print("Correct")
			if room_number[current_room] < 9:
				current_room += 1
			else:
				print("You win!")
				#end_game()
				pass
		else:
			print("Wrong way")
			current_room = room_number[0]
		print("Entered door 2")
	pass # Replace with function body.


func _on_right_door_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		if 3 == maze.solution.get(room_number[current_room]) :
			print("Correct")
			if room_number[current_room] < 9:
				current_room += 1
			else:
				print("You win!")
				#end_game()
				pass
		else:
			print("Wrong way")
			current_room = room_number[0]
		print("Entered door 3")
	pass # Replace with function body.


func _on_back_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("left_click"):
		print("Went back")
		current_room -= 1
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current room:", current_room)

func go_to_next_room() -> void:
	$CaveScene.queue_free()
	await get_tree().create_timer(1.0).timeout
	self.add_child(Maze.room.instantiate())
	
func end_game() -> void:
	$CaveScene.queue_free()
	self.add_child(end_scene.instantiate())
	
