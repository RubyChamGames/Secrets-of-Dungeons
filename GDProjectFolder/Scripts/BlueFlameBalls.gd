extends Area2D

const SPEED = 5
var dir = Vector2()
var state = 0

func ready():
	pass

func _physics_process(delta):
	state += 1
	if state == 50: 
		queue_free()
	translate(SPEED * dir)

func _on_BlueFlameBalls_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()




