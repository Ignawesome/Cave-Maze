extends DieClass

@onready var heart = %Heart
@onready var star = %Star
@onready var bomb = %Bomb
@onready var shield = %Shield
@onready var skull = %Skull
@onready var sword = %Sword

<<<<<<< Updated upstream
=======


func _on_timer_timeout() -> void:
	print("die set to sleep")
	self.set_sleeping(true)
>>>>>>> Stashed changes
