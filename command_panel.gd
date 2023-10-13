extends PanelContainer

signal attack
signal item
signal spell
signal rest

@export var player := PlayerResource
@export var side : DieSide
@onready var enemy_hp: PanelContainer = %EnemyHP


func _on_attack_button_pressed() -> void:
#	attack.emit()
	CombatManager.player_attacked.emit(player)


func _on_item_button_pressed() -> void:
	item.emit()

func _on_rest_button_pressed() -> void:
	rest.emit()

func _on_spell_button_pressed() -> void:
	spell.emit()
