extends Node2D
var PokerHand = preload("res://poker_hands(Im_in_pain).gd").new()
var card_col = ["heart","spade","diamond","clubs"]
var card_val = ["1","2","3","4","5","6","7","8","9","J","Q","K","Ace"]
var val_rank={
	"2": 2, "3": 3, "4": 4, "5": 5,
	"6": 6, "7": 7, "8": 8, "9": 9,
	"10": 10, "J": 11, "Q": 12, "K": 13, "Ace": 14
}
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
	var result = PokerHand.evaluate_hand(player_cards)
	var bad_result = PokerHand.evaluate_hand(enemy_cards)
	print("You(player) got a ", result)
	print("ze bad(enemy) got a ",bad_result)
		
   
