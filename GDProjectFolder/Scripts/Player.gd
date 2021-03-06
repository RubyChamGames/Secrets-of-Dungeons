extends KinematicBody2D

# PLAYER SCRIPT

# Constants
const SPEED = 100

# Variables
var velocity = Vector2()
var playerDir = Vector2()
var playerHealth

# Ready Function
func _ready():
	$Camera2D/Light2D.show()
	$AudioStreamPlayer2D.play()

# Update Function
func _physics_process(delta):
	Global.playerpos = position
	playerHealth = Global.playerHealth
	$AudioStreamPlayer2D.volume_db = Global.volume / 10
	
	move()
	animate()
	attack()
	if Global.playerHurt:
		hurt()

# movement
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

# animation
func animate():
	if Global.playerProp == 1:
		if velocity.x > 0:
			$Player.play("Right_Knife")
			$Player.flip_h = false
		elif velocity.x < 0:
			$Player.play("Right_Knife")
			$Player.flip_h = true
		elif playerDir == Vector2.UP:
			$Player.play("Up_Knife")
		elif playerDir == Vector2.DOWN:
			$Player.play("Down_Knife")
		elif playerDir == Vector2.ZERO:
			$Player.play("Idle_Knife")
	elif Global.playerProp == 0:
		if velocity.x > 0:
			$Player.play("Right")
			$Player.flip_h = false
		elif velocity.x < 0:
			$Player.play("Right")
			$Player.flip_h = true
		elif playerDir == Vector2.UP:
			$Player.play("Up")
		elif playerDir == Vector2.DOWN:
			$Player.play("Down")
		
		elif playerDir == Vector2.ZERO:
			$Player.play("Idle")
	if Global.playerBlood:
		$EnemyAttackParticles.emitting = true
	else:
		$EnemyAttackParticles.emitting = false

func hurt():
	if Global.playerHurt:
		if $HurtTimer.is_stopped():
			$HurtTimer.start()

func _on_HurtTimer_timeout():
	Global.isplayerHurt()

func attack():
	if Global.playerProp == 1:
		if Input.is_action_pressed("ui_lmb"):
			$Player.play("Attack")
		
