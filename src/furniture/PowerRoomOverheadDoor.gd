extends CharacterBody2D


func _on_power_room_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "PowerRoomDoorCtrl":
		Common.powerRoomDoorStatus = !Common.powerRoomDoorStatus
		Common.powerRoomDoorCtrlAllow = false
		if Common.powerRoomDoorStatus:
			get_parent().get_node("PowerRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_parent().get_node("PowerRoomDoorCtrlInner").set_frame(0)
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("PowerRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_parent().get_node("PowerRoomDoorCtrlInner").set_frame(1)
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.



func _on_power_room_door_ctrl_inner_door_ctrl_inner_name(doorCtrlName):
	if doorCtrlName == "PowerRoomDoorCtrlInner":
		_on_power_room_door_ctrl_door_ctrl_input_finished("PowerRoomDoorCtrl")
	pass # Replace with function body.
