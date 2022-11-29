extends CharacterBody2D


func _on_player_change_greenhouse_door_status():
	print(Common.greenhouseDoorStatus)
	Common.greenhouseDoorStatus = !Common.greenhouseDoorStatus
	get_parent().get_node("DoorCtrl/TextureProgressBar").hide()
	Common.greenhouseDoorCtrlAllow = false
	if Common.greenhouseDoorStatus:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
		get_node("AnimatedSprite2D").play("open")
	else:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
		get_node("AnimatedSprite2D").play("close")
	get_node("AnimationPlayer").play("open", 1.0, Common.greenhouseDoorStatus)
	get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
