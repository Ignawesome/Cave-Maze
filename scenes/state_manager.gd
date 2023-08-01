extends Node
class_name GameState

var current_state : int

enum GAME_STATES {
	CUTSCENE,
	PLAYING,
	MENU,
	LOADING,
	END,
	SETTINGS
	}

func change_state(state):
	current_state = state
	match current_state:		
		GAME_STATES.CUTSCENE:
			print("State set to: CUTSCENE ", current_state)
			show_mouse(false)
			playing_state(false)
			
		GAME_STATES.PLAYING:
			print("State set to: PLAYING ", current_state)
			if $"../UI".get_node_or_null("MainMenu"):
				$"../UI".get_node_or_null("MainMenu").queue_free()
			playing_state(true)
			show_mouse(true)
			#play cave music
			
		GAME_STATES.MENU:
			print("State set to: MENU ", current_state)
			show_mouse(true)
			playing_state(false)
			#play menu music
			
		GAME_STATES.LOADING:
			print("State set to: LOADING ", current_state)
			playing_state(false)
			show_menu(false)
			show_mouse(false)
			
			
		GAME_STATES.SETTINGS:
			print("State set to: SETTINGS ", current_state)
			playing_state(false)
			show_mouse(true)
			
		GAME_STATES.END:
			print("State set to: END ", current_state)
			playing_state(false)
			show_mouse(true)
			#play victory or defeat music
			

			
func playing_state(playing : bool):
	if playing:
		pass
	if not playing:
		pass

func show_mouse(show):
	if show:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	if not show:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func show_menu(show):
	var main_menu_node : Control
	if show:
		main_menu_node = SceneDb.main_menu.instantiate()
		SceneDb.user_interface.add_child(main_menu_node)
	elif not show and (main_menu_node != null):
		main_menu_node.queue_free()
