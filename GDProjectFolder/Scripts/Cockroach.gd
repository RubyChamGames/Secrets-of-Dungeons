extends KinematicBody2D

var dir
var speed = 3000
var dis
var disvector = Vector2()
var life = 3

func _physics_process(delta):
	disvector = Global.playerpos - position
	dis = disvector.length()
	$AnimatedSprite.flip_h = true
	dir = (Global.playerpos - position).normalized()
	if Global.distance(Global.playerpos, position) < 160:
		look_at(Global.playerpos)
		move_and_slide(speed * dir * delta)
	attacked()
	playerAttack()

func playerAttack():
	if Global.distance(Global.playerpos, position) < 100:
		if Global.distance(Global.playerpos, position) < 40:
			Global.playerHurt = true
			Global.playerBlood = true
			if !Global.hurtCountList.has(0.1):
				Global.hurtCountList.append(0.1)
		else:
			Global.playerBlood = false

func attacked():
	if dis < 60:
		if Global.playerWeapon == "Knife":
			if Input.is_action_pressed("ui_lmb"):
				life -= 1
				$EnemyAttackParticles.emitting = true
		if life <= 0:
			Global.playerHurt = false
			queue_free()
	
