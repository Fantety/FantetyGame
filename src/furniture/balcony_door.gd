extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_change_balcony_door_status():
	Common.balconyDoorStatus = !Common.balconyDoorStatus
	Common.balconyDoorCtrlAllow = false
	if Common.balconyDoorStatus:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)
		await get_node("LpcDoor").play("open",false)
		get_node("CollisionShape2D").set_deferred("disabled",true)
		get_node("LpcDoor/LightOccluder2D").set_visible(false)
		
		pass
	else:
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(Common.doorCardLock)
		await get_node("LpcDoor").play("open",true)
		get_node("CollisionShape2D").set_deferred("disabled",false)
		get_node("LpcDoor/LightOccluder2D").set_visible(true)
		
	pass # Replace with function body.
