extends Control

var config_file = ConfigFile.new()

@onready var audio_container := %AudioContainer
@onready var display_container := %DisplayContainer
@onready var controls_container := %ControlsContainer

var master_bus := AudioServer.get_bus_index("Master")
var music_bus := AudioServer.get_bus_index("Music")
var sfx_bus := AudioServer.get_bus_index("SFX")

@onready var current_monitor : int = get_window().get_current_screen()
@onready var screen_size := DisplayServer.screen_get_size(current_monitor)
@onready var window_size := get_window().get_size()

const RESOLUTION_X1 := Vector2i(480,270)

#Values to be saved
var screen_size_option := 3
var fullscreen : bool
var load_fullscreen
var master_volume
var music_volume
var sfx_volume

func _ready():
	load_and_apply_all_settings_from_file(config_file)

# Initialize buttons to the current values
func load_and_apply_all_settings_from_file(file):
	load_settings_from_file(file)
	apply_config_to_settings()
	apply_settings_to_ui()
	
func apply_config_to_settings():
	set_all_volumes()
	change_resolution(screen_size_option)
	_on_fullscreen_check_box_toggled(load_fullscreen)
	change_monitor(current_monitor)

func apply_settings_to_ui():
	%MasterVolumeSlider.value = master_volume
	%MusicVolumeSlider.value = music_volume
	%SoundVolumeSlider.value = sfx_volume
	%ResolutionOptionButton._select_int(screen_size_option - 1)
	%FullscreenCheckBox.button_pressed = load_fullscreen

func load_settings_from_file(file):
	var err = file.load("res://settings.cfg")
	if err != OK:
		return

	master_volume = file.get_value("Audio", "Master Volume", db_to_linear(AudioServer.get_bus_volume_db(master_bus)))
	music_volume = file.get_value("Audio", "Music Volume", db_to_linear(AudioServer.get_bus_volume_db(music_bus)))
	sfx_volume = file.get_value("Audio", "SFX Volume", db_to_linear(AudioServer.get_bus_volume_db(sfx_bus)))
	screen_size_option = file.get_value("Display", "Resolution", screen_size_option)
	load_fullscreen = file.get_value("Display", "Fullscreen", true)
	current_monitor = file.get_value("Display", "Monitor", 0)

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
	config_file.save("res://settings.cfg")
	self.hide()
	StateManager.change_state_to_previous()
	SceneDb.main.show_menu()

func _on_reset_button_button_down():
	#TODO
	pass # Replace with function body.

# Code related to volume sliders
func set_volume(bus, value):
	AudioServer.set_bus_volume_db(bus, linear_to_db(value))

func set_all_volumes():
	set_volume(master_bus, master_volume)
	set_volume(music_bus, music_volume)
	set_volume(sfx_bus, sfx_volume)

func _on_master_volume_slider_value_changed(value):
	set_volume(master_bus, value)
	config_file.set_value("Audio", "Master Volume", value)

func _on_music_volume_slider_value_changed(value):
	set_volume(music_bus, value)
	config_file.set_value("Audio", "Music Volume", value)

func _on_sound_volume_slider_value_changed(value):
	set_volume(sfx_bus, value)
	config_file.set_value("Audio", "SFX Volume", value)


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

func change_resolution(resolution):
	screen_size_option = resolution
	get_window().set_size(RESOLUTION_X1 * resolution)
	if resolution < 4:
		fullscreen = false
		%FullscreenCheckBox.button_pressed = false
		_on_fullscreen_check_box_toggled(false)
	else:
		fullscreen = true
		%FullscreenCheckBox.button_pressed = true
		_on_fullscreen_check_box_toggled(true)
	
	#Save it
	config_file.set_value("Display", "Resolution", screen_size_option)
	


func change_monitor(monitorID):
	current_monitor = monitorID
	screen_size = DisplayServer.screen_get_size(current_monitor)
	get_window().set_current_screen(current_monitor)
	center_screen()
	config_file.set_value("Display", "Monitor", current_monitor)
	%MonitorCheckBox.select(current_monitor)

func _on_fullscreen_check_box_toggled(button_pressed):
	if button_pressed:
		fullscreen = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		fullscreen = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	config_file.set_value("Display", "Fullscreen", fullscreen)

func center_screen():
	window_size = get_window().get_size()
	get_window().position = (screen_size * 0.5 - window_size * 0.5)
	get_window().set_current_screen(current_monitor)



