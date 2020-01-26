extends KinematicBody2D

# BlueFlame (Enemy) Script

# Variables
var flameball = preload("res://Scenes/BlueFlameBalls.tscn")
var dir

# Ready Function
func _ready():
	$BallsTimer.start()

# Update Function
func _physics_process(delta):
	animate()
	dir()

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

# DirectionFacing
func dir():
	if Global.playerpos.x > position.x:
		scale.x = -1
	else:
		scale.x = 1
