extends Sprite2D

var allbirds = {"chicken": preload("res://birds/chicken.png"),"owl": preload("res://birds/owl.png"), 
"parrot":preload("res://birds/parrot.png"),
 "pigeon": preload("res://birds/pigeon.png"),"redWinged" :preload("res://birds/red_winged_bird.png"),"tocan": preload("res://birds/toucan.png")}
func _ready() -> void:
	if Global.bird == null:
		Global.bird= "pigeon"
	$".".texture = allbirds[Global.bird]
	$Label.text = str("enemy: ",Global.bird)
