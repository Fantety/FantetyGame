extends Node2D


signal bedroom_door_ctrl_input_finished
signal balcony_door_ctrl_input_finished
# Called when the node enters the scene tree for the first time.
var theTrigger = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Common.bedroomDoorCtrlReady and Common.bedroomDoorCtrlAllow:
		bedroom_door_ctrl_function()
	elif Common.balconyDoorCtrlReady and Common.balconyDoorCtrlAllow:
		balcony_door_ctrl_function()
		pass
	pass
	
	
func bedroom_door_ctrl_function():
	if theTrigger:
		if Input.is_action_pressed("action"):
			if Common.bedroomDoorStatus:
				emit_signal("bedroom_door_ctrl_input_finished")
			else :
				if Backpack.accessControlCard:
					if !get_node("Right").playing:
						get_node("Right").play()
				else:
					if !get_node("Error").playing:
						get_node("Error").play()
				get_node("TextureProgressBar").set_visible(true)
				Common.bedroomDoorCtrlValue = Common.bedroomDoorCtrlValue + 1.0
				get_node("TextureProgressBar").set_value(Common.bedroomDoorCtrlValue)
		if Input.is_action_just_released("action"):
			Common.bedroomDoorCtrlValue = 0.0
			theTrigger = false
			get_node("TextureProgressBar").set_value(Common.bedroomDoorCtrlValue)
			get_node("TextureProgressBar").set_visible(false)
			if get_node("Right").playing:
					get_node("Right").stop()
			elif get_node("Error").playing:
					get_node("Error").stop()
			get_node("Timer").start()

func balcony_door_ctrl_function():
	if theTrigger:
		if Input.is_action_pressed("action"):
			if Common.balconyDoorStatus:
				emit_signal("balcony_door_ctrl_input_finished")
			else :
				if !get_node("Right").playing:
					get_node("Right").play()
				get_node("TextureProgressBar").set_visible(true)
				Common.balconyDoorCtrlValue = Common.balconyDoorCtrlValue + 1
				get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
		if Input.is_action_just_released("action"):
			theTrigger = false
			Common.balconyDoorCtrlValue = 0.0
			get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
			get_node("TextureProgressBar").set_visible(false)
			if get_node("Right").playing:
				get_node("Right").stop()
			elif get_node("Error").playing:
				get_node("Error").stop()
			get_node("Timer").start()


func _on_texture_progress_bar_value_changed(value):
	if Backpack.accessControlCard:
		if value == 100:
			if Common.bedroomDoorCtrlReady:
				Common.bedroomDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.bedroomDoorCtrlValue)
				emit_signal("bedroom_door_ctrl_input_finished")
			elif Common.balconyDoorCtrlReady:
				Common.balconyDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
				emit_signal("balcony_door_ctrl_input_finished")
	else:
		if value == 95:
			theTrigger = false
			Common.balconyDoorCtrlValue = 0.0
			get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
			get_node("TextureProgressBar").set_visible(false)
			get_node("Timer").start()


func _on_timer_timeout():
	theTrigger = true
	pass # Replace with function body.


func _on_timer_2_timeout():
	theTrigger = true
	pass # Replace with function body.
