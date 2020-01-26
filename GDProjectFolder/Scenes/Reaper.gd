extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var distance = 0
var disvector
var dis

func _ready():
	velocity.x = speed
	disvector = Vector2(0, 0)

func _physics_process(delta):
	disvector = Global.playerpos - position
	dis = disvector.length()
	
	move()
	animate()

func move():
	distance += 1
	if distance == 100:
		distance = 0
		velocity.x = -velocity.x
	velocity = move_and_slide(velocity)

func animate():
	if dis < 50 and disvector.x > 0:
		$AnimatedSprite.play("Attack")
		$AnimatedSprite.flip_h = false
	elif dis < 50 and disvector.x < 0:
		$AnimatedSprite.play("Attack")
		$AnimatedSprite.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite.play("Move")
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.play("Move")
		$AnimatedSprite.flip_h = true
	
		