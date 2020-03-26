extends TextureRect

func _on_NextLevel_button_down():
	get_tree().change_scene("res://Scenes/Floor" + str(Global.gameFloor) + ".tscn")

func _on_Exit_button_down():
	get_tree().quit()
