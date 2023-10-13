extends Resource
class_name Enemy

@export var HP = 4
@export var texture : Texture2D

var hp_values : Array = ["Sword", "Star", "Heart",]

var dice_to_beat : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("enemy resource entered the tree")
	dice_to_beat.clear()
	for i in HP:
		var value = hp_values.pick_random()
		dice_to_beat.append(value)

func _on_enemy_hit():
	pass
