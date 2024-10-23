extends Node2D

onready var sound = $Angry

func _on_Area2D_area_entered(area):
	sound.play()
	area.hit()
