extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.change_to_game_scene()
