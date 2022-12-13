extends Node2D


func _on_bedroom_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "BedroomDoorCtrl":
		Common.bedroomDoorStatus = !Common.bedroomDoorStatus
		Common.bedroomDoorCtrlAllow = false
		if Common.bedroomDoorStatus:
			get_parent().get_node("BedroomDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)
			get_parent().get_node("BedroomDoorCtrlInner").set_frame(0)	
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("BedroomDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_parent().get_node("BedroomDoorCtrlInner").set_frame(1)
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.


func _on_bedroom_door_ctrl_inner_door_ctrl_inner_name(doorCtrlName):
	if doorCtrlName == "BedroomDoorCtrlInner":
		_on_bedroom_door_ctrl_door_ctrl_input_finished("BedroomDoorCtrl")
	pass # Replace with function body.
