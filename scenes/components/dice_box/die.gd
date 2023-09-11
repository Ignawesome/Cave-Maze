extends RigidBody3D
class_name DieClass

signal result

enum SIDES_LIST {
	SKULL,
	BOMB,
	STAR,
	HEART,
	SHIELD,
	SWORD
}

var highest_side

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = randi_range(-10, 10)
	var y = randi_range(-10, 10)
	var z = randi_range(-10, 10)
	set_angular_velocity(Vector3i(x, y, z))

func _physics_process(delta):
	if self.get_contact_count() > 0:
		set_angular_damp(angular_damp * 1.5)
		if self.gravity_scale < 10:
			set_gravity_scale(gravity_scale * 1.5)

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

#func _on_contact():
#	if self.gravity_scale < 20:
#		set_gravity_scale(gravity_scale * 1.1)
