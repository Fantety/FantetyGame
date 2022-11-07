extends Node


@onready var elevator4 = $Elevator4/ElevatorAnimation
@onready var elevator3 = $Elevator3/ElevatorAnimation
@onready var elevator2 = $Elevator2/ElevatorAnimation
@onready var elevator1 = $Elevator1/ElevatorAnimation


func _on_elevator_4_elevator_animation_ctrl():
	elevator4.play("OpenElevatorDoor")
	pass # Replace with function body.


func _on_elevator_3_elevator_animation_ctrl():
	elevator3.play("OpenElevatorDoor")
	pass # Replace with function body.
