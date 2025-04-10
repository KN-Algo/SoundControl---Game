extends Control

@onready var label = $Label
func _ready():
	label.text="YOU WON!\n\nYOU COLLECTED\n" + str(Global.coins) + " OUT OF 6 COINS."

func _on_button_pressed():
	LevelManager.change_level("mainmenu")
	
