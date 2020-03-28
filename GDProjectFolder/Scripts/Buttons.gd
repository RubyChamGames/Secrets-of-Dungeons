extends VBoxContainer

func _ready():
	$AudioStreamPlayer2D.play()

func _on_Play_button_down():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")

func _on_Exit_button_down():
	get_tree().quit()

func _on_Settings_button_down():
	

