@tool
extends Area2D
class_name Interactible


@export var item : ItemResource
@export var auto_generate : bool

@onready var sprite = $Sprite2D
@onready var collision_polygon_2d = $CollisionPolygon2D


signal interactible_interact(item : ItemResource)
signal interactible_examine(item : ItemResource)


func _ready():
	if auto_generate:
		sprite.set_texture(item.texture)
		_set_collision_polygons(sprite.texture.get_image())
	
	
	
	
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == 2 \
	and event.pressed:
		if item.interactible:
			pass
#		interactible_examine.emit(item)
	elif event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.pressed:
		item.examine_item()
#		interactible_interact.emit(item)
	

	
func _set_collision_polygons(image : Image):
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image)
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, image.get_size()), 1)
	for poly in polys:
		collision_polygon_2d.polygon = poly
		if sprite.centered:
			collision_polygon_2d.position -= Vector2(bitmap.get_size()/2)
		else:
			collision_polygon_2d.position = sprite.position



func read_description(item_id):
	pass

func use_item_with_interactible(hand_item : ItemResource, other_item : ItemResource):
	pass

func pick_up_interactible(item_id):
	pass

func interact(item_id):
	pass


