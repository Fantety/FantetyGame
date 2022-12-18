extends CharacterBody2D



func _on_green_house_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "GreenHouseDoorCtrl":
		Common.greenhouseDoorStatus = !Common.greenhouseDoorStatus
		Common.greenhouseDoorCtrlAllow = false
		if Common.greenhouseDoorStatus:
			get_parent().get_node("GreenHouseDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("GreenHouseDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
	get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
