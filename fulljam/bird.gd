extends Sprite2D

@export var me: String
@export var enemy_bird: Sprite2D   


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and get_rect().has_point(to_local(event.position)):
			# Tell parent which bird was clicked
			get_parent().on_bird_clicked(self, enemy_bird)
			
