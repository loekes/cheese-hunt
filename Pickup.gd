extends Node2D

onready var animation_player = $AnimationPlayer
onready var collision_shape = $Area2D/CollisionShape2D
onready var sound = $EatingCheese

func _on_Area2D_body_entered(_body):
	collision_shape.set_deferred("disabled", true)
	get_tree().get_root().get_child(2).increment_counter()
	sound.play()
	animation_player.play("Eating")

func animation_finished():
	queue_free()
