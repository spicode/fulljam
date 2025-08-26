extends Sprite2D
var is_dragging = false #state management
var mouse_offset   #center mouse on click
var delay_dragging = 0.3
var delay_drop = 0.3
var drop_spots
var drop_outs#to spot to drop to output
signal discard(card:Array)
var card : Array
var snap_position
var normScale = Vector2(4.5,4.5)
var highScale = Vector2(9,9)
func _ready():
	add_to_group("foods")
	drop_spots = get_tree().get_nodes_in_group("drop_spot_group")
	drop_outs = get_tree().get_nodes_in_group("drop_out")
	
func _physics_process(delta):
	
	if Global.is_out_of_bounds:
		position = Vector2(0,0)
		Global.is_out_of_bounds = false
	if is_dragging:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position",( get_global_mouse_position() - mouse_offset), delay_dragging * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if Global.discard <= 0:
			return
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				discard.emit(card)
				Global.discard -=1
				print(Global.discard)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				
				is_dragging = true
				Global.is_dragging = true
				mouse_offset = get_global_mouse_position()-position
		else:
			is_dragging = false
			Global.is_dragging = false
			
			for drop_spot in drop_spots:
				if drop_spot.has_overlapping_areas() and drop_spot.get_overlapping_areas().has(self.get_node("Area2D")):
					snap_position = drop_spot.position
					var tween = get_tree().create_tween()
					
					tween.parallel().tween_property(self, "position", snap_position, delay_drop)
					tween.parallel().tween_property(self, "scale", highScale, delay_drop)
					
				else:
					var tween = get_tree().create_tween()
					tween.parallel().tween_property(self, "position", snap_position, delay_drop)
					tween.parallel().tween_property(self, "scale", normScale, delay_drop)
			for drop_out in drop_outs:
				if drop_out.has_overlapping_areas() and drop_out.get_overlapping_areas().has(self.get_node("Area2D")):
					snap_position = drop_out.position
					var tween = get_tree().create_tween()
					tween.parallel().tween_property(self, "position", snap_position, delay_drop)
					tween.parallel().tween_property(self, "scale", highScale, delay_drop)
				else:
					var tween = get_tree().create_tween()
					tween.parallel().tween_property(self, "position", snap_position, delay_drop)		
					tween.parallel().tween_property(self, "scale", normScale, delay_drop)
					



func _on_area_2d_enterd(area):
	if area.is_in_group("screen"):
		queue_free()
