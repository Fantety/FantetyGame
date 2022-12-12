extends Sprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var lightPos = global_position
	var mousePos = get_global_mouse_position()
	set_rotation(atan2(lightPos.y-mousePos.y,lightPos.x-mousePos.x)-PI/2)
	pass
