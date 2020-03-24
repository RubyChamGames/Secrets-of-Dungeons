extends Area2D

func _on_Upstairs_body_entered(body):
	if body.is_in_group("Player"):
		Global.gameFloor += 1
		get_tree().change_scene("res://Scenes/Floor" + str(Global.gameFloor) + ".tscn")
