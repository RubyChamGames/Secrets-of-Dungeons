extends StaticBody2D

func _physics_process(delta):
	if Global.distance(Global.playerpos, position) < 50:
		if Input.is_action_just_pressed("ui_accept"):
			get_node("Popup").popup_centered_ratio(0.25)
