extends CharacterBody2D


func _on_power_room_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "PowerRoomDoorCtrl":
		Common.powerRoomDoorStatus = !Common.powerRoomDoorStatus
		Common.powerRoomDoorCtrlAllow = false
		if Common.powerRoomDoorStatus:
			get_parent().get_node("PowerRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_node("AnimatedSprite2D").play("open")
		else:
			get_parent().get_node("PowerRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_node("AnimatedSprite2D").play("close")
		get_node("AnimationPlayer").play("open", 1.0, Common.powerRoomDoorStatus)
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
