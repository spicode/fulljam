extends Node2D

var time_passed = 0.0
@onready var timer_label: Label = $timer

func _process(delta):
	time_passed += delta
	timer_label.text = str(int(time_passed))
