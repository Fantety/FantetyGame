extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const PROGRESS_SPEED = 20

@onready var dialogBubble = preload("res://scene/component/dialog_bubble.tscn").instantiate()
@onready var playerView = $PlayerView
@onready var runSound = $RunSound
@onready var rainWalkSound = $RainWalkSound
@onready var parent = get_parent()
@onready var elevatorArrivedSound = get_parent().get_node("Sound/ElevatorArrived")


var balconyPlotStart = false
var balconyPlotArrived = false

#var porgressBarValue = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var currentFloor = 3

var isJumped = false


signal change_elevator_door_status(status)
signal change_bedroom_light_status(num:int)
signal lack_of_authority

func _ready():
	add_child(dialogBubble)
	dialogBubble.set_position(playerView.position + Vector2(15,-18))
	dialogBubble.hide()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if isJumped:
			isJumped = false
			get_node("JumpSound").play()

	# Handle Jump.
	if !Common.inputLock:
		if Input.is_action_just_pressed("act_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			isJumped = true
	
		if Input.is_action_just_pressed("action"):
			if Common.bedReady:
				start_bed_dialog()
			elif Common.bedroomTerminalReady:
				start_bedroom_terminal_ready()
			elif Common.bedroomDeskReady:
				start_bedroom_desk_ready()
			elif Common.kuiKuiReady:
				start_kuikui_ready()
			elif Common.elevatorReady:
				start_elevator_ready()
			elif Common.elevator2Ready:
				start_elevator2_ready()
			elif Common.elevator3Ready:
				start_elevator3_ready()
			elif Common.elevator4Ready:
				start_elevator4_ready()
			elif Common.bedroomComputerReady:
				start_bedroom_computer_ready()
			elif Common.VendingMachineReady:
				start_vending_machine_ready()
			elif Common.wardrobeReady:
				start_bedroom_wardrobe_ready()
			elif Common.bedroomOutSofaReady:
				start_bedroom_out_sofa_ready()
			elif Common.powerRoomWiringReady:
				start_power_room_wiring_ready()
			elif Common.powerRoomCardReady:
				start_powerroom_card_ready()
			elif Common.medicalPlotReady:
				start_medical_plot_ready()
			elif Common.greenhousePlotReady:
				start_green_house_plot_ready()
			elif Common.greenhouseComputerReady:
				start_green_house_computer_ready()
			elif Common.dataRoomTerminalReady:
				start_data_room_terminal_ready()
			elif Common.fantetyLabBrokenJarReady:
				start_fantety_lab_broken_jar_ready()
			elif Common.fantetyLabDeskReady:
				start_fantety_lab_desk_ready()
			elif Common.balconyPlotSecondReady:
				start_balcony_plot_second_ready()
		elif Common.bedroomLightSwitchReady:
			start_bedroom_light_switch_ready()
		var direction = Input.get_axis("act_left", "act_right")
		if direction:
			velocity.x = direction * SPEED
			playerView.play("run")
			playerView.set_flip_h(direction == -1)
			if is_on_floor():
				if !runSound.playing:
					runSound.play()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			playerView.play("stand")
			runSound.stop()

	elif Common.balconyPlot == false and balconyPlotStart and balconyPlotArrived == false:
		move_and_collide(Vector2(-1,0))
		playerView.play("walk")
		if !rainWalkSound.playing:
			rainWalkSound.play()
		pass
	move_and_slide()


func _on_bed_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedReady = true
	pass # Replace with function body.


func _on_bed_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedReady = false
	pass # Replace with function body.
	
	
func start_bed_dialog():
	if Common.bedroomSwitch4Status:
		DialogueManager.show_example_dialogue_balloon(Common.bedDialog, "start")
	else:
		DialogueManager.show_example_dialogue_balloon(Common.bedDialogEgg, "start")
	
func start_bedroom_terminal_ready():
	DialogueManager.show_example_dialogue_balloon(Common.bedroomHealthDialog, "start")
	pass

func start_bedroom_desk_ready():
	DialogueManager.show_example_dialogue_balloon(Common.bedroomDeskDialog, "start")
	pass

func start_kuikui_ready():
	DialogueManager.show_example_dialogue_balloon(Common.kuikuiDialog, "start")
	pass
	
func start_elevator_ready():
	if Backpack.playerLevel >= Common.accessCardLevels.LEVEL2:
		self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator"),"_on_player_change_elevator_door_status"))
		emit_signal("change_elevator_door_status",Common.elevatorDoorStatus, 1)
		self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator"),"_on_player_change_elevator_door_status"))
	else:
		emit_signal("lack_of_authority")
	pass

func start_elevator2_ready():
	if Backpack.playerLevel >= Common.accessCardLevels.LEVEL2:
		self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator2"),"_on_player_change_elevator_door_status"))
		emit_signal("change_elevator_door_status",Common.elevator2DoorStatus, 2)
		self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator2"),"_on_player_change_elevator_door_status"))
	else:
		emit_signal("lack_of_authority")
	pass
	
func start_elevator3_ready():
	if Backpack.playerLevel >= Common.accessCardLevels.LEVEL2:
		self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator3"),"_on_player_change_elevator_door_status"))
		emit_signal("change_elevator_door_status",Common.elevator3DoorStatus, 3)
		self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator3"),"_on_player_change_elevator_door_status"))
	else:
		emit_signal("lack_of_authority")
	pass
	
func start_elevator4_ready():
	if Backpack.playerLevel >= Common.accessCardLevels.LEVEL2:
		self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator4"),"_on_player_change_elevator_door_status"))
		emit_signal("change_elevator_door_status",Common.elevator4DoorStatus, 4)
		self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator4"),"_on_player_change_elevator_door_status"))
	else:
		emit_signal("lack_of_authority")
		
		
func _on_bedroom_terminal_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomTerminalReady = true
	pass # Replace with function body.


func _on_bedroom_terminal_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomTerminalReady = false
	pass # Replace with function body.


func _on_bedroom_desk_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomDeskReady = true
	pass # Replace with function body.


func _on_bedroom_desk_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomDeskReady = false
	pass # Replace with function body.


func _on_kui_kui_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.kuiKuiReady = true
	pass # Replace with function body.


func _on_kui_kui_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.kuiKuiReady = false
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomDoorCtrlReady = true
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomDoorCtrlReady = false
	pass # Replace with function body.




func _on_balcony_door_ctrl_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.balconyDoorCtrlReady = true
	pass # Replace with function body.


func _on_balcony_door_ctrl_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.balconyDoorCtrlReady = false
	pass # Replace with function body.




func _on_bedroom_light_switch_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomLightSwitchReady = true
	pass # Replace with function body.


func _on_bedroom_light_switch_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomLightSwitchReady = false
	pass # Replace with function body.


func start_bedroom_light_switch_ready():
	if Input.is_action_just_pressed("num_one"):
		emit_signal("change_bedroom_light_status",1)
	elif Input.is_action_just_pressed("num_two"):
		emit_signal("change_bedroom_light_status",2)
	elif Input.is_action_just_pressed("num_three"):
		emit_signal("change_bedroom_light_status",3)
	elif Input.is_action_just_pressed("num_four"):
		emit_signal("change_bedroom_light_status",4)
	pass


func _on_elevator_player_enter(body):
	if body == self:
		dialogBubble.show()
		Common.elevatorReady = true
	pass # Replace with function body.


func _on_elevator_player_exit(body):
	if body == self:
		dialogBubble.hide()
		Common.elevatorReady = false
		get_node("ElevatorCtrlUi").hide()
	pass # Replace with function body.


func _on_elevator_change_elevator_ctrl_status():
	if !Common.elecatorCtrlStatus:
		get_node("ElevatorCtrlUi").show()
	else:
		get_node("ElevatorCtrlUi").hide()
	Common.elecatorCtrlStatus = !Common.elecatorCtrlStatus
	pass # Replace with function body.


func _on_elevator_2_player_enter(body):
	if body == self:
		dialogBubble.show()
		Common.elevator2Ready = true
	pass # Replace with function body.


func _on_elevator_2_player_exit(body):
	if body == self:
		dialogBubble.hide()
		Common.elevator2Ready = false
		get_node("ElevatorCtrlUi").hide()
	pass # Replace with function body.


func _on_elevator_2_change_elevator_ctrl_status():
	if !Common.elecator2CtrlStatus:
		get_node("ElevatorCtrlUi").show()
	else:
		get_node("ElevatorCtrlUi").hide()
	Common.elecator2CtrlStatus = !Common.elecator2CtrlStatus
	pass # Replace with function body.


func _on_elevator_ctrl_ui_elevator_floor_selected(index):
	print(index)
	if index != currentFloor:
		Common.inputLock = true
		if Backpack.flashLight:
			$FlashLight/AnimationPlayer.play("default")
		gravity = 0
		set_z_index(-2)
		Common.elevatorCtrlTrigger = true
		if currentFloor == 3:
			parent.get_node("Elevator/Elevator")._on_player_change_elevator_door_status(Common.elevatorDoorStatus, 1)
		elif currentFloor == 2:
			parent.get_node("Elevator/Elevator2")._on_player_change_elevator_door_status(Common.elevator2DoorStatus, 2)
		elif currentFloor == 1:
			parent.get_node("Elevator/Elevator3")._on_player_change_elevator_door_status(Common.elevator3DoorStatus, 3)
		elif currentFloor == 0:
			parent.get_node("Elevator/Elevator4")._on_player_change_elevator_door_status(Common.elevator4DoorStatus, 4)
		get_node("Timer").start()
		await get_node("Timer").timeout
		get_node("CollisionShape").set_deferred("disabled",true)
		var tween = create_tween().bind_node(self).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "position", Vector2(position.x,position.y+32*4*(currentFloor-index)), abs(currentFloor-index)*2)
		tween.play()
		await tween.finished
		tween.kill()
		currentFloor = index
		if currentFloor == 3:
			parent.get_node("Elevator/Elevator")._on_player_change_elevator_door_status(Common.elevatorDoorStatus, 1)
		elif currentFloor == 2:
			parent.get_node("Elevator/Elevator2")._on_player_change_elevator_door_status(Common.elevator2DoorStatus, 2)
		elif currentFloor == 1:
			parent.get_node("Elevator/Elevator3")._on_player_change_elevator_door_status(Common.elevator3DoorStatus, 3)
		elif currentFloor == 0:
			parent.get_node("Elevator/Elevator4")._on_player_change_elevator_door_status(Common.elevator4DoorStatus, 4)
		get_node("Timer").start()
		elevatorArrivedSound.play()
		if currentFloor == 3:
			Common.show_tips("四楼", false)
		elif currentFloor == 2:
			Common.show_tips("三楼", false)
		elif currentFloor == 1:
			Common.show_tips("二楼", false)
		elif currentFloor == 0:
			Common.show_tips("一楼", false)		
		await get_node("Timer").timeout
		get_node("CollisionShape").set_deferred("disabled",false)
		set_z_index(2)
		Common.inputLock = false
		Common.select = false
		Common.elevatorCtrlTrigger = false
		gravity = 980
		if Backpack.flashLight:
			$FlashLight/AnimationPlayer.play_backwards("default")
	pass # Replace with function body.


