extends Area2D

func _physics_process(delta):
	if Global.distance(Global.playerpos, position) < 25:
		if Input.is_action_just_pressed("ui_accept"):
			Global.playerProp = 1
			Global.playerWeapon = "Knife"
			queue_free()
