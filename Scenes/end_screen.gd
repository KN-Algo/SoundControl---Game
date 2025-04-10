extends Control
@onready var back: Button = $Back

@onready var label = $Label
func _ready():
	label.text="YOU WON!\n\nYOU COLLECTED\n" + str(Global.coins) + " OUT OF 6 COINS."
	Global.coins=0
	back.grab_focus()

func _on_button_pressed():
	LevelManager.change_level("mainmenu")
	
