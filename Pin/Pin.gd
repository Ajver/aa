extends Area2D

export(float) var speed = 1000

func _physics_process(delta):
	position.y -= speed * delta

func on_circle_hit():
	set_physics_process(false)
	collision_mask = 0
	set_collision_layer_bit(2, true)
	set_collision_layer_bit(3, false)

func _on_reload_game():
	queue_free()

func _on_Pin_area_entered(area):
	if area.name != "Circle":
		var game = get_node("/root/Game") 
		game.game_over()
