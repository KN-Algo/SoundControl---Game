extends CharacterBody2D

class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	MenegerNawigacji.on_trigger_player_spawn.connect(_on_spawn)
	
func _on_spawn(pozycja: Vector2):
	global_position = pozycja


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	sprite_2d.rotate(0.2*sign(velocity.x))

	move_and_slide()
