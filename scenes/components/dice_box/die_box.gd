extends Node3D

@onready var camera_3d = %DieCamera
@onready var die_spawner = %DieSpawner

signal result(Dictionary)
signal side_hit(DieSide)


var die_scene := "res://scenes/components/dice_box/die.tscn"
var results = []
var dice_array = []
var result_count : Dictionary = {}


func clear():
	for die in dice_array:
		die.queue_free()
	dice_array.clear()
	result_count.clear()
	results.clear()


func _input(event):
	if Input.is_mouse_button_pressed(1):
		get_tree().reload_current_scene()
	if Input.is_mouse_button_pressed(2) and event.is_pressed():
		spawn_die(die_scene)

func result_tally(side : DieSide):
	results.append(side)
	side_hit.emit(side)


#	if result_count.has(side):
#		result_count[side] += 1
#	else:
#		result_count[side] = 1
#	print(result_count)
#	result.emit(result_count)


func spawn_die(die_path : String) -> void:
	var new_die = load(die_path).instantiate()
	die_spawner.add_child(new_die)
	new_die.result.connect(result_tally)
	dice_array.append(new_die)

func find_average_position(array):
	var positions := Vector3.ZERO
	for node in array:
		positions += node.global_position
	var average_position = positions / array.size()
	return average_position
