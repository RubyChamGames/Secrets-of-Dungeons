extends KinematicBody2D

# BlueFlame (Enemy) Script

# Variables
var flameball = preload("res://Scenes/BlueFlameBalls.tscn")
var dis
var Balls = false
var life = 3

# Update Function
func _physics_process(delta):
	dis = Global.distance(Global.playerpos, position)
	animate()
	dir()
	attacked()
	
	if dis < 100:
		if Balls:
			$BallsTimer.start()
			Balls = false
	else:
		Balls = true
		$BallsTimer.stop()
	
	if life <= 0:
		queue_free()

# Animation
func animate():
	$AnimatedSprite.play("Idle")

# Timer (BallsTimer)
func _on_BallsTimer_timeout():
	var b = flameball.instance()
	var b_dir = (Global.playerpos - position).normalized()
	get_parent().add_child(b)
	b.position = position
	b.dir = b_dir
	b.rotation = b_dir.angle()
	Balls = true

# DirectionFacing
func dir():
	if Global.playerpos.x > position.x:
		scale.x = -1
	else:
		scale.x = 1

func attacked():
	if dis < 40:
		if Global.playerWeapon == "Knife":
			if Input.is_action_just_pressed("ui_lmb"):
				life -= 1
				$EnemyAttackParticles.emitting = true



