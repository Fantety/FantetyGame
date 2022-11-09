extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -200.0
const PROGRESS_SPEED = 20

@onready var dialogBubble = preload("res://scene/component/dialog_bubble.tscn").instantiate()
@onready var playerView = $PlayerView
@onready var runSound = $RunSound
@onready var parent = get_parent()
@onready var elevatorArrivedSound = get_parent().get_node("Sound/ElevatorArrived")



var inputPasswdSoundRight
var inputPasswdSoundError
#var porgressBarValue = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var currentFloor = 3

var isJumped = false

signal change_bedroom_door_status()
signal change_balcony_door_status()
signal change_elevator_door_status(status)
signal change_bedroom_light_status(num:int)

func _ready():
	add_child(dialogBubble)
	dialogBubble.set_position(playerView.position + Vector2(15,-18))
	dialogBubble.hide()
	inputPasswdSoundRight = get_parent().get_node("Sound/InputPasswdSoundRight")
	inputPasswdSoundError = get_parent().get_node("Sound/InputPasswdSoundError")

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
		elif Common.bedroomLightSwitchReady:
			start_bedroom_light_switch_ready()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("act_left", "act_right")
		if direction:
			velocity.x = direction * SPEED
			playerView.play("run")
			playerView.set_flip_h(direction == -1)
			if !runSound.playing:
				runSound.play()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			playerView.play("stand")
			runSound.stop()

	move_and_slide()


func _on_bed_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.bedReady = true
	pass # Replace with function body.


func _on_bed_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.bedReady = false
	pass # Replace with function body.
	
	
func start_bed_dialog():
	if Common.bedroomSwitch4Status:
		DialogueManager.show_example_dialogue_balloon(Common.bedDialog, "start")
	else:
		DialogueManager.show_example_dialogue_balloon(Common.bedDialogEgg, "start")
		
#	print("xx")
	
	
	
func start_bedroom_terminal_ready():
	pass

func start_bedroom_desk_ready():
	pass

func start_kuikui_ready():
	DialogueManager.show_example_dialogue_balloon(get_node("..").kuikuiDialog, "start")
	pass

func start_bedroom_door_ctrl_ready():
	emit_signal("change_bedroom_door_status")
	pass

func start_balcony_door_ctrl_ready():
	emit_signal("change_balcony_door_status")
	pass

func start_elevator_ready():
	self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator"),"_on_player_change_elevator_door_status"))
	emit_signal("change_elevator_door_status",Common.elevatorDoorStatus, 1)
	self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator"),"_on_player_change_elevator_door_status"))
	pass

func start_elevator2_ready():
	self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator2"),"_on_player_change_elevator_door_status"))
	emit_signal("change_elevator_door_status",Common.elevator2DoorStatus, 2)
	self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator2"),"_on_player_change_elevator_door_status"))
	pass
	
func start_elevator3_ready():
	self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator3"),"_on_player_change_elevator_door_status"))
	emit_signal("change_elevator_door_status",Common.elevator3DoorStatus, 3)
	self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator3"),"_on_player_change_elevator_door_status"))
	pass
	
func start_elevator4_ready():
	self.change_elevator_door_status.connect(Callable(get_parent().get_node("Elevator/Elevator4"),"_on_player_change_elevator_door_status"))
	emit_signal("change_elevator_door_status",Common.elevator4DoorStatus, 4)
	self.change_elevator_door_status.disconnect(Callable(get_parent().get_node("Elevator/Elevator4"),"_on_player_change_elevator_door_status"))

func _on_bedroom_terminal_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.bedroomTerminalReady = true
	pass # Replace with function body.


func _on_bedroom_terminal_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.bedroomTerminalReady = false
	pass # Replace with function body.


func _on_bedroom_desk_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.bedroomDeskReady = true
	pass # Replace with function body.


func _on_bedroom_desk_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.bedroomDeskReady = false
	pass # Replace with function body.


func _on_kui_kui_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.kuiKuiReady = true
	pass # Replace with function body.


func _on_kui_kui_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.kuiKuiReady = false
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.bedroomDoorCtrlReady = true
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.bedroomDoorCtrlReady = false
	pass # Replace with function body.



func _on_door_ctrl_bedroom_door_ctrl_input_finished():
	start_bedroom_door_ctrl_ready()
	pass # Replace with function body.


func _on_balcony_door_ctrl_area_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.balconyDoorCtrlReady = true
	pass # Replace with function body.


func _on_balcony_door_ctrl_area_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		Common.balconyDoorCtrlReady = false
	pass # Replace with function body.


func _on_door_ctrl_balcony_door_ctrl_input_finished():
	start_balcony_door_ctrl_ready()
	pass # Replace with function body.


func _on_bedroom_light_switch_area_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.bedroomLightSwitchReady = true
	pass # Replace with function body.


func _on_bedroom_light_switch_area_body_exited(body):
	if body == get_node("."):
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
	if body == get_node("."):
		dialogBubble.show()
		Common.elevatorReady = true
	pass # Replace with function body.


func _on_elevator_player_exit(body):
	if body == get_node("."):
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
	if body == get_node("."):
		dialogBubble.show()
		Common.elevator2Ready = true
	pass # Replace with function body.


func _on_elevator_2_player_exit(body):
	if body == get_node("."):
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
		gravity = 0
		set_z_index(-1)
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
		Common.inputLock = true
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
		await get_node("Timer").timeout
		get_node("CollisionShape").set_deferred("disabled",false)
		set_z_index(2)
		Common.inputLock = false
		Common.elevatorCtrlTrigger = false
		gravity = 980
	pass # Replace with function body.


func init_elevator_animation(currentFloor, targetFloor):
#	tween.tween_method(look_at.bind(Vector2.UP), Vector2(position.x, position.y), Vector2(position.x, position.y+32*4*(currentFloor-targetFloor)), 1) 
	
#	var animation = get_node("PlayerAnimation").get_animation("PlayerUpDown")
#	animation.clear()
#	var track_index = animation.add_track(Animation.TYPE_VALUE)
#	animation.track_set_path(track_index, "position:y")
#	var key1=animation.track_insert_key(track_index, 0.0, 0)
#	var key2=animation.track_insert_key(track_index, abs(currentFloor - targetFloor), 1)
#
#	animation.track_set_key_value(track_index, key1, position.y)
#	animation.track_set_key_value(track_index, key2, position.y+32*4*(currentFloor-targetFloor))
#	animation.set_length(abs(currentFloor - targetFloor))
#	print("动画长度", animation.get_length())
	pass


func _on_elevator_3_player_enter(body):
	if body == get_node("."):
		dialogBubble.show()
		Common.elevator3Ready = true
	pass # Replace with function body.


func _on_elevator_3_player_exit(body):
	if body == get_node("."):
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
	if body == get_node("."):
		dialogBubble.show()
		Common.elevator4Ready = true
	pass # Replace with function body.


func _on_elevator_4_player_exit(body):
	if body == get_node("."):
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
