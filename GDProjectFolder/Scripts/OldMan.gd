extends StaticBody2D

var dis
var distance = 0
var popup
var velocity = Vector2(20, 0)

func _ready():
	pass

func _physics_process(delta):
	dis = Global.distance(Global.playerpos, position)
	
	trigger()
	animate()

func trigger():
	if dis < 50:
		if Input.is_action_just_pressed("ui_accept"):
			_popup()
			popup = true

func animate():
	if popup:
		$AnimatedSprite.play("Talk")

func _popup():
	get_node("Popup").popup()
	get_node("Popup").set_global_position(position)

