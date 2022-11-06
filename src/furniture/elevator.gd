extends Node2D


@onready var elevatorDoorLeft = $ElevatorDoorLeft
@onready var elevatorDoorRight = $ElevatorDoorRight
@onready var elevatorAnimation = $ElevatorAnimation
@onready var elevatorInnerLight1 = $ElevatorInner/PointLight2D
@onready var elevatorInnerLight2 = $ElevatorInner/PointLight2D2
@onready var elevatorInnerLight3 = $ElevatorInner/PointLight2D3
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
	elevatorAnimation.play_backwards("OpenElevatorDoor")
	Common.elevatorDoorStatus = false
	await elevatorAnimation.animation_finished
	set_elevator_light_status(false)
	pass # Replace with function body.


func _on_player_change_elevator_door_status(status):
	if status:
		emit_signal("change_elevator_ctrl_status")
	else:
		elevatorAnimation.play("OpenElevatorDoor")
		set_elevator_light_status(true)
		Common.elevatorDoorStatus = !Common.elevatorDoorStatus
	pass # Replace with function body.
