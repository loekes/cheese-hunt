extends Node2D

signal go_to_next_level
signal disable_movement
onready var sound = $Proceed

func _on_Area2D_body_entered(body):
	body.stop_animation()
	sound.play()
	emit_signal("disable_movement")

func _on_Proceed_finished():
	emit_signal("go_to_next_level")