func _on_elevator_3_player_enter(body):
	if body == self:
		dialogBubble.show()
		Common.elevator3Ready = true
	pass # Replace with function body.


func _on_elevator_3_player_exit(body):
	if body == self:
		dialogBubble.hide()
		Common.elevator3Ready = false
		get_node("ElevatorCtrlUi").hide()
	pass # Replace with function body.


func _on_elevator_3_change_elevator_ctrl_status():
	if !Common.elecator3CtrlStatus:
		get_node("ElevatorCtrlUi").show()
	else:
		get_node("ElevatorCtrlUi").hide()
	Common.elecator3CtrlStatus = !Common.elecator3CtrlStatus
	pass # Replace with function body.


func _on_elevator_4_player_enter(body):
	if body == self:
		dialogBubble.show()
		Common.elevator4Ready = true
	pass # Replace with function body.


func _on_elevator_4_player_exit(body):
	if body == self:
		dialogBubble.hide()
		Common.elevator4Ready = false
		get_node("ElevatorCtrlUi").hide()
	pass # Replace with function body.


func _on_elevator_4_change_elevator_ctrl_status():
	if !Common.elecator4CtrlStatus:
		get_node("ElevatorCtrlUi").show()
	else:
		get_node("ElevatorCtrlUi").hide()
	Common.elecator4CtrlStatus = !Common.elecator4CtrlStatus
	pass # Replace with function body.


