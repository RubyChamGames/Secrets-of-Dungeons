extends KinematicBody2D

var dir
var speed = 3000

func _ready():
	pass

func _physics_process(delta):
	$AnimatedSprite.flip_h = true
	dir = (Global.playerpos - position).normalized()
	look_at(Global.playerpos)
	move_and_slide(speed * dir * delta)