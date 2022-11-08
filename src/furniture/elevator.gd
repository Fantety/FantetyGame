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
	if self.name == "Elevator":
		if Common.elevatorDoorStatus:
			elevatorAnimation.play_backwards("OpenElevatorDoor")
			elevatorSound.play()
			await elevatorAnimation.animation_finished
			Common.elevatorDoorStatus = false
			set_elevator_light_status(false)
	elif self.name == "Elevator2":
		if Common.elevator2DoorStatus:
			elevatorAnimation.play_backwards("OpenElevatorDoor")
			elevatorSound.play()
			await elevatorAnimation.animation_finished
			Common.elevator2DoorStatus = false
			set_elevator_light_status(false)
	elif self.name == "Elevator3":
		if Common.elevator3DoorStatus:
			elevatorAnimation.play_backwards("OpenElevatorDoor")
			elevatorSound.play()
			await elevatorAnimation.animation_finished
			Common.elevator3DoorStatus = false
			set_elevator_light_status(false)
	elif self.name == "Elevator4":
		if Common.elevator4DoorStatus:
			elevatorAnimation.play_backwards("OpenElevatorDoor")
			elevatorSound.play()
			await elevatorAnimation.animation_finished
			Common.elevator4DoorStatus = false
			set_elevator_light_status(false)
	
	pass # Replace with function body.


func _on_player_change_elevator_door_status(status, index):
	if status and !Common.elevatorCtrlTrigger:
		emit_signal("change_elevator_ctrl_status")
	else:
		Common.inputLock = true
		if status:			
			elevatorAnimation.play_backwards("OpenElevatorDoor")
		else:
			elevatorAnimation.play("OpenElevatorDoor")
		elevatorSound.play()
		set_elevator_light_status(true)
		await elevatorAnimation.animation_finished
		Common.inputLock = false
		if index == 1:
			Common.elevatorDoorStatus = !Common.elevatorDoorStatus
		elif index == 2:
			Common.elevator2DoorStatus = !Common.elevator2DoorStatus
		elif index == 3:
			Common.elevator3DoorStatus = !Common.elevator3DoorStatus
		elif index == 4:
			Common.elevator4DoorStatus = !Common.elevator4DoorStatus
	pass # Replace with function body.
