extends Control
class_name SimpleChange

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	GameManager.change_to_next_scene()
