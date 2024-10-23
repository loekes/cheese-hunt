extends Control

onready var label = $VBoxContainer/Label
onready var sound = $GameOver

func _ready():
	sound.play()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.cheeses = 0
		get_tree().change_scene("res://World.tscn")

