extends Node

@onready var bedDialog = load("res://dialog/bedroom/bed.dialogue")
@onready var bedDialogEgg = load("res://dialog/bedroom/bed_eggs.dialogue")
@onready var kuikuiDialog = load("res://dialog/bedroom/kuikui.dialogue")

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

var bedReady = false
var bedroomTerminalReady = false
var bedroomDeskReady = false
var kuiKuiReady = false
var bedroomLightSwitchReady = false

var bedroomDoorCtrlReady = false
var bedroomDoorStatus = false
var balconyDoorCtrlReady = false
var balconyDoorStatus = false
# Called when the node enters the scene tree for the first time.

