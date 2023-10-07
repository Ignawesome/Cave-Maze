extends PanelContainer

@onready var heart: TextureRect = %Heart
@onready var brain: TextureRect = %Brain
@onready var lungs: TextureRect = %Lungs
@onready var eyes: TextureRect = %Eyes

enum ORGANS {
	HEART,
	BRAIN,
	LUNGS,
	EYES
}

@export var dead_color : Color = Color(0.36, 0.50, 0.35, 0.65)

func on_dead_organ(organ : Control) -> void:
	organ.set_modulate(dead_color)
