@tool
extends Area2D
class_name Interactible


@export var item : ItemResource
@export var auto_generate := true

@onready var sprite = $Sprite2D
@onready var collision_polygon_2d = $CollisionPolygon2D


signal interact_signal(item : ItemResource)
signal examine_signal(item : ItemResource)
signal interact_held_item_signal(item : ItemResource, hand_item : ItemResource)

func _ready():
	if auto_generate:
		sprite.set_texture(item.texture)
		_set_collision_polygons(sprite.texture.get_image())

func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == 2 \
	and event.pressed:
		examine_item(item)
		examine_signal.emit(item)
	if event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.pressed:
		var held_item = SceneDb.held_item.held_item_var
		if held_item:
			check_item_interaction(held_item, item)
			interact_held_item_signal.emit(item, held_item)
		else:
			interact_with_item(item)
			interact_signal.emit(item)


func examine_item(item : ItemResource):
	print("it's a BASE CLASS suitcase ")
	DialogueManager.show_example_dialogue_balloon(item.dialogue, item.name + "Description")
	
func check_item_interaction(hand_item : ItemResource, other_item : ItemResource):
	print("Base class item interaction")

func interact_with_item(item):
	print("Base class simple interaction")

func pick_up_interactible(item_id):
	pass





func _set_collision_polygons(image : Image):
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image)
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, image.get_size()), 5)
	for poly in polys:
		collision_polygon_2d.polygon = poly
		if sprite.centered:
			collision_polygon_2d.position -= Vector2(image.get_size()/2)
		else:
			collision_polygon_2d.position = sprite.position
