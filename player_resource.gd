extends Resource
class_name PlayerResource

@export var HP : int = 12
@export var face : Texture2D
@export var name : StringName
@export var die : String

@export var die_resource : Resource # TODO Die resource
@export var weapon := WeaponResource
@export var item1 : ItemResource
@export var item2 : ItemResource


func has_weapon() -> bool:
#	if weapon is WeaponResource:
#		print("has weapon")
#		return true
#	else:
#		print("has no weapon")
		return false
