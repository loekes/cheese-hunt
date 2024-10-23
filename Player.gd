extends KinematicBody2D

const GRAVITY = 10
const ACCELERATION = 50
const MAX_SPEED = 125
const JUMP_HEIGHT = -300
const SPAWN_POINT = Vector2(40, 50)

var motion = Vector2.ZERO
var allow_movement = true

onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(_delta):
	
	if allow_movement == true:
		if Input.is_action_pressed("ui_right"):
			animation_player.play("Walking")
			sprite.flip_h = false
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		elif Input.is_action_pressed("ui_left"):
			animation_player.play("Walking")
			sprite.flip_h = true
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		else: 
			if motion.y == 0:
				animation_player.play("Idle")
			motion.x = lerp(motion.x, 0, 0.2)
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up") and allow_movement == true:
			animation_player.play("Jumping")
			motion.y = JUMP_HEIGHT
	else:
		motion.y += GRAVITY
	
	motion = move_and_slide(motion, Vector2.UP)

func stop_animation():
	animation_player.play("Idle")

func respawn():
	global_position = SPAWN_POINT

func _on_HitBox_got_hit():
	respawn()
	get_tree().get_root().get_child(2).decrement_lives()
