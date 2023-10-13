extends PanelContainer

#temporary
@export var enemy : Enemy
#/temp

@onready var enemy_texture : TextureRect = %EnemyTexture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CombatManager.combat_started.connect(show_enemy_image)
	if enemy:
		show_enemy_image(enemy)

func show_enemy_image(enemy : Enemy):
	print("enemy texture updated")
	enemy_texture.texture = enemy.texture

func on_enemy_defeated() -> void:
	pass
