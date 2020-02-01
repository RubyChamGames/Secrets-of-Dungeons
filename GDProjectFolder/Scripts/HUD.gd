extends CanvasLayer

var heart = preload("res://Scenes/HeartsHUD.tscn")

func _ready():
	for n in range(3):
		var h = heart.instance()
		add_child(h)
		h.position = Vector2(64 + n*32, 64)