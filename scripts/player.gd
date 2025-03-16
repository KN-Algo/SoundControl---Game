extends CharacterBody2D

class_name Player

const STEAM = preload("res://Scenes/steam.tscn")

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	MenegerNawigacji.on_trigger_player_spawn.connect(_on_spawn)
	
func _on_spawn(pozycja: Vector2):
	global_position = pozycja
	
func spawn_steam(dir: int, reposition: Vector2):
	var steam = STEAM.instantiate()
	get_tree().current_scene.add_child(steam)
	if dir == 0 and reposition != Vector2(0,30):
		return
	steam.global_position = global_position + reposition
	steam.rotation_degrees = dir * 90 + 180


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		spawn_steam(0,Vector2(0,30))
		velocity.y = JUMP_VELOCITY
		
	var direction := int(Input.get_axis("ui_left", "ui_right"))
	
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		spawn_steam(direction, Vector2(-20*direction,0))
	
	if direction:
		velocity.x = direction * SPEED
		
	sprite_2d.rotate(0.2*sign(velocity.x))

	move_and_slide()
