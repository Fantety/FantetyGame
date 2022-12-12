extends Node2D

signal balcony_plot_start
func _on_balcony_door_ctrl_door_ctrl_input_finished(doorName):
	if doorName == "BalconyDoorCtrl":
		Common.balconyDoorStatus = !Common.balconyDoorStatus
		Common.balconyDoorCtrlAllow = false
		if Common.balconyDoorStatus:
			get_parent().get_node("BalconyDoorCtrl/Sprite2D").set_texture(Common.doorCardUnlock)	
			get_node("AnimatedSprite2D").play("open")
			get_parent().get_node("RainSound").volume_db = 5.0
			#emit_signal("balcony_door_statue_change",Common.balconyDoorStatus)
		else:
			get_parent().get_node("BalconyDoorCtrl/Sprite2D").set_texture(Common.doorCardLock)		
			get_node("AnimatedSprite2D").play("close")
			get_parent().get_node("RainSound").volume_db = -10.0
			#emit_signal("balcony_door_statue_change",Common.balconyDoorStatus)
		get_node("AnimationPlayer").play("open", 1.0, Common.balconyDoorStatus)
		get_parent().get_parent().get_node("Sound/DoorSound").play(4.6)
		if Common.balconyPlot == false:
			if Common.balconyDoorStatus:
				await get_node("AnimationPlayer").animation_finished
				get_node("Timer").start()
				await get_node("Timer").timeout
				emit_signal("balcony_plot_start")
				Common.inputLock = true
	pass # Replace with function body.
