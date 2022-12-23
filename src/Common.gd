extends Node

const ELEVATOR_SPEED = 200

enum accessCardLevels{LEVEL1 = 0, LEVEL2, LEVEL3, LEVEL4, LEVEL5, LEVEL6}

var inputLock = false

@onready var bedDialog = load("res://dialog/bedroom/bed.dialogue")
@onready var bedDialogEgg = load("res://dialog/bedroom/bed_eggs.dialogue")
@onready var kuikuiDialog = load("res://dialog/bedroom/kuikui.dialogue")
@onready var bedroomComputerDialog = load("res://dialog/bedroom/computer.dialogue")
@onready var bedroomDeskDialog = load("res://dialog/bedroom/bedroom_desk.dialogue")
@onready var bedroomClosetDialog = load("res://dialog/bedroom/closet.dialogue")
@onready var bedroomHealthDialog = load("res://dialog/bedroom/bedroom_heath.dialogue")
@onready var bedroomOutSofaDialog = load("res://dialog/bedroom/bedroom_out_sofa.dialogue")
@onready var powerroomWiringDialog = load("res://dialog/powerroom/powerroom_wiring_plot.dialogue")
@onready var powerroomCtrlDialog = load("res://dialog/powerroom/powerroom_ctrl_plot.dialogue")
@onready var powerroomCardDialog = load("res://dialog/powerroom/powerroom_card_plot.dialogue")
@onready var medicalDialog = load("res://dialog/medical/medical_plot.dialogue")

var doorCardLock = load("res://asset/img/furniture/door_ctrl/door_card_lock.png")
var doorCardUnlock = load("res://asset/img/furniture/door_ctrl/door_card_unlock.png")

var bedroomSwitch1Status = true
var bedroomSwitch2Status = true
var bedroomSwitch3Status = true
var bedroomSwitch4Status = true

@export var bedroomDoorCtrlAllow = true
@export var balconyDoorCtrlAllow = true
@export var greenhouseDoorCtrlAllow = true
@export var medicalDoorCtrlAllow = true
@export var powerRoomDoorCtrlAllow = true
@export var dataRoomDoorCtrlAllow = true
@export var fantetyLabDoorCtrlAllow = true

var bedReady = false
var bedroomTerminalReady = false
var bedroomDeskReady = false
var kuiKuiReady = false
var bedroomLightSwitchReady = false
var bedroomComputerReady = false
var wardrobeReady = false
var VendingMachineReady = false
var bedroomOutSofaReady = false
var powerRoomWiringReady = false
var powerRoomCardReady = false
var medicalPlotReady = false

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
var powerRoomDoorCtrlReady = false
var powerRoomDoorStatus = false
var dataRoomDoorCtrlReady = false
var dataRoomDoorStatus = false
var fantetyLabDoorCtrlReady = false
var fantetyLabDoorStatus = false
# Called when the node enters the scene tree for the first time.


var balconyPlot = false
var floorLampReady = false
var currentFloorLamp:String = "none"
var currentArriveRoom:String = "none"


var powerRoomTerminalReady = false
var powerRoomWiringStatue = false
var ePower = false


func show_tips(text, audio):
	var tips = load("res://scene/tips.tscn").instantiate()
	get_tree().get_root().add_child(tips)
	tips.show_tip(text, audio)

