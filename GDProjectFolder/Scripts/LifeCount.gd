extends Label

func _process(delta):
	text = "Health: " + str(Global.playerHealth)
