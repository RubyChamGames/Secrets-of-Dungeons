extends KinematicBody2D

const SPEED = 1200

var dir
var state

func _ready():
	state = 1

func _physics_process(delta):
	stateFinder()
	animate()
	dir = (Global.playerpos - position).normalized()
	
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
		if Global.distance(Global.playerpos, position) < 25:
			state = 3
		else:
			state = 2
	else:
		state = 1

