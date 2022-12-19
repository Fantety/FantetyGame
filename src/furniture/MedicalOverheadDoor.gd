extends CharacterBody2D


func _on_medical_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "MedicalDoorCtrl":
		Common.medicalDoorStatus = !Common.medicalDoorStatus
		Common.medicalDoorCtrlAllow = false
		if Common.medicalDoorStatus:
			get_parent().get_node("MedicalDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_parent().get_node("MedicalDoorCtrlInner").set_frame(0)
			get_node("AnimatedSprite2D").play("open")
			get_node("AnimationPlayer").play("open")
		else:
			get_parent().get_node("MedicalDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_parent().get_node("MedicalDoorCtrlInner").set_frame(1)
			get_node("AnimatedSprite2D").play("close")
			get_node("AnimationPlayer").play_backwards("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
		
	pass # Replace with function body.


func _on_medical_door_ctrl_inner_door_ctrl_inner_name(doorCtrlName):
	if doorCtrlName == "MedicalDoorCtrlInner":
		_on_medical_door_ctrl_door_ctrl_input_finished("MedicalDoorCtrl")
	pass # Replace with function body.
