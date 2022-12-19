extends CharacterBody2D



func _on_fantety_lab_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "FantetyLabDoorCtrl":
		Common.fantetyLabDoorStatus = !Common.fantetyLabDoorStatus
		Common.fantetyLabDoorCtrlAllow = false
		if Common.fantetyLabDoorStatus:
			get_parent().get_node("FantetyLabDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_parent().get_node("FantetyLabDoorCtrlInner").set_frame(0)
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("FantetyLabDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_parent().get_node("FantetyLabDoorCtrlInner").set_frame(1)
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.


func _on_fantety_lab_door_ctrl_inner_door_ctrl_inner_name(doorCtrlName):
	if doorCtrlName == "FantetyLabDoorCtrlInner":
		_on_fantety_lab_door_ctrl_door_ctrl_input_finished("FantetyLabDoorCtrl")
	pass # Replace with function body.
