extends RigidBody3D
class_name DieClass

signal result

<<<<<<< Updated upstream
enum SIDES_LIST {
	SKULL,
	BOMB,
	STAR,
	HEART,
	SHIELD,
	SWORD
}

var highest_side
=======
var sides : Array[DieSide] = [heart_side, shield_side, skull_side, star_side, sword_side, bomb_side]

var heart_side := preload("res://scenes/components/dice_box/heart.tres")
var shield_side := preload("res://scenes/components/dice_box/shield.tres")
var skull_side := preload("res://scenes/components/dice_box/skull.tres")
var star_side := preload("res://scenes/components/dice_box/star.tres")
var sword_side := preload("res://scenes/components/dice_box/sword.tres")
var bomb_side := preload("res://scenes/components/dice_box/bomb.tres")

>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = randi_range(-10, 10)
	var y = randi_range(-10, 10)
	var z = randi_range(-10, 10)
	set_angular_velocity(Vector3i(x, y, z))

<<<<<<< Updated upstream
func _physics_process(delta):
	if self.get_contact_count() > 0:
		set_angular_damp(angular_damp * 0.1)
		if self.gravity_scale < 10:
			set_gravity_scale(gravity_scale * 1.5)
=======
>>>>>>> Stashed changes

func _on_sleeping_state_changed():
	var sides = %Sides
	if self.sleeping:
		var top = 0
		for side in sides.get_children():
			if side.global_position.y > top:
				top = side.global_position.y
				highest_side = side
		result.emit(highest_side.name)
		self.set_freeze_enabled(true)
