extends Node2D

func _ready():
	get_parent().get_node("DoorCtrl/TextureProgressBar").hide()

func _on_player_change_balcony_door_status():
	Common.balconyDoorStatus = !Common.balconyDoorStatus
	get_parent().get_node("DoorCtrl/TextureProgressBar").hide()
	Common.balconyDoorCtrlAllow = false
	if Common.balconyDoorStatus:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
		get_node("AnimatedSprite2D").play("open")
		get_parent().get_node("RainSound").volume_db = 2.0
	else:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
		get_node("AnimatedSprite2D").play("close")
		get_parent().get_node("RainSound").volume_db = -5.0
	get_node("AnimationPlayer").play("open", 1.0, Common.balconyDoorStatus)
	get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.
	pass # Replace with function body.
