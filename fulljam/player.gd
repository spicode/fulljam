extends Node2D

var card_col = ["heart","spade","diamond","clubs"]
var card_val = ["1","2","3","4","5","6","7","8","9","J","Q","K","Ace"]

func _ready():
	var player_cards = []
	var enemy_cards = []

	print("player cards:")
	for i in range(5):
		var decay = 30
		var card = [card_col.pick_random(), card_val.pick_random(), decay]
		player_cards.append(card)
		print(card)

	print("enemy cards:")
	for i in range(5):
		var decay = 30
		var card = [card_col.pick_random(), card_val.pick_random(), decay]
		enemy_cards.append(card)
		print(card)
