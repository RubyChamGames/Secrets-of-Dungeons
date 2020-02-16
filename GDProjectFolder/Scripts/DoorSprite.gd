extends StaticBody2D

var openText = preload("res://Assets/Sprites/Doors/Door_Open.png")
var closeText = preload("res://Assets/Sprites/Doors/Door_Closed.png")

func _ready():
	set_process(true)

func _physics_process(delta):
	if Global.isPlayerAlive:
		if Global.distance(position, Global.playerpos) < 32:
			$Sprite.set_texture(openText)
			$CollisionShape2D.disabled = true
		else:
			$Sprite.set_texture(closeText)
			$CollisionShape2D.disabled = false
