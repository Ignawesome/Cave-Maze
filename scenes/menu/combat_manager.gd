extends Node

var heart := preload("res://scenes/components/dice_box/heart.tres")
var shield := preload("res://scenes/components/dice_box/shield.tres")
var skull := preload("res://scenes/components/dice_box/skull.tres")
var star := preload("res://scenes/components/dice_box/star.tres")
var sword := preload("res://scenes/components/dice_box/sword.tres")
var bomb := preload("res://scenes/components/dice_box/bomb.tres")

var die_sides : Array[DieSide] = [bomb, heart, shield, skull, star, sword]

signal combat_started(Enemy)
signal add_enemy_hp(DieSide)
signal remove_enemy_hp(DieSide)
signal asd
signal player_attacked(PlayerResource)

var combat_scene : PackedScene = preload("res://scenes/menu/combat_scene.tscn")

var die_scene := "res://scenes/components/dice_box/die.tscn"

var enemy = preload("res://assets/horror.tres")
var enemy_hp : Array[DieSide]

# start combat: set enemy picture and enemy hp dice
# attack: throw dice, check result, remove hp from enemy, kill enemy if no dice, damage players if dice remaining
# item: show player-specific inventory, hide inventory
# rest: heal player

func _ready() -> void:
	start_combat(enemy)

func start_combat(enemy : Enemy):
	combat_started.emit(enemy)
	enemy_hp.clear()

	get_tree().change_scene_to_file("res://scenes/menu/combat_scene.tscn")

	#Send dice textures to the HP Panel
	for hp in enemy.HP:

		var random_side : DieSide = die_sides.pick_random()
		enemy_hp.append(random_side)

		add_enemy_hp.emit(random_side)


func player_attack():
	player_attacked.emit()
	asd.emit()




func attack_result(result : DieSide):
	if result in enemy_hp:
		enemy_hp.erase(result)
		remove_enemy_hp.emit(result)

#	if results.has("Sword"):
#		print_to_battle_log("monster slain")
#	if results.has("Shield"):
#		print_to_battle_log("didn't get hit")

#func print_to_battle_log(message :String):
#	var label = Label.new()
#	battle_log.add_child(label)
#	label.set_text(message)


#func _on_combat_ui_attack() -> void:
#	diebox_panel.clear()
#	for i in Character1STR:
#		diebox_panel.spawn_die(die_scene)
#	for i in Character2STR:
#		diebox_panel.spawn_die(die_scene)
#	print_to_battle_log("Attacked creature for X damage")



#func _on_combat_ui_item() -> void:
#	if inventory.visible:
#		inventory.hide()
#	else:
#		inventory.show()
#
#
#func _on_combat_ui_rest() -> void:
#	pass # Replace with function body.
#
#
#func _on_combat_ui_spell() -> void:
#	pass # Replace with function body.
