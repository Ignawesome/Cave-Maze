extends Resource
class_name ItemResource

@export var name : String
@export var tooltip : String
@export var id : int
@export var texture : Texture2D
@export var description : String

const SIZE := Vector2i(32,32)
var icon : Texture2D

@export var consumable : bool
@export var max_stack := 9

@export var permanent : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func inventory_slot(invetory_node):
	
	pass

