extends Node2D

var last_chosen: Sprite2D = null
@onready var fallback_bird: Sprite2D = $bird8

func on_bird_clicked(clicked_bird: Sprite2D,enemy_ref: Sprite2D) -> void:
	if enemy_ref:
		Global.bird = enemy_ref.me
	if last_chosen == null:
		# First click → swap with fallback
		_swap_textures(clicked_bird, fallback_bird)
	else:
		# Swap with previously chosen
		_swap_textures(clicked_bird, last_chosen)

	# Update last chosen
	last_chosen = clicked_bird

func _swap_textures(a: Sprite2D, b: Sprite2D) -> void:
	var temp = a.texture
	var tmpme = a.me
	a.texture = b.texture
	a.me = b.me
	b.texture = temp
	b.me = tmpme

func _on_button_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($ColorRect2,"color",Color(0,0,0,1.0),0.5)
	tween.tween_callback(switchScene)
func switchScene():
	get_tree().change_scene_to_file("res://main.tscn")
