@tool
extends Resource
class_name ItemResource

@export var name : StringName
@export var tooltip : String
@export var texture : AtlasTexture
@export_multiline var description : String	
@export var dialogue : DialogueResource
#@export var title : String

@export var permanent : bool
@export var undraggable : bool
@export var pickable : bool
@export var interactible : bool

@export var times_interacted := 0
@export var combinations : Array[StringName]
@export var specific_script : Script

#@export var collision : PackedVector2Array
#@export var collision_shape : Shape2D
#@export var max_stack := 9
#@export var id : int

#Actions: Pick up item, Examine item, Use item effect, Trigger/Toggle event, Change location
#Use item with other item

const ICON_SIZE := Vector2i(16,16)

func open_door():
	pass

func examine_item(title : String):
	pass
	
func interact_with_item(item : ItemResource):
	pass
	
func check_item_interaction(item  : ItemResource, other_item : ItemResource):
	pass

