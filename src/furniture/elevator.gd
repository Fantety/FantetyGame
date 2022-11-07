extends Node2D


@onready var elevatorDoorLeft = $ElevatorDoorLeft
@onready var elevatorDoorRight = $ElevatorDoorRight
@onready var elevatorAnimation = $ElevatorAnimation
@onready var elevatorInnerLight1 = $ElevatorInner/PointLight2D
@onready var elevatorInnerLight2 = $ElevatorInner/PointLight2D2
@onready var elevatorInnerLight3 = $ElevatorInner/PointLight2D3
@onready var elevatorSound = $AudioStreamPlayer
signal player_enter(body)
signal player_exit(body)
signal change_elevator_ctrl_status

func set_elevtor_door_index(index):
	elevatorDoorLeft.z_index = index
	elevatorDoorRight.z_index = index
	
func set_elevator_light_status(status):
	elevatorInnerLight1.enabled = status
	elevatorInnerLight2.enabled = status
	elevatorInnerLight3.enabled = status

func _ready():
	set_elevtor_door_index(0)
	set_elevator_light_status(false)
	pass
# Called when the node enters the scene tree for the first time.
func _on_area_2d_body_entered(body):
	emit_signal("player_enter",body)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	emit_signal("player_exit",body)
	if Common.elevatorDoorStatus:
		elevatorAnimation.play_backwards("OpenElevatorDoor")
		elevatorSound.play()
	elif Common.elevator2DoorStatus:
		elevatorAnimation.play_backwards("OpenElevatorDoor")
		elevatorSound.play()
	if self.name == "Elevator":
		Common.elevatorDoorStatus = false
	elif self.name == "Elevator2":
		Common.elevator2DoorStatus = false
	await elevatorAnimation.animation_finished
	set_elevator_light_status(false)
	pass # Replace with function body.


func _on_player_change_elevator_door_status(status, index):
	if status:
		emit_signal("change_elevator_ctrl_status")
	else:
		elevatorAnimation.play("OpenElevatorDoor")
		elevatorSound.play()
		set_elevator_light_status(true)
		if index == 1:
			Common.elevatorDoorStatus = !Common.elevatorDoorStatus
		elif index == 2:
			Common.elevator2DoorStatus = !Common.elevator2DoorStatus
	pass # Replace with function body.
