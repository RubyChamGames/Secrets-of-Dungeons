extends KinematicBody2D

var dir
var speed = 2500
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	animate()
	dir = (Global.playerpos - position).normalized()
	move_and_slide(speed * -dir * delta)
	velocity = speed * -dir
	
func animate():
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false