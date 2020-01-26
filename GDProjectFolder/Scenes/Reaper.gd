extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var distance = 0
var dis = (Global.playerpos - position)

func _ready():
	velocity.x = speed

func _physics_process(delta):
	move()
	animate()

func move():
	distance += 1
	if distance == 50:
		distance = 0
		velocity.x = -velocity.x
	velocity = move_and_slide(velocity)

func animate():
	if velocity.x > 0:
		$AnimatedSprite.play("Move")
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.play("Move")
		$AnimatedSprite.flip_h = true
	if dis.x*dis.x + dis.y*dis.y < 25:
		$AnimatedSprite.play("Attack")