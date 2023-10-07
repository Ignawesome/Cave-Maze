extends TextureRect
class_name ItemDragged

@export var held_item_var : ItemResource

@onready var inventory : Control = %Inventory

signal item_held_signal(bool)

signal interact_signal(ItemResource)


var being_dragged := false :
	set(value):
		interact_signal.emit(value)
#		print("emitted being_dragged signal")
		being_dragged = value
	get:
		return being_dragged


func _ready():
	self.hide()
	inventory.item_dragging.connect(_on_item_dragging)
#	self.set("being_dragged", true)
#	_on_item_dragging(held_item_var)

func _physics_process(delta):
	if being_dragged == true:
		self.set_position(get_viewport().get_mouse_position() + Vector2(4,4))

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == 1 \
	and event.is_pressed() \
	and held_item_var:
		pass
#		interact.emit(held_item_var.name)
#		print("interact emitted from dragged item")
#		stop_item_dragging()
	elif event is InputEventMouseButton \
	and event.button_index == 2 \
	and event.is_pressed() \
	and get("being_dragged"):
		stop_item_dragging()
		get_viewport().set_input_as_handled()


func _on_item_dragging(item : ItemResource):
	Input.set_custom_mouse_cursor(SceneDb.mouse_drag, Input.CURSOR_ARROW)
	being_dragged = true
	held_item_var = item
	self.texture = item.texture
	self.show()


func stop_item_dragging():
	Input.set_custom_mouse_cursor(SceneDb.mouse_point, Input.CURSOR_ARROW)
	self.hide()
	held_item_var = null
	being_dragged = false

