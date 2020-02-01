extends Node

# GLOBAL SINGLETON LOL

# Variables
var playerpos = Vector2()
var playerProp = 0
var playerState
var playerHurt = false
var playerLife = 3

func _ready():
	set_process(true)
	
	playerState = "Idle"

func _process(delta):
	if playerHurt:
		if playerLife <= 0:
			pass
		else:
			playerLife -= 1

# To Find Distance between 2 points
func distance(vect1, vect2):
	return (vect1 - vect2).length()
