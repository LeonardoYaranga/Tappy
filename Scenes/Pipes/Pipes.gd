extends Node2D
class_name Pipes

var SPEED: float = 120.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Out of the screen")
	queue_free()


func _on_life_timer_timeout() -> void:
	queue_free()

func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
		


func _on_laser_body_exited(body: Node2D) -> void:
	if body is Tappy:
		print("_on_laser_body_exited", body.name)
		print("+ 1 point")
