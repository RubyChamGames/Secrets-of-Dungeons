extends Node2D

var playerDis
var isSpawned = false
var entity

var skeleton = preload("res://Scenes/Skelebones.tscn")
var cockroach = preload("res://Scenes/Cockroach.tscn")
var blueflame = preload("res://Scenes/BlueFlame.tscn")

func _process(delta):
	playerDis = Global.distance(position, Global.playerpos)
	spawn()

func spawn():
	randomize()
	if playerDis > 300:
		if !isSpawned:
			var entities = [skeleton, blueflame, cockroach]
			entity = entities[randi()%3]
			
			for n in range (0,2):
				var e = entity.instance()
				get_parent().get_parent().add_child(e)
				e.position = Vector2(rand_range(position.x - 50, position.x + 50), rand_range(position.y - 50, position.y + 50))
			isSpawned = true
			queue_free()
