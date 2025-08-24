extends Node2D
var card_col:Array[String]=["heart","spade","dimond","clubs"]
var card_val:Array[String]=["1","2","3","4","5","6","7","8","9","J","Q","K","Ace"]
func _ready() -> void:
	var card:Array[String]=[card_col[randi_range(0,4)],card_val[randi_range(0,14)]]	
	print(card)
var cards = {}
