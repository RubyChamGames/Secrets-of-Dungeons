extends KinematicBody2D

# Reaper (Enemy) Script

# Variables
var speed = 50
var velocity = Vector2()
var distance = 0
var disvector
var dis
var life = 2
var particles

# Ready Function
func _ready():
	velocity.x = speed
	disvector = Vector2(0, 0)
	particles = false

# Update Function
func _physics_process(delta):
	disvector = Global.playerpos - position
	dis = disvector.length()
	
	if particles:
		$EnemyAttackParticles.emitting = true
	
	move()
	animate()
	attacked()
	playerHurt()

# Movement
func move():
	distance += 1
	if distance == 100:
		distance = 0
		velocity.x = -velocity.x
	velocity = move_and_slide(velocity)

# Animation
func animate():
	if dis < 60:
		if disvector.x > 0:
			$AnimatedSprite.play("Attack")
			$AnimatedSprite.flip_h = false
		elif disvector.x < 0:
			$AnimatedSprite.play("Attack")
			$AnimatedSprite.flip_h = true
	elif dis > 60:
		if velocity.x > 0:
			$AnimatedSprite.play("Move")
			$AnimatedSprite.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite.play("Move")
			$AnimatedSprite.flip_h = true
		elif velocity.x == 0:
			$AnimatedSprite.play("Move")

func attacked():
	if dis < 60:
		if Global.playerWeapon == "Knife":
			if Input.is_action_just_pressed("ui_lmb"):
				Global.dir_to_enemy = disvector.x
				life -= 1
				$EnemyAttackParticles.emitting = true
	if life <= 0:
		Global.playerHurt = false
		queue_free()

func playerHurt():
	if Global.distance(Global.playerpos, position) < 60 and !Global.hurtCountList.has(1):
		Global.playerHurt = true
		Global.hurtCountList.append(1)


