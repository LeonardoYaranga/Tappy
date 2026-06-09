extends Node

const SCORE_PATH = "user://tappyscore.res"
var _high_score = 0

var high_score = 0:
	get:
		return _high_score
	set(value):
		if value > _high_score:
			_high_score = value
			save_high_score()

func _ready() -> void:
	load_high_score()

func load_high_score() -> void:
	if ResourceLoader.exists(SCORE_PATH):
		var hsr: HighScoreResource = load(SCORE_PATH)
		if hsr: _high_score = hsr.high_score

func save_high_score() -> void:
	var hsr: HighScoreResource = HighScoreResource.new()
	hsr.high_score = high_score
	ResourceSaver.save(hsr, SCORE_PATH)
