extends Area2D

export(float) var turn_speed = 1.0

onready var base_turn_speed :float = turn_speed

const RADIUS = 75

var next_pin = null
var score : int = 0 setget set_score

onready var score_label = $Score

func _ready() -> void:
	set_score(0)
	
func _physics_process(delta) -> void:
	rotate(turn_speed * delta)
	score_label.rect_rotation = -rotation_degrees
	
	if next_pin:
		set_score(score + 1)
		reparent_next_pin()
		next_pin = null
		
func _on_game_over() -> void:
	set_physics_process(false)
	
func _on_reload_game() -> void:
	set_physics_process(true)
	set_score(0)
	next_pin = null
	turn_speed = base_turn_speed

func _on_Circle_area_entered(area) -> void:
	next_pin = area
	next_pin.on_circle_hit()
	turn_speed += 0.05

func reparent_next_pin() -> void:
	var pin_global_transform = next_pin.global_transform
	next_pin.get_parent().remove_child(next_pin)
	add_child(next_pin)
	next_pin.global_transform = pin_global_transform
	
func set_score(value:int) -> void:
	score = value
	score_label.text = str(score)