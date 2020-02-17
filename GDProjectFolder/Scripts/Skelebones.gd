extends KinematicBody2D

const SPEED = 1200

var dir
var state
var dis
var life = 3

func _ready():
	state = 1

func _physics_process(delta):
	
	
	dir = (Global.playerpos - position).normalized()
	dis = Global.distance(Global.playerpos, position)
	
	stateFinder()
	animate()
	attacked()
	playerHurt()
	
	if state == 2 or state == 3:
		move_and_slide(SPEED * dir * delta)
		if position.x > Global.playerpos.x:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true

func animate():
	if state == 1:
		$AnimatedSprite.play("Idle")
	elif state == 2:
		$AnimatedSprite.play("Move")
	elif state == 3:
		$AnimatedSprite.play("Attack")

func stateFinder():
	if Global.distance(Global.playerpos, position) < 200:
		if Global.distance(Global.playerpos, position) < 32:
			state = 3
		else:
			state = 2
	else:
		state = 1

func attacked():
	if dis <= 32:
		if Input.is_action_just_pressed("ui_lmb"):
			life -= 1
			$EnemyAttackParticles.emitting = true
	if life <= 0:
		Global.playerHurt = false
		queue_free()

func playerHurt():
	if dis < 32 and !Global.hurtCountList.has(1):
		Global.playerHurt = true
		Global.hurtCountList.append(1)

