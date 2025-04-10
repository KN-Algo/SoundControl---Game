extends Area2D

@export var entry=false
@export var level_on_entry:String

@onready var collision_shape_2d = $Block/CollisionShape2D
@onready var marker_2d = $Block/Marker2D

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	if 	LevelManager.can_change:
		LevelManager.entry=entry
		LevelManager.change_level(level_on_entry)
		Global.coins+=Global.curent_coins
		
func close():
	await get_tree().create_timer(0.2).timeout
	var tween=get_tree().create_tween()
	tween.tween_property(marker_2d,"position",Vector2(-7.5,16),0.3)
	await tween.finished
	collision_shape_2d.disabled=false
	
	
