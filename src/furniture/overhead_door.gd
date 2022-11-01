extends Node2D

var doorCtrlError = load("res://asset/img/furniture/door_ctrl/door_ctrl_error.png")
var doorCtrlRight = load("res://asset/img/furniture/door_ctrl/door_ctrl_right.png")

var doorStatus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_change_bedroom_door_status():
	doorStatus = !doorStatus
	if doorStatus:
		get_parent().get_parent().get_node("Player").reBedroomDoorCtrl = false
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(doorCtrlRight)
		get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightRed").set_enabled(false)
		get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightGreen").set_enabled(true)
		
		await get_parent().get_parent().get_node("Sound/TerminalUi").play()
			
		get_node("AnimatedSprite2D").play("open")
		get_node("AnimationPlayer").play("open")
		get_parent().get_parent().get_node("Sound/DoorSound").play()
	else:
		get_parent().get_parent().get_node("Player").reBedroomDoorCtrl = false
		get_parent().get_node("DoorCtrl/Sprite2D").set_texture(doorCtrlError)
		get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightRed").set_enabled(true)
		get_parent().get_node("BedroomLight/DoorCtrlLight/SignLightGreen").set_enabled(false)
		
		await get_parent().get_parent().get_node("Sound/TerminalUi").play()
		
		get_node("AnimatedSprite2D").play("close")
		get_node("AnimationPlayer").play("close")
		get_parent().get_parent().get_node("Sound/DoorSound").play()
	pass # Replace with function body.


func _stop_animation():
	
	pass
