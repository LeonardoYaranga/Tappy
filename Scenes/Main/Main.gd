extends Control

class_name Main
@onready var high_score_label: Label = $MarginContainer/HighScoreLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.change_to_game_scene()

func _ready() -> void:
	high_score_label.text = "%03d" % ScoreManager.high_score
