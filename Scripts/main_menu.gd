extends Control

@onready var play_button = $VBoxContainer/Play

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.grab_focus()


func _on_play_pressed() -> void:
	LevelManager.change_level("level1")

func _on_exit_pressed() -> void:
	get_tree().quit()
