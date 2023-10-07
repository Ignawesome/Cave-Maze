extends PanelContainer
class_name EnemyCombat

signal attack
signal item
signal spell
signal rest

@export var enemy : Enemy
@onready var enemy_texture : TextureRect = %EnemyTexture


var dice_to_beat : Array
var hp_values : Array = ["Sword", "Star", "Heart",]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func start(enemy : Enemy):
	enemy_texture.texture = enemy.texture

func _on_enemy_hit():
	pass



func _on_attack_button_pressed() -> void:
	attack.emit()

func _on_item_button_pressed() -> void:
	item.emit()


func _on_rest_button_pressed() -> void:
	rest.emit()


func _on_spell_button_pressed() -> void:
	spell.emit()
