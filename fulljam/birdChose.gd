extends Node2D
const CHICKEN = preload("res://birds/chicken.png")
const OWL = preload("res://birds/owl.png")
const PARROT = preload("res://birds/parrot.png")
const PENGUIN = preload("res://birds/penguin.png")
const PIGEON = preload("res://birds/pigeon.png")
const RED_WINGED_BIRD = preload("res://birds/red_winged_bird.png")
const TOUCAN = preload("res://birds/toucan.png")
const CROW = preload("res://birds/crow.png")
@export var replaceBird : Sprite2D
var chosenIS
var oldChosen
func _process(delta: float) -> void:
	if not chosenIS == oldChosen:
		
		print(chosenIS )
		replaceBird.texture = chosenIS 