func _on_bedroom_cumputer_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomComputerReady = true
	pass # Replace with function body.


func _on_bedroom_cumputer_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomComputerReady = false
	pass # Replace with function body.

func start_bedroom_computer_ready():
	DialogueManager.show_example_dialogue_balloon(Common.bedroomComputerDialog, "start")
	pass


func _on_wardrobe_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.wardrobeReady = true
	pass # Replace with function body.


func _on_wardrobe_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.wardrobeReady = false
	pass # Replace with function body.

func start_bedroom_wardrobe_ready():
	DialogueManager.show_example_dialogue_balloon(Common.bedroomClosetDialog, "start")
	pass
	
	
func _on_vending_machines_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.VendingMachineReady = true
	pass # Replace with function body.


func _on_vending_machines_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.VendingMachineReady = false
	pass # Replace with function body.

signal use_vending_machine
func start_vending_machine_ready():
	emit_signal("use_vending_machine")
	pass

signal balcony_plot_player_arrived
func _on_balcony_plot_area_body_entered(body):
	if body == self and Common.balconyPlot == false:
		if rainWalkSound.playing:
			rainWalkSound.stop()
		balconyPlotArrived = true
		playerView.play("stand")
		var tween = create_tween().bind_node($Camera).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property($Camera, "position", Vector2(get_node("Camera").position.x-50,get_node("Camera").position.y),2)
		tween.play()
		await tween.finished
		tween.kill()
		emit_signal("balcony_plot_player_arrived")
	pass # Replace with function body.


