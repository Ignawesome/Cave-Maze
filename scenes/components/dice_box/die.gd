extends RigidBody3D
class_name DieClass

signal result(DieSide)

enum SIDES_LIST {
	SKULL,
	BOMB,
	STAR,
	HEART,
	SHIELD,
	SWORD
}

var sides : Array[DieSide] = [heart_side, shield_side, skull_side, star_side, sword_side, bomb_side]

var heart_side := preload("res://scenes/components/dice_box/heart.tres")
var shield_side := preload("res://scenes/components/dice_box/shield.tres")
var skull_side := preload("res://scenes/components/dice_box/skull.tres")
var star_side := preload("res://scenes/components/dice_box/star.tres")
var sword_side := preload("res://scenes/components/dice_box/sword.tres")
var bomb_side := preload("res://scenes/components/dice_box/bomb.tres")




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = randi_range(-10, 10)
	var y = randi_range(-10, 10)
	var z = randi_range(-10, 10)
	set_angular_velocity(Vector3i(x, y, z))
	apply_impulse(Vector3i(x, 0, z), Vector3.ZERO)


#func _physics_process(delta):
#	if self.get_contact_count() > 0:
#		set_angular_damp(angular_damp * 0.1)
#		if self.gravity_scale < 10:
#			set_gravity_scale(gravity_scale * 1.5)

func _on_sleeping_state_changed():
	var sides = %Sides
	var highest_side : DieSide
	if self.sleeping:
		var top = 0
		for side in sides.get_children():
			if side.global_position.y > top:
				top = side.global_position.y
				highest_side = side.side
		if highest_side:
			result.emit(highest_side)
		else:
			#Todo: reroll the die
			print("error calculating highest side")
		self.set_freeze_enabled(true)

#func _on_contact():
#	if self.gravity_scale < 20:
#		set_gravity_scale(gravity_scale * 1.1)
