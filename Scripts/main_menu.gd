extends Control

@onready var play_button = $VBoxContainer/Play

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.grab_focus()


func _on_play_pressed() -> void:
	LevelManager.entry=false
	Global.coins=0
	Global.curent_coins=0
	LevelManager.change_level(LevelManager.last_level)

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed():
	LevelManager.change_level("settings")
	
	print("MENU")
