extends Node2D

signal game_over
signal reload_game

var is_game_running = false
var can_reload_game = false

func _ready():
	connect("game_over", $Circle, "_on_game_over")
	connect("game_over", $PinSpawner, "_on_game_over")
	connect("game_over", $Background/AnimationPlayer, "_on_game_over")
	connect("reload_game", $Circle, "_on_reload_game")
	connect("reload_game", $PinSpawner, "_on_reload_game")
	is_game_running = true

func _input(event):
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
	
	if is_game_running:
		return
		
	if not can_reload_game:
		return
		
	if Input.is_action_just_pressed("shot") or (event is InputEventScreenTouch and event.is_pressed()):
		is_game_running = true
		emit_signal("reload_game")

func game_over():
	if not is_game_running:
		return
		
	can_reload_game = false
	is_game_running = false
	emit_signal("game_over")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "game_over":
		can_reload_game = true
