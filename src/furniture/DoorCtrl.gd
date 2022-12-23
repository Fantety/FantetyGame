extends Node2D

signal door_ctrl_input_finished(doorName:String)
# Called when the node enters the scene tree for the first time.
var theTrigger = true
signal lack_of_authority
signal passwd_error

@onready var doorCtrlUi = preload("res://scene/component/door_ctrl_ui.tscn").instantiate()


func _ready():
	if !(self.name == "BedroomDoorCtrl" || self.name == "BalconyDoorCtrl"):
		$PointLight2D.set_enabled(false)
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
	
	
func bedroom_door_ctrl_function():
	if self.name == "BedroomDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.bedroomDoorStatus:
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()

func balcony_door_ctrl_function():
	if self.name == "BalconyDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.balconyDoorStatus:
				emit_signal("door_ctrl_input_finished",self.name)
			else :
				$DoorCtrlUi.door_ctrl_ui_show()


func greenhouse_door_ctrl_function():
	if self.name == "GreenHouseDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.ePower:
				if Common.greenhouseDoorStatus:
					emit_signal("door_ctrl_input_finished",self.name)
				else :
					$DoorCtrlUi.door_ctrl_ui_show()
			else:
				if theTrigger:
					Common.show_tips("门禁需要供电！",true)
					theTrigger = false
					$Timer.start()
			
func medical_door_ctrl_function():
	if self.name == "MedicalDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.ePower:
				if Common.medicalDoorStatus:
					emit_signal("door_ctrl_input_finished",self.name)
				else :
					$DoorCtrlUi.door_ctrl_ui_show()
			else:
				if theTrigger:
					Common.show_tips("门禁需要供电！",true)
					theTrigger = false
					$Timer.start()

var batteryUsed = false

func set_battery_used():
	batteryUsed = true
	$PointLight2D.set_enabled(true)
	pass
	
func power_room_door_ctrl_function():
	if self.name == "PowerRoomDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.ePower || batteryUsed:
				if Common.powerRoomDoorStatus:
					emit_signal("door_ctrl_input_finished",self.name)
				else :
					$DoorCtrlUi.door_ctrl_ui_show()
			else:
				if theTrigger:
					if Backpack.battery == false:
						Common.show_tips("门禁需要供电！",true)
						theTrigger = false
						$Timer.start()
					else:
						var batteryYesOrNo = load("res://scene/component/battery_yes_or_no.tscn").instantiate()
						add_child(batteryYesOrNo)

func data_room_door_ctrl_function():
	if self.name == "DataRoomDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.ePower:
				if Common.dataRoomDoorStatus:
					emit_signal("door_ctrl_input_finished",self.name)
				else :
					$DoorCtrlUi.door_ctrl_ui_show()
			else:
				if theTrigger:
					Common.show_tips("门禁需要供电！",true)
					theTrigger = false
					$Timer.start()

func fantety_lab_door_ctrl_function():
	if self.name == "FantetyLabDoorCtrl":
		if Input.is_action_just_pressed("action"):
			if Common.ePower:
				if Common.fantetyLabDoorStatus:
				#print(Common.medicalDoorStatus)
					emit_signal("door_ctrl_input_finished",self.name)
				else :
					$DoorCtrlUi.door_ctrl_ui_show()
			else:
				if theTrigger:
					Common.show_tips("门禁需要供电！",true)
					theTrigger = false
					$Timer.start()

func _on_timer_timeout():
	theTrigger = true
	pass # Replace with function body.


func _on_door_ctrl_ui_door_ctrl_ui_input_finished(parentName, passward):
	if parentName == "GreenHouseDoorCtrl":
		if passward == "123456":
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
