extends Node

# GLOBAL SINGLETON LOL

# Variables
var playerpos = Vector2()
var playerProp = 0
var playerState
var playerHurt = false
var GameOver = false
var playerHealth
var isPlayerAlive = true
var playerWeapon = "null"
var hurtFactor = "null"

func _ready():
	set_process(true)
	
	playerState = "Idle"
	playerHealth = 10

func _process(delta):
	if playerHealth <= 0:
		get_tree().quit(010)
	
	print(playerHealth)

# To Find Distance between 2 points
func distance(vect1, vect2):
	return (vect1 - vect2).length()
