extends Position2D

var Pin = load("res://Pin/Pin.tscn")

func _input(event):
	if Input.is_action_just_pressed("shot") or event is InputEventScreenTouch:
		spawn_pin()

func spawn_pin():
	var pin = Pin.instance()
	add_child(pin)