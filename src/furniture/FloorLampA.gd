extends Sprite2D


var lightStatus = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Common.FloorLampAReady:
		if Input.is_action_just_pressed("action"):
			$PointLight2D.set_enabled(!lightStatus)
			$AudioStreamPlayer.play()
			lightStatus = !lightStatus
		pass
	pass

signal body_change_floor_lamp_area(status:bool, body)
func _on_floor_lamp_a_area_2d_body_entered(body):
	emit_signal("body_change_floor_lamp_area", true, body)
	pass # Replace with function body.


func _on_floor_lamp_a_area_2d_body_exited(body):
	emit_signal("body_change_floor_lamp_area", false, body)
	pass # Replace with function body.
