extends PanelContainer

signal result(Dictionary)


@onready var die_box: Node3D = %DieBox
#@onready var enemy_hp: GridContainer = %EnemyHP

func _ready() -> void:
	CombatManager.player_attacked.connect(on_attack)
	print("die panel ready")


func on_attack(player : PlayerResource) -> void:
	clear()
	spawn_die(player.die)
	if player.has_weapon():
		spawn_die(player.weapon.die)


func clear():
	die_box.clear()

func spawn_die(die_path : String) -> void:
	die_box.spawn_die(die_path)


func _on_die_box_result(results : Dictionary) -> void:
	result.emit(results)
