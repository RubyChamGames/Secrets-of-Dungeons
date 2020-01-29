extends Node

# GLOBAL SINGLETON LOL

var playerpos = Vector2()
var playerProp = 0

var playerState

func _ready():
	playerState = "Idle"

func distance(vect1, vect2):
	return (vect1 - vect2).length()