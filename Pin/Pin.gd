extends Area2D

export(float) var speed = 1000

const LENGTH = 150

func _ready():
	pass
	
func _physics_process(delta):
	position.y -= speed * delta

func on_circle_hit():
	set_physics_process(false)