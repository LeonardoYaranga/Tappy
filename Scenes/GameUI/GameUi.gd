extends Control

class_name GameUI


@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var timer_to_show_press_space_label: Timer = $TimerToShowPressSpaceLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound
@onready var score_label: Label = $MarginContainer/ScoreLabel

var _score: int = 0

func _ready() -> void:
	SignalHub.on_plane_died.connect(on_game_over)
	SignalHub.on_point_scored.connect(on_point_scored)
	update_score_label()

func update_score_label() -> void:
	score_label.text = "%03d" % _score

func on_point_scored() -> void:
	_score += 1
	update_score_label()

func on_game_over() -> void:
	game_over_label.show()
	game_over_sound.play()
	timer_to_show_press_space_label.start()
	ScoreManager.high_score = _score
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		GameManager.change_to_main_scene()
	#Only can press power action when space label is shown
	if press_space_label.is_visible() && event.is_action_pressed("power"):
			get_tree().paused = false
			GameManager.change_to_main_scene()

func _on_timer_to_show_press_space_label_timeout() -> void:
	press_space_label.show()
	game_over_label.hide()
