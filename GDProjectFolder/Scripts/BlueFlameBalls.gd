extends Area2D

const SPEED = 5
var dir = Vector2()

func _physics_process(delta):
	translate(SPEED * dir)

func _on_BlueFlameBalls_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()



