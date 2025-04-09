extends Area2D

@onready var sprite_2d = $Sprite2D
var sprite_regions=[Vector2(64.0,32.0),
Vector2(64.0,64.0),
Vector2(96.0,64.0),
Vector2(128.0,64.0)
]

var rotation_speed=1.0
func _ready():
	sprite_2d.region_rect=Rect2(sprite_regions[randi()%4],Vector2.ONE*32.0)
	rotation_speed=randf_range(-2,2)
func _process(delta):
	sprite_2d.rotate(delta*rotation_speed)

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.visible = false
		LevelManager.restart()
		
