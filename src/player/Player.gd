extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -200.0
const PROGRESS_SPEED = 20

var dialogBubble
var playerView
var runSound

var inputPasswdSoundRight
var inputPasswdSoundError



var porgressBarValue = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


signal change_bedroom_door_status()
signal change_balcony_door_status()
signal bedroom_door_ctrl_pressed()
signal bedroom_door_ctrl_released()

func _ready():
	dialogBubble = preload("res://scene/component/dialog_bubble.tscn").instantiate()
	playerView = $PlayerView
	runSound = $RunSound
	add_child(dialogBubble)
	dialogBubble.set_position(playerView.position + Vector2(15,-18))
	dialogBubble.hide()
	inputPasswdSoundRight = get_parent().get_node("Sound/InputPasswdSoundRight")
	inputPasswdSoundError = get_parent().get_node("Sound/InputPasswdSoundError")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("act_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("action"):
		if Common.bedReady:
			start_bed_dialog()
		elif Common.bedroomTerminalReady:
			start_bedroom_terminal_ready()
		elif Common.bedroomDeskReady:
			start_bedroom_desk_ready()
		elif Common.kuiKuiReady:
			start_kuikui_ready()
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
	DialogueManager.show_example_dialogue_balloon(get_node("..").bedDialog, "start")
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
