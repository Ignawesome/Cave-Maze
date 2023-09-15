extends Node
class_name GameState

var current_state : GAME_STATES : set = change_state, get = get_current_game_state
var previous_state : int

var is_item_in_hand : bool

signal game_state_changed_to(state : int)

enum GAME_STATES {
	CUTSCENE,
	PLAYING,
	MENU,
	LOADING,
	END,
	SETTINGS,
	INVENTORY,
	PAUSE
	}

func _ready():
	SceneDb.held_item.item_held_signal.connect(_is_item_in_hand)

func get_current_game_state() -> GAME_STATES:
	return current_state
	
func confirm_current_game_state(game_state : GAME_STATES) -> bool:
	return true if game_state == current_state else false

func change_state(state : GAME_STATES):
	previous_state = current_state
	current_state = state
	game_state_changed_to.emit(state)
	
	match current_state:		
		GAME_STATES.CUTSCENE:
			print("State set to: CUTSCENE ", current_state)
			show_mouse(false)
			playing_state(false)
			hide_inventory(true)
			show_pause_menu(false)
			
		GAME_STATES.PLAYING:
			print("State set to: PLAYING ", current_state)
			show_menu(false)
			playing_state(true)
			show_mouse(true)
			hide_inventory(true)
			show_pause_menu(false)
			#play cave music
			
		GAME_STATES.MENU:
			print("State set to: MENU ", current_state)
			show_mouse(true)
			playing_state(false)
			hide_inventory(true)
			show_menu(true)
			show_pause_menu(false)
			#play menu music
			
		GAME_STATES.LOADING:
			print("State set to: LOADING ", current_state)
			playing_state(false)
			show_menu(false)
			show_mouse(false)
			hide_inventory(true)
			show_pause_menu(false)
			
		GAME_STATES.SETTINGS:
			print("State set to: SETTINGS ", current_state)
			playing_state(false)
			show_mouse(true)
			hide_inventory(true)
			show_menu(false)
			show_pause_menu(false)
			show_settings(true)
			
		GAME_STATES.END:
			print("State set to: END ", current_state)
			playing_state(false)
			show_mouse(true)
			hide_inventory(true)
			show_pause_menu(false)
			#play victory or defeat music
			
		GAME_STATES.INVENTORY:
			print("State set to: INVENTORY ", current_state)
			show_mouse(true)
			playing_state(true)
			hide_inventory(false)
			show_pause_menu(false)
			
		GAME_STATES.PAUSE:
			print("State set to: PAUSE ", current_state)
			playing_state(false)
			show_mouse(true)
			hide_inventory(true)
			show_menu(false)
			show_pause_menu(true)

func change_state_to_previous():
	change_state(previous_state)
	
func show_pause_menu(pause):
	SceneDb.pause_menu.pause_game(pause)

			
func playing_state(playing : bool):
	if playing:
		pass
	if not playing:
		pass

func show_mouse(show):
	if show:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func show_menu(show):
# = SceneDb.user_interface.find_child("MainMenu", false, false)
	if show:
		SceneDb.main_menu_node.show()
	else:
		SceneDb.main_menu_node.hide()


func show_settings(show):
	if show:
		SceneDb.settings.show()
	else:
		SceneDb.settings.hide()

func hide_inventory(hide):
	if hide:
		SceneDb.inventory.hide()
	else:
		SceneDb.inventory.show()

func _is_item_in_hand():
	is_item_in_hand = SceneDb.held_item.get("being_dragged")
	return is_item_in_hand
