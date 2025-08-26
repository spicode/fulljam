extends Node2D
var PokerHand = preload("res://poker_hands(Im_in_pain).gd").new()
var Card = preload("res://card.tscn")
var card_col = ["heart","spade","diamond","clubs"]
var card_val = ["2","3","4","5","6","7","8","9","10","J","Q","K","Ace"]
var dead_card=[]
var winner : String= ""
var val_rank={
	"2": 2, "3": 3, "4": 4, "5": 5,
	"6": 6, "7": 7, "8": 8, "9": 9,
	"10": 10, "J": 11, "Q": 12, "K": 13, "Ace": 14
}
var goot_points=0
var bad_points=0
var player_cards = []
var enemy_cards = []
func _ready():
	player_cards = []
	enemy_cards = []

	print("player cards:")
	for i in range(8):
		var decay = 30
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(30,60)]
		player_cards.append(card)
		print(card)
		
	
	print("enemy cards:")
	for i in range(5):
		var decay = 30
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(30,50)]
		enemy_cards.append(card)
		print(card)
	
	
func checkWinner() -> String:
	var result = PokerHand.evaluate_hand(Global.cardsSelected)
	var bad_result = PokerHand.evaluate_hand(enemy_cards)
	
	if result.points > bad_result.points:
		return "player"
	elif result.points < bad_result.points:
		return "enemy"
	else:
		return "tie"
func _process(delta: float) -> void:

	var to_remove = []
	for card in player_cards:
		card[2] -= delta
		#print("Card timer:", card[2]) 
		if card[2] <= 0:
			to_remove.append(card)
			
	
	for card in to_remove:
		dead_card.append(card)
		player_cards[player_cards.find(card)]=[card_col.pick_random(), card_val.pick_random(), randi_range(30,50)]
		
		
		
		


func _on_shabimt_pressed() -> void:
	update_selected_cards()
	

	# only take first 5 for poker
	var clean_cards = []
	for i in range(min(5, Global.cardsSelected.size())):
		var c = Global.cardsSelected[i]
		clean_cards.append([c[0], c[1]])

	var result = PokerHand.evaluate_hand(clean_cards)
	print("Selected cards (clean):", clean_cards)
	print("Evaluation result:", result)
	print("Hand name:", result.name)
	print("Points:", result.points)

	Global.points += result.points
	
func update_selected_cards():
	Global.cardsSelected.clear()
	for c in get_tree().get_nodes_in_group("playerCards"):
		if c.position.y < 300:  # selection rule
			Global.cardsSelected.append([c.card[0], c.card[1]])
