extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -200.0

var dialogBubble
var playerView
var runSound

var bedReady = false
var bedroomTerminalReady = false
var bedroomDeskReady = false
var kuiKuiReady = false
var bedroomDoorCtrlReady = false
@export var reBedroomDoorCtrl = true


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


signal change_bedroom_door_status()


func _ready():
	dialogBubble = preload("res://scene/component/dialog_bubble.tscn").instantiate()
	playerView = $PlayerView
	runSound = $RunSound
	add_child(dialogBubble)
	dialogBubble.set_position(playerView.position + Vector2(15,-18))
	dialogBubble.hide()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("act_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("action"):
		if bedReady:
			start_bed_dialog()
		elif bedroomTerminalReady:
			start_bedroom_terminal_ready()
		elif bedroomDeskReady:
			start_bedroom_desk_ready()
		elif kuiKuiReady:
			start_kuikui_ready()
		elif bedroomDoorCtrlReady and reBedroomDoorCtrl:
			start_bedroom_door_ctrl_ready()
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
		bedReady = true
	pass # Replace with function body.


func _on_bed_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		bedReady = false
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

func _on_bedroom_terminal_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		bedroomTerminalReady = true
	pass # Replace with function body.


func _on_bedroom_terminal_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		bedroomTerminalReady = false
	pass # Replace with function body.


func _on_bedroom_desk_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		bedroomDeskReady = true
	pass # Replace with function body.


func _on_bedroom_desk_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		bedroomDeskReady = false
	pass # Replace with function body.


func _on_kui_kui_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		kuiKuiReady = true
	pass # Replace with function body.


func _on_kui_kui_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		kuiKuiReady = false
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_entered(body):
	if body == get_node("."):
		dialogBubble.show()
		bedroomDoorCtrlReady = true
	pass # Replace with function body.


func _on_bedroom_door_ctrl_body_exited(body):
	if body == get_node("."):
		dialogBubble.hide()
		bedroomDoorCtrlReady = false
	pass # Replace with function body.

