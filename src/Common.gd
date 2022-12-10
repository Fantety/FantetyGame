extends Node

const ELEVATOR_SPEED = 200

enum accessCardLevels{LEVEL1 = 0, LEVEL2, LEVEL3, LEVEL4, LEVEL5, LEVEL6}

var inputLock = false

@onready var bedDialog = load("res://dialog/bedroom/bed.dialogue")
@onready var bedDialogEgg = load("res://dialog/bedroom/bed_eggs.dialogue")
@onready var kuikuiDialog = load("res://dialog/bedroom/kuikui.dialogue")
@onready var bedroomComputerDialog = load("res://dialog/bedroom/computer.dialogue")

var doorCardLock = load("res://asset/img/furniture/door_ctrl/door_card_lock.png")
var doorCardUnlock = load("res://asset/img/furniture/door_ctrl/door_card_unlock.png")

var bedroomSwitch1Status = true
var bedroomSwitch2Status = true
var bedroomSwitch3Status = true
var bedroomSwitch4Status = true

@export var bedroomDoorCtrlAllow = true
@export var bedroomDoorCtrlValue = 0.0
@export var balconyDoorCtrlAllow = true
@export var balconyDoorCtrlValue = 0.0
@export var greenhouseDoorCtrlAllow = true
@export var greenhouseDoorCtrlValue = 0.0
@export var medicalDoorCtrlAllow = true
@export var medicalDoorCtrlValue = 0.0

var bedReady = false
var bedroomTerminalReady = false
var bedroomDeskReady = false
var kuiKuiReady = false
var bedroomLightSwitchReady = false
var bedroomComputerReady = false
var wardrobeReady = false
var VendingMachineReady = false

var elevatorCtrlTrigger = false

var elevatorReady = false
var elevatorDoorStatus = false
var elecatorCtrlStatus = false

var elevator2Ready = false
var elevator2DoorStatus = false
var elecator2CtrlStatus = false

var elevator3Ready = false
var elevator3DoorStatus = false
var elecator3CtrlStatus = false

var elevator4Ready = false
var elevator4DoorStatus = false
var elecator4CtrlStatus = false

var bedroomDoorCtrlReady = false
var bedroomDoorStatus = false
var balconyDoorCtrlReady = false
var balconyDoorStatus = false
var greenhouseDoorCtrlReady = false
var greenhouseDoorStatus = false
var medicalDoorCtrlReady = false
var medicalDoorStatus = false
# Called when the node enters the scene tree for the first time.


var balconyPlot = false
var floorLampReady = false
var currentFloorLamp:String = "none"
var currentArriveRoom:String = "none"


func show_tips(text, audio):
	var tips = load("res://scene/tips.tscn").instantiate()
	add_child(tips)
	tips.show_tip(text, audio)