func _on_overhead_door_balcony_plot_start():
	balconyPlotStart = true
	pass # Replace with function body.



func _on_greenhouse_door_ctrl_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.greenhouseDoorCtrlReady = true
	pass # Replace with function body.


func _on_greenhouse_door_ctrl_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.greenhouseDoorCtrlReady = false
	pass # Replace with function body.


func _on_medical_door_ctrl_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.medicalDoorCtrlReady = true
	pass # Replace with function body.


func _on_medical_door_ctrl_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.medicalDoorCtrlReady = false
	pass # Replace with function body.




func _on_floor_lamp_a_body_change_floor_lamp_area(status):
	if status:
		Common.floorLampReady = true
		dialogBubble.show()
	else:
		Common.floorLampReady = false
		dialogBubble.hide()
	pass # Replace with function body.


func _on_floor_lamp_a_2_body_change_floor_lamp_area(status):
	if status:
		Common.floorLampReady = true
		dialogBubble.show()
	else:
		Common.floorLampReady = false
		dialogBubble.hide()
	pass # Replace with function body.


func _on_door_ctrl_inner_door_ctrl_inner_entered():
	dialogBubble.show()
	pass # Replace with function body.


func _on_door_ctrl_inner_door_ctrl_inner_exited():
	dialogBubble.hide()
	pass # Replace with function body.


func _on_power_room_terminal_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.powerRoomTerminalReady = true
	pass # Replace with function body.


func _on_power_room_terminal_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.powerRoomTerminalReady = false
	pass # Replace with function body.


func _on_power_room_door_ctrl_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.powerRoomDoorCtrlReady = true
	pass # Replace with function body.


func _on_power_room_door_ctrl_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.powerRoomDoorCtrlReady = false
	pass # Replace with function body.



func _on_bedroom_out_sofa_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.bedroomOutSofaReady = true
	pass # Replace with function body.


func _on_bedroom_out_sofa_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.bedroomOutSofaReady = false
	pass # Replace with function body.

func start_bedroom_out_sofa_ready():
	DialogueManager.show_example_dialogue_balloon(Common.bedroomOutSofaDialog, "start")
	pass


func _on_power_room_wiring_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.powerRoomWiringReady = true
	pass # Replace with function body.


func _on_power_room_wiring_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.powerRoomWiringReady = false
	pass # Replace with function body.

