extends Position2D

var Pin = load("res://Pin/Pin.tscn")
onready var game = get_parent()

func _process(delta):
	if Input.is_action_just_pressed("shot"):
		spawn_pin()

func spawn_pin():
	var pin = Pin.instance()
	add_child(pin)
	game.connect("reload_game", pin, "_on_reload_game")
	
func _on_game_over():
	set_process(false)
	
func _on_reload_game():
	set_process(true)	
	spawn_pin()