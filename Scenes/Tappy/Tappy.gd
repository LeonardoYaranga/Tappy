extends CharacterBody2D

class_name Tappy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var _jumped = false
const JUMP_POWER: float = -200.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false
	#if Input.is_action_just_pressed("power"):
	#velocity.y = JUMP_POWER
	move_and_slide()
	
	if is_on_floor():
		print("On floor")
		die()
	
func die() -> void:
	get_tree().paused = true
