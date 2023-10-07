extends Control


@onready var inventory: Panel = %Inventory
@onready var diebox_panel: PanelContainer = %DieboxPanel

@export var Character1STR = 2
@export var Character2STR = 2

@onready var combat_ui: PanelContainer = %CombatUI
@onready var battle_log: VBoxContainer = %BattleLog

#var bomb = preload("res://assets/textures/icons/bomb_side.png")
#var heart = preload("res://assets/textures/icons/heart_side.png")
#var shield = preload("res://assets/textures/icons/shield_side.png")
#var skull = preload("res://assets/textures/icons/skull_side.png")
#var star = preload("res://assets/textures/icons/star_side.png")
#var sword = preload("res://assets/textures/icons/sword_side.png")


var heart := preload("res://scenes/components/dice_box/heart.tres")
var shield := preload("res://scenes/components/dice_box/shield.tres")
var skull := preload("res://scenes/components/dice_box/skull.tres")
var star := preload("res://scenes/components/dice_box/star.tres")
var sword := preload("res://scenes/components/dice_box/sword.tres")
var bomb := preload("res://scenes/components/dice_box/bomb.tres")





var die_sides : Array[DieSide] = [bomb, heart, shield, skull, star, sword]

@export var enemy : Enemy


var die_scene := "res://scenes/components/dice_box/die.tscn"



func _ready() -> void:
	diebox_panel.result.connect(attack_result)
	start_combat(enemy)


func start_combat(enemy : Enemy):
	for hp in combat_ui.enemy.HP:
		var new_side = TargetSide.new()
		var random_side : DieSide = die_sides.pick_random()
		new_side.texture = random_side.texture
		new_side.target_side = random_side
		diebox_panel.add_hp_die(new_side)



func attack_result(results : Dictionary):
#	diebox_panel.substract_hp(results)
	if results.has("Sword"):
		print_to_battle_log("monster slain")
	if results.has("Shield"):
		print_to_battle_log("didn't get hit")

func print_to_battle_log(message :String):
	var label = Label.new()
	battle_log.add_child(label)
	label.set_text(message)


func _on_combat_ui_attack() -> void:
	diebox_panel.clear()
	for i in Character1STR:
		diebox_panel.spawn_die(die_scene)
	for i in Character2STR:
		diebox_panel.spawn_die(die_scene)
	print_to_battle_log("Attacked creature for X damage")



func _on_combat_ui_item() -> void:
	if inventory.visible:
		inventory.hide()
	else:
		inventory.show()


func _on_combat_ui_rest() -> void:
	pass # Replace with function body.


func _on_combat_ui_spell() -> void:
	pass # Replace with function body.
