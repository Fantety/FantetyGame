extends Node

var doorCardLock = load("res://asset/img/furniture/door_ctrl/door_card_lock.png")
var doorCardUnlock = load("res://asset/img/furniture/door_ctrl/door_card_unlock.png")


@export var bedroomDoorCtrlAllow = true
@export var bedroomDoorCtrlValue = 0.0
@export var balconyDoorCtrlAllow = true
@export var balconyDoorCtrlValue = 0.0

var bedReady = false
var bedroomTerminalReady = false
var bedroomDeskReady = false
var kuiKuiReady = false
var bedroomDoorCtrlReady = false
var bedroomDoorStatus = false
var balconyDoorCtrlReady = false
var balconyDoorStatus = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