func start_power_room_wiring_ready():
	DialogueManager.show_example_dialogue_balloon(Common.powerroomWiringDialog,"start")
	pass


func _on_power_room_card_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.powerRoomCardReady = true
	pass # Replace with function body.


func _on_power_room_card_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.powerRoomCardReady = false
	pass # Replace with function body.


func start_powerroom_card_ready():
	DialogueManager.show_example_dialogue_balloon(Common.powerroomCardDialog,"start")
	pass


func _on_medical_plot_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.medicalPlotReady = true
	pass # Replace with function body.


func _on_medical_plot_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.medicalPlotReady = false
	pass # Replace with function body.

func start_medical_plot_ready():
	DialogueManager.show_example_dialogue_balloon(Common.medicalDialog,"start")
	pass


func _on_green_house_plot_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.greenhousePlotReady = true
	pass # Replace with function body.


func _on_green_house_plot_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.greenhousePlotReady = false
	pass # Replace with function body.

func start_green_house_plot_ready():
	DialogueManager.show_example_dialogue_balloon(Common.greenhouseDialog,"start")
	pass


func _on_green_house_computer_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.greenhouseComputerReady = true
	pass # Replace with function body.


func _on_green_house_computer_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.greenhouseComputerReady = false
	pass # Replace with function body.
	
	
func start_green_house_computer_ready():
	if get_parent().find_child("GreenhouseComputer", false, false) != null:
		get_parent().get_node("GreenhouseComputer").show()
	else:
		var greenhouseComputerUi = load("res://scene/furniture/greenhouse_computer.tscn").instantiate()
		get_parent().add_child(greenhouseComputerUi)
	pass


func _on_data_room_terminal_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.dataRoomTerminalReady = true
	pass # Replace with function body.


func _on_data_room_terminal_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.dataRoomTerminalReady = false
	pass # Replace with function body.


func start_data_room_terminal_ready():
	if get_parent().find_child("DataComputer", false, false) != null:
		get_parent().get_node("DataComputer").show()
	else:
		var dataComputerUi = load("res://scene/furniture/data_computer.tscn").instantiate()
		get_parent().add_child(dataComputerUi)


func _on_fantety_lab_broken_jar_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.fantetyLabBrokenJarReady = true
	pass # Replace with function body.


func _on_fantety_lab_broken_jar_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.fantetyLabBrokenJarReady = false
	pass # Replace with function body.

func start_fantety_lab_broken_jar_ready():
	DialogueManager.show_example_dialogue_balloon(Common.fantetyBrokenJarDialog,"start")
	Common.fantetyLabOne = true
	pass

func _on_fantety_lab_desk_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.fantetyLabDeskReady = true
	pass # Replace with function body.


func _on_fantety_lab_desk_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.fantetyLabDeskReady = false
	pass # Replace with function body.

func start_fantety_lab_desk_ready():
	DialogueManager.show_example_dialogue_balloon(Common.fantetyDeskDialog,"start")
	Common.fantetyLabTwo = true
	pass




func _on_data_room_door_ctrl_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.dataRoomDoorCtrlReady = true
	pass # Replace with function body.


func _on_data_room_door_ctrl_area_body_exited(body):
	if body == self:
		dialogBubble.hide()
		Common.dataRoomDoorCtrlReady = false
	pass # Replace with function body.


func _on_fantety_lab_door_ctrl_area_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.fantetyLabDoorCtrlReady = true
	pass # Replace with function body.


func _on_fantety_lab_door_ctrl_area_body_exited(body):
	if body == self:
		dialogBubble.show()
		Common.fantetyLabDoorCtrlReady = false
	pass # Replace with function body.


func _on_balcony_plot_second_body_entered(body):
	if body == self:
		dialogBubble.show()
		Common.balconyPlotSecondReady = true
	pass # Replace with function body.


func _on_balcony_plot_second_body_exited(body):
	if body == self:
		dialogBubble.show()
		Common.balconyPlotSecondReady = false
	pass # Replace with function body.

func start_balcony_plot_second_ready():
	DialogueManager.show_example_dialogue_balloon(Common.balconySecondDialog,"start")
	pass
