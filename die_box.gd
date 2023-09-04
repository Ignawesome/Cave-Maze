extends Node3D

@onready var camera_3d = %DieCamera
@onready var die_spawner = %DieSpawner

signal result

var die_scene := "res://die.tscn"
var results = []
var dice_array = []
var result_count : Dictionary = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_die(die_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	var first_die = dice_array[0]
#	camera_3d.look_at_from_position(first_die.global_position - Vector3(0,4,0), first_die.global_position, Vector3.UP)
#	set_position(first_die.global_position - Vector3(0,-4,0))
#	
#	print(dice_array[0].global_position)
#	var camera_aim
#	if dice_array.size() > 0:
#		camera_aim = find_average_position(dice_array)
#	%DieCamera.look_at(camera_aim, Vector3.UP)
	
func _input(event):
	if Input.is_mouse_button_pressed(1):
		get_tree().reload_current_scene()
	if Input.is_mouse_button_pressed(2) and event.is_pressed():
		spawn_die(die_scene)

func result_tally(side : StringName):
	results.append(side)
	if result_count.has(side):
		result_count[side] += 1
	else:
		result_count[side] = 1
	print(result_count)

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
