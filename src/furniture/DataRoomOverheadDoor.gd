extends CharacterBody2D



func _on_data_room_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "DataRoomDoorCtrl":
		Common.dataRoomDoorStatus = !Common.dataRoomDoorStatus
		Common.dataRoomDoorCtrlAllow = false
		if Common.dataRoomDoorStatus:
			get_parent().get_node("DataRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("DataRoomDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
