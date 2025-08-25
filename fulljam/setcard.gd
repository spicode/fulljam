extends Node2D
@onready var player: Node2D = $player
@onready var card_1: Sprite2D = $card1
@onready var card_2: Sprite2D = $card2
@onready var card_4: Sprite2D = $card4
@onready var card_5: Sprite2D = $card5
@onready var cards = [$card1, $card2, $card3, $card4, $card5]
@onready var cardLables = [$card1/Label, $card2/Label, $card3/Label, $card4/Label, $card5/Label]
func _process(delta: float) -> void:
	var index = 0
	for card in player.player_cards:
		cardLables[index].text = str(card[0]," ", card[1],"\ntime left: ",int(card[2]))
		index+=1
	$winner.text = player.checkWinner()
