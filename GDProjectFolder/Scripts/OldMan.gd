extends StaticBody2D

var dis
var distance = 0
var moving
var popup
var velocity = Vector2(20, 0)

func _ready():
	moving = true

func _physics_process(delta):
	pass

func trigger():
	if dis < 50:
		if Input.is_action_just_pressed("ui_accept"):
			moving = false
			popup = true

func animate():
	if moving:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("Talk")

func popup():
	if popup:
		

