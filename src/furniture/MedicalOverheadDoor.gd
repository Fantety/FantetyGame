extends CharacterBody2D


func _on_medical_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "MedicalDoorCtrl":
		Common.medicalDoorStatus = !Common.medicalDoorStatus
		Common.medicalDoorCtrlAllow = false
		if Common.medicalDoorStatus:
			get_parent().get_node("MedicalDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_node("AnimatedSprite2D").play("open")
		else:
			get_parent().get_node("MedicalDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_node("AnimatedSprite2D").play("close")
		get_node("AnimationPlayer").play("open", 1.0, Common.medicalDoorStatus)
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
		
	pass # Replace with function body.
