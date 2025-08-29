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
var ogPointsPos
var player_cards = []
var enemy_cards = []
func _ready():
	player_cards = []
	enemy_cards = []
	ogPointsPos = $"../pointsAdded".position
	
	
	for i in range(8):
		
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(43,60),true]
		player_cards.append(card)
	
	
	
	
	for i in range(5):
		
		var card = [card_col.pick_random(), card_val.pick_random(), randi_range(43,60),true]
		enemy_cards.append(card)
	
	
	
	
func checkWinner() -> String:
	
	var result = PokerHand.evaluate_hand(Global.cardsSelected)
	var bad_result = PokerHand.evaluate_hand(enemy_cards)


	if result.points > bad_result.points:
		winner = "player"
		return "player"
	elif result.points < bad_result.points:
		winner = "enemy"
		return "enemy"
	else:
		winner = "tie"
		return "tie"

func _process(delta: float) -> void:
	$"../turnsLeft".text = str("turns left: ",Global.turnsLeft+1)
	var to_remove = []
	for card in player_cards:

		card[2] -= delta
		if card[2] <= 0:
			to_remove.append(card)
			
	
	for card in to_remove:
		dead_card.append(card)
		player_cards[player_cards.find(card)]=[card_col.pick_random(), card_val.pick_random(), randi_range(47,60),true]
		enemy_cards[enemy_cards.find(card)]=[card_col.pick_random(), card_val.pick_random(), randi_range(47,60),true]
		
		
		
		
		

var points2add
func _on_shabimt_pressed() -> void:
	if $"../Timer".is_stopped():
		
		update_selected_cards()
		#checkWinner()
		
		
		# only take first 5 for poker
		var clean_cards = []
		for i in range(min(5, Global.cardsSelected.size())):
			var c = Global.cardsSelected[i]
			clean_cards.append([c[0], c[1]])
			var delay = i * 0.2  
		
		var tween = get_tree().create_tween()
			tween.tween_callback(func():
		$"../AudioStreamPlayer2D2".play()
	).set_delay(delay)
		for c in Global.cardsSelectedNodes:
			tween.tween_property(c, "position", Vector2(c.position.x+3000,c.position.y), 0.5)
			tween.tween_callback(c.back2og)
		var result = PokerHand.evaluate_hand(clean_cards)
		var enemyResulte = PokerHand.evaluate_hand(enemy_cards)
		
		Global.enemyPoints +=enemyResulte.points
		$"../winner_is".text = str("Enemy Points: ", Global.enemyPoints*5)
		

		enemy_cards = []
		for i in range(5):
			var card = [card_col.pick_random(), card_val.pick_random(), randi_range(43,60),true]
			enemy_cards.append(card)

		print("Selected cards (clean):", clean_cards)
		print("Evaluation result:", result)
		$"../lastHand".text = str("Last Hand: ",result.name)
		$"../pointsAdded".text = str("+",result.points*5)
		var tween2 =  get_tree().create_tween()
		points2add = result.points
		tween2.tween_property($"../pointsAdded", "position",$"../points".position,.75)
		
		tween2.tween_callback(_return2normal)
		Global.cardsSelected = []
		Global.cardsSelectedNodes = []
		$"../Timer".start(1)
	if Global.turnsLeft<=0:
		print("enemy points")
		if Global.points < Global.enemyPoints:
			get_tree().change_scene_to_file("res://bad_ending.tscn")
		elif Global.points > Global.enemyPoints:
			get_tree().change_scene_to_file("res://ze_goot_endig.tscn")
		else:
			get_tree().change_scene_to_file("res://bad_ending.tscn")
	else:
		Global.turnsLeft-=1
func update_selected_cards():
	
	Global.cardsSelected.clear()
	for c in get_tree().get_nodes_in_group("playerCards"):
		if c.position.y < 300:  # selection rule
			Global.cardsSelectedNodes.append(c)
			Global.cardsSelected.append([c.card[0], c.card[1]])
func _return2normal():
	
	var tween = get_tree().create_tween()
	$"../pointsAdded".position = ogPointsPos
	var ogScale = $"../points".scale
	
	tween.tween_property($"../points","scale",$"../points".scale*2,0.3).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($"../points","scale",ogScale,0.3).set_ease(Tween.EASE_IN_OUT)
	Global.points += points2add
	
