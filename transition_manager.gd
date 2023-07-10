class_name TransitionManagerClass extends CanvasLayer

signal screen_is_black
signal screen_is_normal


func fade_in():
	_fade_from_black()
	await screen_is_normal
	
func fade_out():
	_fade_to_black()
	await screen_is_black
			
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("screen_is_black")
	
	elif anim_name == "fade_from_black":
		emit_signal("screen_is_normal")
		
func _fade_from_black():
	$TransitionPlayer.play("fade_from_black")

func _fade_to_black():
	$TransitionPlayer.play("fade_to_black")


func transition_to_quit():
	show()
	_fade_to_black()
	await get_tree().create_timer(1).timeout
	get_tree().quit()
