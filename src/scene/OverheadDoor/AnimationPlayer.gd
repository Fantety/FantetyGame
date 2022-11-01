extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_animation_finished():
	if animation == "open":
		set_animation("close")
		stop()
		SignalBus.emit_signal("reset_re_bedroom_door_ctrl")
	elif animation == "close":
		set_animation("open")
		stop()
		SignalBus.emit_signal("reset_re_bedroom_door_ctrl")
	pass # Replace with function body.
