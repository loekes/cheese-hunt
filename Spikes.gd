extends Node2D

onready var sound = $Auch

func _on_Area2D_area_entered(area):
	sound.play()
	area.hit()
