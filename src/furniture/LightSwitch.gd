extends AnimatedSprite2D

signal change_light_statue(roomName:String,status:bool)
var lightSwitchReady = false
var lightStatus = false

func _process(_delta):
	if lightSwitchReady:
		if Input.is_action_just_pressed("action"):
			if Common.ePower:
				lightStatus = !lightStatus
				emit_signal("change_light_statue",self.name,lightStatus)
				if lightStatus:
					set_frame(1)
				else:
					set_frame(0)
			else:
				Common.show_tips("供电异常", true)
			pass
	pass
	
signal light_switch_body_enter
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		lightSwitchReady = true
		emit_signal("light_switch_body_enter")
	pass # Replace with function body.

signal light_switch_body_exited
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		lightSwitchReady = false
		emit_signal("light_switch_body_exited")
	pass # Replace with function body.
