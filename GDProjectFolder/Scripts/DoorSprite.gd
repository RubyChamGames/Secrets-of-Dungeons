extends Sprite

var openText = preload("res://Assets/Sprites/Doors/Door_Open.png")
var closeText = preload("res://Assets/Sprites/Doors/Door_Closed.png")

func _ready():
	set_texture(closeText)

func _physics_process(delta):
	if Global.distance(Global.playerpos, position) < 50:
		set_texture(openText)
	else:
		set_texture(closeText)