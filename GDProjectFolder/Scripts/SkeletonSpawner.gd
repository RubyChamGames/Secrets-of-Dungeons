extends StaticBody2D

var skele = preload("res://Scenes/Skelebones.tscn")

func _physics_process(delta):
	if Global.distance(Global.playerpos, position) < 50:
		if $Timer.is_stopped():
			$Timer.start()

func _on_Timer_timeout():
	var s = skele.instance()
	get_parent().get_parent().get_parent().add_child(s)
	s.position = Vector2(position.x + 64, position.y)
	$Timer.stop()
	
