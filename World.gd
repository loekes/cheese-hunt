extends Node2D

onready var stats = $UI/UI

func increment_counter():
	stats.increment_score()

func reset_counter():
	stats.reset_score()

func decrement_lives():
	stats.decrement_lives()

func reset_lives():
	stats.reset_lives()

func _on_UI_game_over():
	get_tree().change_scene("res://GameOver.tscn")
