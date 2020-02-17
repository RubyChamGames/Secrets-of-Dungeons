extends KinematicBody2D

var dir
var speed = 2000
var velocity = Vector2()
var seenPlayer = false
var dead = false

func _ready():
	pass

func _physics_process(delta):
	animate()
	giveHealth()
	
	dir = (Global.playerpos - position).normalized()
	
	if Global.distance(Global.playerpos, position) <= 150:
		move_and_slide(speed * -dir * delta)
		
		if $LifeTimer.is_stopped():
			$LifeTimer.start()
	else:
		$LifeTimer.stop()
	
	velocity = speed * -dir
	
func animate():
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func giveHealth():
	if Global.distance(Global.playerpos, position) <= 50:
		if $HealthTimer.is_stopped():
			$HealthTimer.start()

func _on_HealthTimer_timeout():
	Global.playerHealth += 1

func _on_LifeTimer_timeout():
	if !dead:
		$EnemyAttackParticles.emitting = true
		$LifeTimer.wait_time = 1
		dead = true
		$LifeTimer.start()
	else:
		queue_free()
