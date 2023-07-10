extends Node

var room_number : Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var current_room : int = room_number[0]
var next_room = current_room + 1
var previous_room = current_room - 1

const cave_scene : PackedScene = preload("res://caves.tscn")
const end_scene : PackedScene = preload("res://end.tscn")
@onready var transition_manager = $TransitionManager

func _ready():
	$CaveScene.check_door_signal.connect(self.check_door)
	$CaveScene.going_back.connect(self.go_back)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Current room:", current_room)
	if Input.is_action_just_pressed("transition"):
		print("Start Transition")
		transition_manager.fade_out()
		await get_tree().create_timer(1).timeout
		transition_manager.fade_in()
		print("End Transition")
	
func check_door(door : int):
	transition_manager.fade_out()
	await get_tree().create_timer(1).timeout
	transition_manager.fade_in()	
	match door :
		1:
			print("Entered door 1")
			if 1 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 9:
					current_room += 1
					go_to_next_room()
				else:
					end_game()
			else:
				print("Wrong way")
				current_room = room_number[0]
		2:
			print("Entered door 2")
			if 2 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 9:
					current_room += 1
					go_to_next_room()
				else:
					end_game()
			else:
				print("Wrong way")
				current_room = room_number[0]
		3:
			print("Entered door 3")
			if 3 == maze.solution.get(room_number[current_room]) :
				print("Correct")
				if room_number[current_room] < 9:
					current_room += 1
					go_to_next_room()
				else:
					end_game()
			else:
				print("Wrong way")
				current_room = room_number[0]
			
func go_back():
	print("Went back")
	current_room -= 1
	


func go_to_next_room() -> void:
	$CaveScene.queue_free()
	self.add_child(cave_scene.instantiate())
	$CaveScene.check_door_signal.connect(self.check_door)
	$CaveScene.going_back.connect(self.go_back)
	
func end_game() -> void:
	$CaveScene.queue_free()
	self.add_child(end_scene.instantiate())





































#func _on_left_door_input_event(_viewport, _event, _shape_idx):
#	if Input.is_action_just_pressed("left_click"):
#		if 1 == maze.solution.get(room_number[current_room]) :
#			print("Correct")
#			if room_number[current_room] < 9:
#				current_room += 1
#				go_to_next_room()
#			else:
#				print("You win!")
#				end_game()
#				pass
#		else:
#			print("Wrong way")
#			current_room = room_number[0]
#		print("Entered door 1")
#
#
#
#func _on_middle_door_input_event(_viewport, _event, _shape_idx):
#	if Input.is_action_just_pressed("left_click"):
#		if 2 == maze.solution.get(room_number[current_room]) :
#			print("Correct")
#			if room_number[current_room] < 9:
#				current_room += 1
#			else:
#				print("You win!")
#				#end_game()
#				pass
#		else:
#			print("Wrong way")
#			current_room = room_number[0]
#		print("Entered door 2")
#	pass # Replace with function body.
#
#
#func _on_right_door_input_event(_viewport, _event, _shape_idx):
#	if Input.is_action_just_pressed("left_click"):
#		if 3 == maze.solution.get(room_number[current_room]) :
#			print("Correct")
#			if room_number[current_room] < 9:
#				current_room += 1
#			else:
#				print("You win!")
#				#end_game()
#				pass
#		else:
#			print("Wrong way")
#			current_room = room_number[0]
#		print("Entered door 3")
#	pass # Replace with function body.
#
#
#func _on_back_input_event(_viewport, _event, _shape_idx):
#	if Input.is_action_just_pressed("left_click"):
#		print("Went back")
#		current_room -= 1
#	pass # Replace with function body.


	
	
