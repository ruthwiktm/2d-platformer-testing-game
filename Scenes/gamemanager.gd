extends Node

@onready var coinsc: Label = $coinsc

var score = 0
# coint counter
func add_point():
	score += 1
	print('SCORE: ', score)
	coinsc.text = str(score) + " Coins"
