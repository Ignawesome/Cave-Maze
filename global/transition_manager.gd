extends CanvasLayer

signal screen_is_normal
signal screen_is_black

func _process(delta):
	if Input.is_action_just_pressed("fade_in"):
		fade_in()
	if Input.is_action_just_pressed("fade_out"):
		fade_out()

#func _ready():
#	hide()

func fade_in():
	show()
	$TransitionPlayer.play("fade_in")
	await $TransitionPlayer.animation_finished

func fade_out():
	show()
	$TransitionPlayer.play("fade_out")
	await $TransitionPlayer.animation_finished

func _on_transition_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		screen_is_normal.emit(true)
	if anim_name == "fade_out":
		screen_is_normal.emit(false)
