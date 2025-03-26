extends Area2D

@export var entry=false
@export var level_on_entry:String


func _on_body_entered(body):
	LevelManager.entry=entry
	LevelManager.change_level(level_on_entry)
