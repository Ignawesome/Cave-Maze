extends Control

@onready var audio_container = $PanelContainer/HBoxContainer/PanelContainer/AudioContainer
@onready var display_container = $PanelContainer/HBoxContainer/PanelContainer/DisplayContainer
@onready var controls_container = $PanelContainer/HBoxContainer/PanelContainer/ControlsContainer

var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

@onready var current_monitor : int = get_window().get_current_screen()
@onready var screen_size = DisplayServer.screen_get_size(current_monitor)
@onready var window_size = get_window().get_size()

const RESOLUTION_X1 = Vector2i(480,270)
var screen_size_option = 3



var fullscreen = true

# Initialize buttons to the current values
func _ready():
	%MasterVolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus))
	%MusicVolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))
	%SoundVolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus))
	%ResolutionOptionButton._select_int(screen_size_option)
	%FullscreenCheckBox.button_pressed = fullscreen
	
# Buttons that show and hide sections of settings
func _on_audio_button_button_down():
	display_container.hide()
	controls_container.hide()
	audio_container.show()

func _on_display_button_button_down():
	display_container.show()
	controls_container.hide()
	audio_container.hide()

func _on_controls_button_button_down():
	display_container.hide()
	controls_container.show()
	audio_container.hide()

func _on_main_menu_button_button_down():
	self.queue_free()
	SceneDb.main.show_menu()


# Code related to volume sliders
func set_volume(bus, value):
	AudioServer.set_bus_volume_db(bus, linear_to_db(value))

func _on_master_volume_slider_value_changed(value):
	set_volume(master_bus, value)

func _on_music_volume_slider_value_changed(value):
	set_volume(music_bus, value)

func _on_sound_volume_slider_value_changed(value):
	set_volume(sfx_bus, value)


# Code related to window sizing
func _on_resolution_option_button_item_selected(index):
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	match index:
		0:
			change_resolution(index+1)
			center_screen()
		1:
			change_resolution(index+1)
			center_screen()
		2:
			change_resolution(index+1)
			center_screen()
		3:
			change_resolution(index+1)
			get_window().set_size(RESOLUTION_X1 * 4)

func change_resolution(resolution):
	screen_size_option = resolution
	get_window().set_size(RESOLUTION_X1 * resolution)
	if resolution < 4:
		fullscreen = false
		%FullscreenCheckBox.button_pressed = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		fullscreen = true
		%FullscreenCheckBox.button_pressed = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func change_monitor(monitorID):
	current_monitor = monitorID
	get_window().set_current_screen(current_monitor)
	center_screen()

func _on_fullscreen_check_box_toggled(button_pressed):
	if button_pressed:
		fullscreen = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		fullscreen = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func center_screen():
	window_size = get_window().get_size()
	get_window().position = (screen_size * 0.5 - window_size * 0.5)
	get_window().set_current_screen(current_monitor)
