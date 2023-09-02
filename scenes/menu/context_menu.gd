extends PopupMenu

signal context_menu

func _on_index_pressed(index):
	context_menu.emit(index)
