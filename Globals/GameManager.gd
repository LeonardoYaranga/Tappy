extends Node

const MAIN = preload("uid://bk7wx4bliuk8n")
const GAME = preload("uid://ccfii80syc1mh")

func change_to_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)

func change_to_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)
