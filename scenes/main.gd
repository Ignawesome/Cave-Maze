extends Node


@onready var cave_node_start : Node2D = get_node("/root/Main/GameWorld").get_child(0)

func _ready():
	cave_node_start.check_door.connect(_on_game_world_check_door)
	

	

func new_room():
	var cave_scene = load("res://scenes/game/caves.tscn")
	cave_node_start.queue_free()
	print("new room")
	var cave_node = cave_scene.instantiate()
	await get_tree().create_timer(2).timeout
	$GameWorld.add_child(cave_node)
	cave_node.check_door.connect(_on_game_world_check_door)
	cave_node_start = get_node("/root/Main/GameWorld").get_child(0)



func _on_game_world_check_door(door : int):
	match door:
		1: new_room()
		2: new_room()
		3: new_room()
	pass # Replace with function body.
