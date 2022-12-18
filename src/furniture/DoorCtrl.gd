extends Node2D


signal bedroom_door_ctrl_input_finished
signal balcony_door_ctrl_input_finished
signal greenhouse_door_ctrl_input_finished
signal medical_door_ctrl_input_finished
signal power_room_door_ctrl_input_finished
signal door_ctrl_input_finished(doorName:String)
# Called when the node enters the scene tree for the first time.
var theTrigger = true
signal lack_of_authority
signal passwd_error

@onready var doorCtrlUi = preload("res://scene/component/door_ctrl_ui.tscn").instantiate()

func _ready():
	self.lack_of_authority.connect(Callable(get_parent().get_parent(),"_on_player_lack_of_authority"))
	self.passwd_error.connect(Callable(get_parent().get_parent(),"_on_player_passwd_error"))
	add_child(doorCtrlUi)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Common.bedroomDoorCtrlReady and Common.bedroomDoorCtrlAllow:
		bedroom_door_ctrl_function()
	elif Common.balconyDoorCtrlReady and Common.balconyDoorCtrlAllow:
		balcony_door_ctrl_function()
	elif Common.greenhouseDoorCtrlReady and Common.greenhouseDoorCtrlAllow:
		greenhouse_door_ctrl_function()
	elif Common.medicalDoorCtrlReady and Common.medicalDoorCtrlAllow:
		medical_door_ctrl_function()
	elif Common.powerRoomDoorCtrlReady and Common.powerRoomDoorCtrlAllow:
		power_room_door_ctrl_function()
	elif Common.dataRoomDoorCtrlReady and Common.dataRoomDoorCtrlAllow:
		data_room_door_ctrl_function()
	elif Common.fantetyLabDoorCtrlReady and Common.fantetyLabDoorCtrlAllow:
		fantety_lab_door_ctrl_function()
		pass
	pass
	
	
func bedroom_door_ctrl_function():
	if self.name == "BedroomDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.bedroomDoorStatus:
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func balcony_door_ctrl_function():
	if self.name == "BalconyDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.balconyDoorStatus:
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()


func greenhouse_door_ctrl_function():
	if self.name == "GreenHouseDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.greenhouseDoorStatus:
				#print(Common.greenhouseDoorStatus)
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()
			
func medical_door_ctrl_function():
	if self.name == "MedicalDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.medicalDoorStatus:
				#print(Common.medicalDoorStatus)
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func power_room_door_ctrl_function():
	if self.name == "PowerRoomDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.powerRoomDoorStatus:
				#print(Common.medicalDoorStatus)
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func data_room_door_ctrl_function():
	if self.name == "DataRoomDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.dataRoomDoorStatus:
				#print(Common.medicalDoorStatus)
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func fantety_lab_door_ctrl_function():
	if self.name == "FantetyLabDoorCtrl":
		if Input.is_action_pressed("action"):
			if Common.fantetyLabDoorStatus:
				#print(Common.medicalDoorStatus)
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func _on_timer_timeout():
	theTrigger = true
	pass # Replace with function body.


func _on_door_ctrl_ui_door_ctrl_ui_input_finished(parentName, passward):
	if parentName == "GreenHouseDoorCtrl":
		if passward == "111111":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
	elif parentName == "BedroomDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	elif parentName == "BalconyDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	elif parentName == "MedicalDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	elif parentName == "PowerRoomDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	elif parentName == "DataRoomDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	elif parentName == "FantetyLabDoorCtrl":
		if passward == "123456":
			emit_signal("door_ctrl_input_finished",self.name)
			$DoorCtrlUi.door_ctrl_ui_hide()
		else:
			emit_signal("passwd_error")
		pass
	pass # Replace with function body.
