extends Area2D

signal got_hit

func hit():
	emit_signal("got_hit")
