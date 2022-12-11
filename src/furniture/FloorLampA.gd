extends Sprite2D


var lightStatus = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.name == Common.currentFloorLamp and Common.floorLampReady:
		if Input.is_action_just_pressed("action"):
			$PointLight2D.set_enabled(!lightStatus)
			$AudioStreamPlayer.play()
			lightStatus = !lightStatus
		pass
	pass

signal body_change_floor_lamp_area(status:bool)
func _on_floor_lamp_a_area_2d_body_entered(body):
	if body.name == "Player":
		emit_signal("body_change_floor_lamp_area", true)
		Common.currentFloorLamp = self.name
	pass # Replace with function body.

func _on_floor_lamp_a_area_2d_body_exited(body):
	if body.name == "Player":
		emit_signal("body_change_floor_lamp_area", false)
		Common.currentFloorLamp = "none"
	pass # Replace with function body.
