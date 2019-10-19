extends Position2D

var Pin = load("res://Pin/Pin.tscn")
onready var game = get_parent()

func _input(event):
	if not game.is_game_running:
		return
		
	if event is InputEventScreenTouch and event.is_pressed():
		spawn_pin()

func spawn_pin():
	var pin = Pin.instance()
	add_child(pin)
	game.connect("reload_game", pin, "_on_reload_game")
	
func _on_reload_game():
	spawn_pin()