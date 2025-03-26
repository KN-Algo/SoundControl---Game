extends CharacterBody2D

class_name Player

const STEAM = preload("res://Scenes/steam.tscn")
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var x_velocity=1
@onready var sprite_2d: Sprite2D = $Sprite2D
func _ready():
	var pipes=get_tree().get_nodes_in_group("pipe")
	for pipe in pipes:
		if pipe.entry and LevelManager.entry:
			global_position=pipe.global_position
		elif !pipe.entry and !LevelManager.entry:
			global_position=pipe.global_position
		
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		spawn_steam(x_velocity/2.0)
		velocity.y = JUMP_VELOCITY
		
	var direction := int(Input.get_axis("ui_left", "ui_right"))
	if Input.is_action_just_pressed("ui_left") and x_velocity!=-1 or Input.is_action_just_pressed("ui_right") and x_velocity!=1:
		spawn_steam(direction)
	if direction:
		x_velocity=direction
		
	if is_on_wall():
		pass
		#x_velocity*=-1
		
	velocity.x = x_velocity * SPEED
	sprite_2d.rotate(0.2*sign(velocity.x))

	move_and_slide()
	
func spawn_steam(dir: float):
	var steam = STEAM.instantiate()
	get_tree().current_scene.add_child(steam)
	steam.global_position = global_position
	steam.rotation_degrees = dir * 90 + 90
