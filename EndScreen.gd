extends Control

onready var label = $VBoxContainer/Label
onready var sound = $Win

func _ready():
	sound.play()
	label.text = "Congratulations! You found " + str(Global.cheeses) + " of the 50 hidden cheeses!"

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.cheeses = 0
		get_tree().change_scene("res://World.tscn")
