extends KinematicBody2D

# STARTING PLAYER SCRIPT

# Constants
const SPEED = 100

# Variables
var velocity = Vector2()
var playerDir = Vector2()

# Ready Function
func _ready():
	pass

# Update Function
func _physics_process(delta):
	Global.playerpos = position
	
	move()
	animate()

func move():
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		playerDir = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		playerDir = Vector2.LEFT
	else:
		velocity.x = 0
		playerDir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
		playerDir = Vector2.UP
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		playerDir = Vector2.DOWN
	else:
		velocity.y = 0
		playerDir = Vector2.ZERO
	
	velocity = move_and_slide(velocity)

func animate():
	if velocity.x > 0:
		$AnimatedSprite.play("Right")
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.play("Right")
		$AnimatedSprite.flip_h = true
	elif playerDir == Vector2.UP:
		$AnimatedSprite.play("Up")
	elif playerDir == Vector2.DOWN:
		$AnimatedSprite.play("Down")
	
	elif playerDir == Vector2.ZERO:
		$AnimatedSprite.play("Idle")

