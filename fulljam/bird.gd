extends Sprite2D

@export var me: String
@export var enemy_bird: Sprite2D   
const CHICKEN = preload("res://birds/chicken.png")
const CROW = preload("res://birds/crow.png")
const OWL = preload("res://birds/owl.png")
const PARROT = preload("res://birds/parrot.png")
const PENGUIN = preload("res://birds/penguin.png")
const PIGEON = preload("res://birds/pigeon.png")
const RED_WINGED_BIRD = preload("res://birds/red_winged_bird.png")
const TOUCAN = preload("res://birds/toucan.png")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and get_rect().has_point(to_local(event.position)):
			# Tell parent which bird was clicked
			get_parent().on_bird_clicked(self, enemy_bird)
			Global.bird = me
