extends Area2D
 
@onready var Animation_Player = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	
	
	#znikanie coinow
	if body is Player:
		MenegerCoinow.dodaj_punkt()
		Animation_Player.play("pickup_animation")
		

	
