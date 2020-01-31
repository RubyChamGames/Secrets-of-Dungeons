extends KinematicBody2D

# BlueFlame (Enemy) Script

# Variables
var flameball = preload("res://Scenes/BlueFlameBalls.tscn")
var dir
var lol = false

# Ready Function
func _ready():
	pass

# Update Function
func _physics_process(delta):
	animate()
	dir()
	
	if Global.distance(Global.playerpos, position) < 100:
		if lol:
			$BallsTimer.start()
			lol = false
	else:
		lol = true
		$BallsTimer.stop()

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
	lol = true

# DirectionFacing
func dir():
	if Global.playerpos.x > position.x:
		scale.x = -1
	else:
		scale.x = 1
