extends Node2D


signal bedroom_door_ctrl_input_finished
signal balcony_door_ctrl_input_finished
signal greenhouse_door_ctrl_input_finished
signal medical_door_ctrl_input_finished
# Called when the node enters the scene tree for the first time.
var theTrigger = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Common.bedroomDoorCtrlReady and Common.bedroomDoorCtrlAllow:
		bedroom_door_ctrl_function()
	elif Common.balconyDoorCtrlReady and Common.balconyDoorCtrlAllow:
		balcony_door_ctrl_function()
	elif Common.greenhouseDoorCtrlReady and Common.greenhouseDoorCtrlAllow:
		greenhouse_door_ctrl_function()
	elif Common.medicalDoorCtrlReady and Common.medicalDoorCtrlAllow:
		medical_door_ctrl_function()
		pass
	pass
	
	
func bedroom_door_ctrl_function():
	if theTrigger:
		if Input.is_action_pressed("action"):
			if Common.bedroomDoorStatus:
				emit_signal("bedroom_door_ctrl_input_finished")
			else :
				if Backpack.playerLevel >= Common.accessCardLevels.LEVEL1:
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
				if Backpack.playerLevel >= Common.accessCardLevels.LEVEL1:
					if !get_node("Right").playing:
						get_node("Right").play()
				else:
					if !get_node("Error").playing:
						get_node("Error").play()
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


func greenhouse_door_ctrl_function():
	if theTrigger:
		if Input.is_action_pressed("action"):
			if Common.greenhouseDoorStatus:
				print(Common.greenhouseDoorStatus)
				emit_signal("greenhouse_door_ctrl_input_finished")
			else :
				if Backpack.playerLevel >= Common.accessCardLevels.LEVEL1:
					if !get_node("Right").playing:
						get_node("Right").play()
				else:
					if !get_node("Error").playing:
						get_node("Error").play()
				get_node("TextureProgressBar").set_visible(true)
				Common.greenhouseDoorCtrlValue = Common.greenhouseDoorCtrlValue + 1
				get_node("TextureProgressBar").set_value(Common.greenhouseDoorCtrlValue)
		if Input.is_action_just_released("action"):
			theTrigger = false
			Common.greenhouseDoorCtrlValue = 0.0
			get_node("TextureProgressBar").set_value(Common.greenhouseDoorCtrlValue)
			get_node("TextureProgressBar").set_visible(false)
			if get_node("Right").playing:
				get_node("Right").stop()
			elif get_node("Error").playing:
				get_node("Error").stop()
			get_node("Timer").start()
			
func medical_door_ctrl_function():
	if theTrigger:
		if Input.is_action_pressed("action"):
			if Common.medicalDoorStatus:
				print(Common.medicalDoorStatus)
				emit_signal("medical_door_ctrl_input_finished")
			else :
				if Backpack.playerLevel >= Common.accessCardLevels.LEVEL1:
					if !get_node("Right").playing:
						get_node("Right").play()
				else:
					if !get_node("Error").playing:
						get_node("Error").play()
				get_node("TextureProgressBar").set_visible(true)
				Common.medicalDoorCtrlValue = Common.medicalDoorCtrlValue + 1
				get_node("TextureProgressBar").set_value(Common.medicalDoorCtrlValue)
		if Input.is_action_just_released("action"):
			theTrigger = false
			Common.medicalDoorCtrlValue = 0.0
			get_node("TextureProgressBar").set_value(Common.medicalDoorCtrlValue)
			get_node("TextureProgressBar").set_visible(false)
			if get_node("Right").playing:
				get_node("Right").stop()
			elif get_node("Error").playing:
				get_node("Error").stop()
			get_node("Timer").start()

func _on_texture_progress_bar_value_changed(value):
	if Backpack.playerLevel >= Common.accessCardLevels.LEVEL1:
		if value == 200:
			if Common.bedroomDoorCtrlReady:
				Common.bedroomDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.bedroomDoorCtrlValue)
				emit_signal("bedroom_door_ctrl_input_finished")
			elif Common.balconyDoorCtrlReady:
				Common.balconyDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
				emit_signal("balcony_door_ctrl_input_finished")
			elif Common.greenhouseDoorCtrlReady:
				Common.greenhouseDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.greenhouseDoorCtrlValue)
				emit_signal("greenhouse_door_ctrl_input_finished")
			elif Common.medicalDoorCtrlReady:
				Common.medicalDoorCtrlValue = 0.0
				get_node("TextureProgressBar").set_value(Common.medicalDoorCtrlValue)
				emit_signal("medical_door_ctrl_input_finished")
#	else:
#		if value == 95:
#			theTrigger = false
#			Common.balconyDoorCtrlValue = 0.0
#			get_node("TextureProgressBar").set_value(Common.balconyDoorCtrlValue)
#			get_node("TextureProgressBar").set_visible(false)
#			get_node("Timer").start()


func _on_timer_timeout():
	theTrigger = true
	pass # Replace with function body.


func _on_timer_2_timeout():
	theTrigger = true
	pass # Replace with function body.
