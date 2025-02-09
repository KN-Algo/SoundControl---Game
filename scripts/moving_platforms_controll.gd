extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@onready var animation: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play('move')
	animation.speed_scale = speed_scale
