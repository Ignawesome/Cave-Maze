extends PopupMenu

signal context_menu

func _on_index_pressed(index):
	context_menu.emit(index)


func _on_popup_hide():
	self.queue_free()
	pass # Replace with function body.
