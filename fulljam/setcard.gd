extends Node2D
@onready var player: Node2D = $player
@onready var card_1: Sprite2D = $card1
@onready var card_2: Sprite2D = $card2
@onready var card_4: Sprite2D = $card4
@onready var card_5: Sprite2D = $card5
@onready var cards = [$card1, $card2, $card3, $card4, $card5,$card6, $card7, $card8, $card9, $card10, $card11, $card12]
@onready var cardLables = [$card1/Label, $card2/Label, $card3/Label, $card4/Label, $card5/Label,$card6/Label,$card7/Label, $card8/Label, $card9/Label, $card10/Label, $card11/Label, $card12/Label]
func _process(delta: float) -> void:
	var index = 0
	for card in player.player_cards:
		cardLables[index].text = str(card[0]," ", card[1],"\ntime left: ",int(card[2]))
		cards[index].card = card
		index+=1
	$winner.text = player.winner


func _on_card_discard(card: Array) -> void:
	var index = player.player_cards.find(card)
	player.player_cards[index] = [player.card_col.pick_random(), player.card_val.pick_random(), randi_range(30,50)]
	player.winner = player.checkWinner()
