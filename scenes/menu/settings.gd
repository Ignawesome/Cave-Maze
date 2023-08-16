extends Control

@onready var audio_container = $PanelContainer/HBoxContainer/PanelContainer/AudioContainer
@onready var display_container = $PanelContainer/HBoxContainer/PanelContainer/DisplayContainer
@onready var controls_container = $PanelContainer/HBoxContainer/PanelContainer/ControlsContainer

const MIN_VALUE := -50

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

func set_volume(bus, value):
	AudioServer.set_bus_volume_db(bus, value)
	if value == MIN_VALUE:
		AudioServer.set_bus_mute(bus, true)
	else:
		AudioServer.set_bus_mute(bus, false)


func _on_master_volume_slider_value_changed(value):
	var master_bus = AudioServer.get_bus_index("Master")
	set_volume(master_bus, value)

func _on_music_volume_slider_value_changed(value):
	var music_bus = AudioServer.get_bus_index("Music")
	set_volume(music_bus, value)
	
func _on_sound_volume_slider_value_changed(value):
	var sfx_bus = AudioServer.get_bus_index("SFX")
	set_volume(sfx_bus, value)
