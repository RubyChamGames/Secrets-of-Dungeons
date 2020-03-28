extends Node2D

func _process(delta):
	$Music/Label.text = str($Music/HSlider.value)
