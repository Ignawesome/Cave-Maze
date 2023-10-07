extends Control

var paused := false :
	set = pause_game

signal game_paused_signal(bool)

func _ready():
	self.process_mode = PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		if StateManager.confirm_current_game_state(StateManager.GAME_STATES.PAUSE):
			StateManager.change_state(StateManager.GAME_STATES.PLAYING)
		elif StateManager.confirm_current_game_state(StateManager.GAME_STATES.PLAYING) \
		or StateManager.confirm_current_game_state(StateManager.GAME_STATES.INVENTORY) \
		or StateManager.confirm_current_game_state(StateManager.GAME_STATES.CUTSCENE):
			StateManager.change_state(StateManager.GAME_STATES.PAUSE)

#func pause_game():
#	if StateManager.confirm_current_game_state(StateManager.GAME_STATES.PAUSE):
#		StateManager.change_state_to_previous()
#	elif StateManager.confirm_current_game_state(StateManager.GAME_STATES.PLAYING) \
#	or StateManager.confirm_current_game_state(StateManager.GAME_STATES.INVENTORY) \
#	or StateManager.confirm_current_game_state(StateManager.GAME_STATES.CUTSCENE):
#		StateManager.change_state(StateManager.GAME_STATES.PAUSE)

func pause_game(p : bool) -> void:
	paused = p
	if p:
		self.show()
		get_tree().set_pause(true)
		game_paused_signal.emit(true)
	else:
		self.hide()
		get_tree().set_pause(false)
		game_paused_signal.emit(false)


#func _on_visibility_changed():
#	if visible:
#		StateManager.change_state(StateManager.GAME_STATES.PAUSE)
#	else:
#		StateManager.change_state(StateManager.GAME_STATES.PLAYING)


func _on_continue_button_pressed():
	StateManager.change_state_to_previous()

func _on_reload_button_pressed():
	StateManager.change_state(StateManager.GAME_STATES.PLAYING)
	SceneDb.main.new_game()

func _on_settings_button_pressed():
	StateManager.change_state(StateManager.GAME_STATES.SETTINGS)

func _on_quit_button_pressed():
	StateManager.change_state(StateManager.GAME_STATES.MENU)
