extends Control

onready var labelScore = $"Cheese Collected/Label"
onready var labelLives = $"Lives/Label"

signal game_over

var score = 0
var lives = 5

func _ready():
	labelScore.text = str(score)
	labelLives.text = str(lives)

func increment_score():
	score += 1
	Global.cheeses = score
	labelScore.text = str(score)

func reset_score():
	score = 0
	Global.cheeses = score
	labelScore.text = str(score)
	
func decrement_lives():
	lives -= 1
	if lives <= 0:
		emit_signal("game_over")
	else:
		labelLives.text = str(lives)

func reset_lives():
	lives = 5
	labelLives.text = str(lives)
