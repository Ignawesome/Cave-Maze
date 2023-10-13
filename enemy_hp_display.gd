extends PanelContainer

@onready var enemy_hp: GridContainer = %EnemyHP

func _ready() -> void:
	print(self)
	CombatManager.add_enemy_hp.connect(add_hp_die)
	assert(CombatManager.add_enemy_hp.is_connected(add_hp_die))
	CombatManager.remove_enemy_hp.connect(remove_hp_die)
	assert(CombatManager.remove_enemy_hp.is_connected(remove_hp_die))
	CombatManager.asd.connect(add_hp_die)
	assert(CombatManager.asd.connect(add_hp_die))


func add_hp_die(side : DieSide):
	print("hp added")
	var new_hp : TextureRect = TextureRect.new()
	new_hp.texture = side.texture
	enemy_hp.add_child(new_hp)

func remove_hp_die(side : TextureRect):
	print("die removed")
	if side.texture == $EnemyHP/TextureRect.texture:
		enemy_hp.remove_child(side)

#		print("this shit doesnt work")
#		pass
#	else:
#		print("add signal should be connected")
#		print(CombatManager.add_enemy_hp.get_connections())
#		pass



#		print("this other shit also doesnt work")
#		pass
#	else:
#		print("remove signal should be connected")
#		print(CombatManager.remove_enemy_hp.get_connections())


