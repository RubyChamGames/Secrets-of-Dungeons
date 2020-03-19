extends Label

func _process(delta):
	text = "Life: " + str(Global.playerHealth)
