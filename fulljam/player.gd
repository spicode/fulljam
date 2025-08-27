extends Node2D
var PokerHand = preload("res://poker_hands(Im_in_pain).gd").new()
var Card = preload("res://card.tscn")
var card_col = ["heart","spade","diamond","clubs"]
var card_val = ["2","3","4","5","6","7","8","9","10","J","Q","K","Ace"]
var dead_card=[]
var player_points=0
var enemy_points=0

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
		
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(43,60)]
		player_cards.append(card)
		print(card)
		
	
	print("enemy cards:")
	for i in range(5):
		
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(43,60)]
		enemy_cards.append(card)
		print(card)
	
	
func checkWinner() -> String:
	var result = PokerHand.evaluate_hand(Global.cardsSelected)
	var bad_result = PokerHand.evaluate_hand(enemy_cards)
	print(bad_result)
	if result.points > bad_result.points:
		player_points+=1
		print("platyer")
		$"../winner_is".text = "player has won yeepee"
		return "player"
	elif result.points < bad_result.points:
		print("enemy")
		$"../winner_is".text = "you dumb fuck"
		enemy_points+=1
		return "enemy"
	else:
		print("you both suck at the same level")
		$"../winner_is".text = "jesus you both are bad"
		return "tie"
	
	
func _process(delta: float) -> void:
	if Global.hands_played>=10:
		if enemy_points>player_points:
			get_tree().change_scene_to_file("res://bad_ending.tscn")
		if enemy_points<player_points:
			get_tree().change_scene_to_file("res://ze_goot_endig.tscn")

	var to_remove = []
	for card in player_cards:
		card[2] -= delta
		#print("Card timer:", card[2]) 
		if card[2] <= 0:
			to_remove.append(card)
			
	
	for card in to_remove:
		dead_card.append(card)
		player_cards[player_cards.find(card)]=[card_col.pick_random(), card_val.pick_random(), randi_range(47,60)]
		enemy_cards[enemy_cards.find(card)]=[card_col.pick_random(), card_val.pick_random(), randi_range(47,60)]
		
		
		
		
		


func _on_shabimt_pressed() -> void:
	if $"../Timer".is_stopped():
		update_selected_cards()
		checkWinner()
	
		# only take first 5 for poker
		var clean_cards = []
		for i in range(min(5, Global.cardsSelected.size())):
			var c = Global.cardsSelected[i]
			clean_cards.append([c[0], c[1]])
			
		var tween = get_tree().create_tween()
		for c in Global.cardsSelectedNodes:
			tween.tween_property(c, "position", Vector2(c.position.x+3000,c.position.y), 0.5)
			
			tween.tween_callback(c.back2og)
		var result = PokerHand.evaluate_hand(clean_cards)
		print("Selected cards (clean):", clean_cards)
		print("Evaluation result:", result)
		print("Hand name:", result.name)
		print("Points:", result.points)
		Global.points += result.points
		Global.cardsSelected = []
		Global.cardsSelectedNodes = []
		$"../Timer".start(1)
func update_selected_cards():
	Global.cardsSelected.clear()
	for c in get_tree().get_nodes_in_group("playerCards"):
		if c.position.y < 300:  # selection rule
			Global.cardsSelectedNodes.append(c)
			Global.cardsSelected.append([c.card[0], c.card[1]])
