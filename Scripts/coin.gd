extends Area2D
@onready var pickup_sound = $Pickup_Sound
@onready var animated_sprite_2d = $AnimatedSprite2D

var picked=false
func _on_body_entered(body: Node2D) -> void:
	if picked:
		return
	if body.is_in_group("player"):
		picked=true
		pickup_sound.play()
		var tween=get_tree().create_tween()
		tween.tween_property(animated_sprite_2d,"position",Vector2(0,-25),0.2)
		tween.parallel()
		tween.tween_property(animated_sprite_2d,"modulate",Color(1,1,1,0),0.2)
		await tween.finished
		queue_free()
		
		
	
		

	
