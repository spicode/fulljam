extends Node2D
@onready var player: Node2D = $player
@onready var card_1: Sprite2D = $card1
@onready var card_2: Sprite2D = $card2
@onready var card_4: Sprite2D = $card4
@onready var card_5: Sprite2D = $card5
const _2_OF_CLUBS = preload("res://cards/2_of_clubs.png")
const _3_OF_CLUBS = preload("res://cards/3_of_clubs.png")
const _4_OF_CLUBS = preload("res://cards/4_of_clubs.png")
const _5_OF_CLUBS = preload("res://cards/5_of_clubs.png")
const _6_OF_CLUBS = preload("res://cards/6_of_clubs.png")
const _7_OF_CLUBS = preload("res://cards/7_of_clubs.png")
const _8_OF_CLUBS = preload("res://cards/8_of_clubs.png")
const _9_OF_CLUBS = preload("res://cards/9_of_clubs.png")
const _10_OF_CLUBS = preload("res://cards/10_of_clubs.png")
const JACK_OF_CLUBS = preload("res://cards/Jack_of_clubs.png")
const KING_OF_CLUBS = preload("res://cards/king_of_clubs.png")
const QUEEN_OF_CLUBS = preload("res://cards/queen_of_clubs.png")
const ACE_OF_CLUBS = preload("res://cards/ace_of_clubs.png")
const cardsdict = {
	["clubs","2"]: _2_OF_CLUBS,["clubs","3"]: _3_OF_CLUBS,["clubs","4"]: _4_OF_CLUBS,
	["clubs","5"]: _5_OF_CLUBS,["clubs","6"]: _6_OF_CLUBS,["clubs","7"]: _7_OF_CLUBS,
	["clubs","8"]: _8_OF_CLUBS,["clubs","9"]: _9_OF_CLUBS,["clubs","10"]: _10_OF_CLUBS,
	["clubs","J"]: JACK_OF_CLUBS,["clubs","Q"]: QUEEN_OF_CLUBS,["clubs","K"]: KING_OF_CLUBS,
	["clubs","Ase"]:ACE_OF_CLUBS
}
@onready var cards = [$card1, $card2, $card3, $card4, $card5,$card6, $card7, $card8]
@onready var cardLables = [$card1/Label, $card2/Label, $card3/Label, $card4/Label, $card5/Label,$card6/Label,$card7/Label, $card8/Label]
func _process(delta: float) -> void:
	var index = 0
	for card in player.player_cards:
		
		cards[index].card = card
		if cardsdict.has([card[0],card[1]]):
			var check : Array = [card[0],card[1]]
			cards[index].texture = cardsdict[check]
		else:
			cardLables[index].text = str(card[0]," ", card[1],"\ntime left: ",int(card[2]))
		index+=1
	$winner.text = player.winner
	

func _on_card_discard(card: Array) -> void:
	var index = player.player_cards.find(card)
	player.player_cards[index] = [player.card_col.pick_random(), player.card_val.pick_random(), randi_range(30,50)]
	player.winner = player.checkWinner()
