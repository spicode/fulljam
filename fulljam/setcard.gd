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
const _2_OF_HEART = preload("res://cards/HEARTS/2_of_hearts.png")
const _3_OF_HEART = preload("res://cards/HEARTS/3_of_hearts.png")
const _4_OF_HEART = preload("res://cards/HEARTS/4_of_hearts.png")
const _5_OF_HEART = preload("res://cards/HEARTS/5_of_hearts.png")
const _6_OF_HEART = preload("res://cards/HEARTS/6_of_hearts.png")
const _7_OF_HEART = preload("res://cards/HEARTS/7_of_hearts.png")
const _8_OF_HEART = preload("res://cards/HEARTS/8_of_hearts.png")
const _9_OF_HEART = preload("res://cards/HEARTS/9_of_hearts.png")
const _10_OF_HEART = preload("res://cards/HEARTS/10_of_hearts.png")
const JACK_OF_HEART = preload("res://cards/HEARTS/jack_of_hearts.png")
const KING_OF_HEART = preload("res://cards/HEARTS/king_of_hearts.png")
const QUEEN_OF_HEART = preload("res://cards/HEARTS/queen_of_hearts.png")
const ACE_OF_HEART = preload("res://cards/HEARTS/ace_of_hearts.png")
const _2_OF_DIAMOND = preload("res://cards/DIAMONDS/2_of_diamonds.png")
const _3_OF_DIAMOND = preload("res://cards/DIAMONDS/3_of_diamonds.png")
const _4_OF_DIAMOND = preload("res://cards/DIAMONDS/4_of_diamonds.png")
const _5_OF_DIAMOND = preload("res://cards/DIAMONDS/5_of_diamonds.png")
const _6_OF_DIAMOND = preload("res://cards/DIAMONDS/6_of_diamonds.png")
const _7_OF_DIAMOND = preload("res://cards/DIAMONDS/7_of_diamonds.png")
const _8_OF_DIAMOND = preload("res://cards/DIAMONDS/8_of_diamonds.png")
const _9_OF_DIAMOND = preload("res://cards/DIAMONDS/9_of_diamonds.png")
const _10_OF_DIAMOND = preload("res://cards/DIAMONDS/10_of_diamonds.png")
const JACK_OF_DIAMOND = preload("res://cards/DIAMONDS/jack_of_diamonds.png")
const QUEEN_OF_DIAMOND = preload("res://cards/DIAMONDS/queen_of_diamonds.png")
const KING_OF_DIAMOND = preload("res://cards/DIAMONDS/king_of_diamonds.png")
const ACE_OF_DIAMOND = preload("res://cards/DIAMONDS/ace_of_diamonds.png")
const _2_OF_SPADE = preload("res://cards/SPADES/2_of_spades.png")
const _3_OF_SPADE = preload("res://cards/SPADES/3_of_spades.png")
const _4_OF_SPADE = preload("res://cards/SPADES/4_of_spades.png")
const _5_OF_SPADE = preload("res://cards/SPADES/5_of_spades.png")
const _6_OF_SPADE = preload("res://cards/SPADES/6_of_spades.png")
const _7_OF_SPADE = preload("res://cards/SPADES/7_of_spades.png")
const _8_OF_SPADE = preload("res://cards/SPADES/8_of_spades.png")
const _9_OF_SPADE = preload("res://cards/SPADES/9_of_spades.png")
const _10_OF_SPADE = preload("res://cards/SPADES/10_of_spades.png")
const JACK_OF_SPADE = preload("res://cards/SPADES/jack_of_spades.png")
const QUEEN_OF_SPADE = preload("res://cards/SPADES/queen_of_spades.png")
const KING_OF_SPADE = preload("res://cards/SPADES/king_of_spades.png")
const ACE_OF_SPADE = preload("res://cards/SPADES/ace_of_spades.png")
const cardsdict = {
	["clubs","2"]: _2_OF_CLUBS, ["clubs","3"]: _3_OF_CLUBS, ["clubs","4"]: _4_OF_CLUBS,
	["clubs","5"]: _5_OF_CLUBS, ["clubs","6"]: _6_OF_CLUBS, ["clubs","7"]: _7_OF_CLUBS,
	["clubs","8"]: _8_OF_CLUBS, ["clubs","9"]: _9_OF_CLUBS, ["clubs","10"]: _10_OF_CLUBS,
	["clubs","J"]: JACK_OF_CLUBS, ["clubs","Q"]: QUEEN_OF_CLUBS, ["clubs","K"]: KING_OF_CLUBS,
	["clubs","Ace"]: ACE_OF_CLUBS,
	["heart","2"]: _2_OF_HEART, ["heart","3"]: _3_OF_HEART, ["heart","4"]: _4_OF_HEART,
	["heart","5"]: _5_OF_HEART, ["heart","6"]: _6_OF_HEART, ["heart","7"]: _7_OF_HEART,
	["heart","8"]: _8_OF_HEART, ["heart","9"]: _9_OF_HEART, ["heart","10"]: _10_OF_HEART,
	["heart","J"]: JACK_OF_HEART, ["heart","Q"]: QUEEN_OF_HEART, ["heart","K"]: KING_OF_HEART,
	["heart","Ace"]: ACE_OF_HEART,
	["diamond","2"]: _2_OF_DIAMOND, ["diamond","3"]: _3_OF_DIAMOND, ["diamond","4"]: _4_OF_DIAMOND,
	["diamond","5"]: _5_OF_DIAMOND, ["diamond","6"]: _6_OF_DIAMOND, ["diamond","7"]: _7_OF_DIAMOND,
	["diamond","8"]: _8_OF_DIAMOND, ["diamond","9"]: _9_OF_DIAMOND, ["diamond","10"]: _10_OF_DIAMOND,
	["diamond","J"]: JACK_OF_DIAMOND, ["diamond","Q"]: QUEEN_OF_DIAMOND, ["diamond","K"]: KING_OF_DIAMOND,
	["diamond","Ace"]: ACE_OF_DIAMOND,
	["spade","2"]: _2_OF_SPADE, ["spade","3"]: _3_OF_SPADE, ["spade","4"]: _4_OF_SPADE,
	["spade","5"]: _5_OF_SPADE, ["spade","6"]: _6_OF_SPADE, ["spade","7"]: _7_OF_SPADE,
	["spade","8"]: _8_OF_SPADE, ["spade","9"]: _9_OF_SPADE, ["spade","10"]: _10_OF_SPADE,
	["spade","J"]: JACK_OF_SPADE, ["spade","Q"]: QUEEN_OF_SPADE, ["spade","K"]: KING_OF_SPADE,
	["spade","Ace"]: ACE_OF_SPADE
}
@onready var cards = [$card1, $card2, $card3, $card4, $card5,$card6, $card7, $card8]
@onready var snapPoses: Array =[$card1.snap_position, $card2.snap_position, $card3.snap_position, $card4.snap_position, $card5,$card6.snap_position, $card7.snap_position, $card8.snap_position]
@onready var cardLables = [$card1/Label, $card2/Label, $card3/Label, $card4/Label, $card5/Label,$card6/Label,$card7/Label, $card8/Label]
func _process(delta: float) -> void:
	var index = 0
	snapPoses = [$card1.snap_position, $card2.snap_position, $card3.snap_position, $card4.snap_position, $card5,$card6.snap_position, $card7.snap_position, $card8.snap_position]
	for card in player.player_cards:
		
		cards[index].card = card
		if cardsdict.has([card[0],card[1]]):
			var check : Array = [card[0],card[1]]
			cards[index].texture = cardsdict[check]
		else:
			cardLables[index].text = str(card[0]," ", card[1],"\ntime left: ",int(card[2]))
		index+=1
	$points.text = str(Global.points)
	

func _on_card_discard(card: Array) -> void:
	var index = player.player_cards.find(card)
	player.player_cards[index] = [player.card_col.pick_random(), player.card_val.pick_random(), randi_range(30,50)]
	
