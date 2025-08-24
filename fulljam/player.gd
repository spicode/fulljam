extends Node2D
var 	card_col:Array[String]=["heart","spade","dimond","clubs"]
var 	card_val:Array[String]=["1","2","3","4","5","6","7","8","9","J","Q","K","Ace"]
func _ready() -> void:
	var 	decay :int = 30
	
	var 	card:Array=[card_col.pick_random(),card_val.pick_random(),decay]	
	print(card)
var 	cards = {}
