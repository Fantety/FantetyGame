extends AnimatedSprite2D
# Called when the node enters the scene tree for the first time

func _on_animation_finished():
	if animation == "open":
		set_animation("close")
		stop()
	elif animation == "close":
		set_animation("open")
		stop()
	Common.bedroomDoorCtrlAllow = true
	Common.balconyDoorCtrlAllow = true
	Common.greenhouseDoorCtrlAllow = true
	
	pass # Replace with function body.
