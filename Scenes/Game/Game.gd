extends Node

class_name Game

const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")


@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lowe_spawn: Marker2D = $LoweSpawn

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		GameManager.change_to_main_scene()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_pipes() -> void:
	var pipe = PIPES.instantiate()
	pipe.position = Vector2(upper_spawn.position.x, randf_range(upper_spawn.position.y, lowe_spawn.position.y))
	pipes_holder.add_child(pipe)
	
func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
