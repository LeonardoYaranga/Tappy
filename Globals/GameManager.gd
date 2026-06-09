extends Node

const MAIN = preload("uid://bk7wx4bliuk8n")
const GAME = preload("uid://ccfii80syc1mh")
const COMPLEX_CHANGE = preload("uid://d2dhlmsgmcjoj")

var next_scene: PackedScene = null
var complex_scene: ComplexChange = null

func _ready() -> void:
	complex_scene = COMPLEX_CHANGE.instantiate()
	add_child(complex_scene)


func change_to_next_scene() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	
func start_transition(to_scene: PackedScene) -> void:
	next_scene = to_scene
	complex_scene.play_anim()

func change_to_main_scene() -> void:
	start_transition(MAIN)

	
func change_to_game_scene() -> void:
	start_transition(GAME)
