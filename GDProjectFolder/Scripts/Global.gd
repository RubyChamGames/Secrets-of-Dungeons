extends Node

# GLOBAL SINGLETON LOL

# Variables
var playerpos = Vector2()
var playerProp = 0
var playerState
var playerHurt = false
var playerBlood = false
var gameOver = false
var playerHealth
var isPlayerAlive = true
var playerWeapon = "null"
var gameFloor = 0
var hurtCountList = []
var dir_to_enemy

func _ready():
	set_process(true)
	
	playerState = "Idle"
	playerHealth = 10
	playerHurt = false
	gameFloor = 0

func _process(delta):
	if playerHealth <= 0:
		get_tree().quit()
	
	print(playerHealth)

# To Find Distance between 2 points
func distance(vect1, vect2):
	return (vect1 - vect2).length()

func HurtCounter():
	var totalhurt = 0
	for n in hurtCountList:
		totalhurt += n
	return totalhurt

func isplayerHurt():
	var hurtcount = Global.HurtCounter()
	Global.playerHealth -= hurtcount
	hurtCountList = []






