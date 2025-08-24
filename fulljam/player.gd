extends Node2D
var 	card_col:Array[String]=["heart","spade","dimond","clubs"]
var 	card_val:Array[String]=["1","2","3","4","5","6","7","8","9","J","Q","K","Ace"]
func _ready() -> void:
	var 	decay :int = 30
	for i in range(5):
		var card:Array=[card_col[randi_range(0,4)],card_val[randi_range(0,14)],decay]	
		print(card)
var 	cards = {}
