extends Timer




# Called when the node enters the scene tree for the first time.
func _ready():
	start(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	var count = 0
	count +=1
	print(count)
	timeout.emit()
	pass # Replace with function body.
