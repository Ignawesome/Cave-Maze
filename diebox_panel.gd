extends PanelContainer

signal result(Dictionary)


@onready var die_box: Node3D = %DieBox
@onready var enemy_hp: GridContainer = %EnemyHP


func clear():
	die_box.clear()

func spawn_die(die_path : String) -> void:
	die_box.spawn_die(die_path)

func add_hp_die(side : TargetSide):
	enemy_hp.add_child(side)

func substract_hp(side : TargetSide):
	enemy_hp.remove_child(side)


func _on_die_box_result(results : Dictionary) -> void:
	result.emit(results)
	pass # Replace with function body.



func _on_die_box_side_hit(side : DieSide) -> void:
	for i in enemy_hp.get_children():
		if i.target_side == side:
			substract_hp(i)
			break

