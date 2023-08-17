extends PanelContainer
class_name ItemSlot

var occupied : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	occupied = self.get_child_count()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
