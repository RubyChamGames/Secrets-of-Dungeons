extends KinematicBody2D


func _ready():
	pass 
func _physics_process(delta):
	animate()

func animate():
	$AnimatedSprite.play("Idle")
