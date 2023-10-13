@tool
extends HBoxContainer

@export var player : PlayerResource
@onready var texture_rect: TextureRect = %TextureRect
@onready var heart: TextureRect = %Heart
@onready var brain: TextureRect = %Brain
@onready var lungs: TextureRect = %Lungs
@onready var eyes: TextureRect = %Eyes

@onready var character_name: Label = %Name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = player.face
	character_name.text = player.name
