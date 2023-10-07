extends DieClass

@onready var heart = %Heart
@onready var star = %Star
@onready var bomb = %Bomb
@onready var shield = %Shield
@onready var skull = %Skull
@onready var sword = %Sword



func _on_timer_timeout() -> void:
	self.set_sleeping(true)
