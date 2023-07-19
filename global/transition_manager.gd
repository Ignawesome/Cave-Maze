extends CanvasLayer

@onready var main_menu = SceneDb.menu_node
@onready var caves = SceneDb.caves_node

func _ready():
#	main_menu.quit_signal.connect(quit_transition)
	print("menu: ", main_menu)

func _process(delta):
	pass
#	if Input.is_action_just_pressed("fade_in"):
#		$TransitionPlayer.play("fade_in")
#	if Input.is_action_just_pressed("fade_out"):
#		$TransitionPlayer.play("fade_out")

#func transition():
#	$TransitionPlayer.play_backwards("fade_in")
#	if not $TransitionPlayer.is_playing():
#		$TransitionPlayer.play_backwards("fade_in")

func fade_in():
	$TransitionPlayer.play("fade_in")
#	print("faded in finished")
	await $TransitionPlayer.is_playing()
	

func fade_out():
	$TransitionPlayer.play_backwards("fade_in")
#	print("faded out finished")
	await $TransitionPlayer.is_playing()

	
func quit_transition():
	$TransitionPlayer.play_backwards("fade_in")
	if not $TransitionPlayer.is_playing():
		get_tree().quit()


















#
#signal screen_is_black
#signal screen_is_normal
#
#
#func fade_in():
#	_fade_from_black()
#	await screen_is_normal
#
#func fade_out():
#	_fade_to_black()
#	await screen_is_black
#
#func _on_animation_player_animation_finished(anim_name):
#	if anim_name == "fade_to_black":
#		emit_signal("screen_is_black")
#
#	elif anim_name == "fade_from_black":
#		emit_signal("screen_is_normal")
#
#func _fade_from_black():
#	$TransitionPlayer.play("fade_from_black")
#
#func _fade_to_black():
#	$TransitionPlayer.play("fade_to_black")
#
#
#func transition_to_quit():
#	show()
#	_fade_to_black()
#	await get_tree().create_timer(1).timeout
#	get_tree().quit()
