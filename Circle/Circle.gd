extends Area2D

export(float) var turn_speed = 2.0

const RADIUS = 75

var next_pin = null
var score : int = 0

onready var score_label = $Score

func _ready():
	score_label.text = str(score)
	
func _physics_process(delta):
	rotate(turn_speed * delta)
	score_label.rect_rotation = -rotation_degrees
	
	if next_pin:
		score += 1
		score_label.text = str(score)
		reparent_next_pin()
		next_pin = null

func _on_Circle_area_entered(area):
	next_pin = area
	next_pin.on_circle_hit()

func reparent_next_pin():
	var pin_global_transform = next_pin.global_transform
	next_pin.get_parent().remove_child(next_pin)
	add_child(next_pin)
	next_pin.global_transform = pin_global_transform