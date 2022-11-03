extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_change_bedroom_door_status():
	Common.bedroomDoorStatus = !Common.bedroomDoorStatus
	Common.bedroomDoorCtrlAllow = false
	get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightRed").set_enabled(!Common.bedroomDoorStatus)
	get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightGreen").set_enabled(Common.bedroomDoorStatus)
	if Common.bedroomDoorStatus:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
		get_node("AnimatedSprite2D").play("open")
	else:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
		get_node("AnimatedSprite2D").play("close")
	get_node("AnimationPlayer").play("open", 1.0, Common.bedroomDoorStatus)
	get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
	pass # Replace with function body.


func _stop_animation():
	
	pass
