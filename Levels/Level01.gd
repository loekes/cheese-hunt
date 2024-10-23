extends Node2D

export(PackedScene) var next_scene
export(bool) var is_final_scene

onready var player = $Player

func go_to_next_scene():
	get_tree().get_root().get_child(2).reset_lives()
	get_tree().get_root().get_child(2).call_deferred("add_child", next_scene.instance())
	queue_free()

func _on_Flag_go_to_next_level():
	if is_final_scene == true:
		get_tree().change_scene("res://EndScreen.tscn")
	else:
		go_to_next_scene()

func _on_Flag_disable_movement():
	player.allow_movement = false
