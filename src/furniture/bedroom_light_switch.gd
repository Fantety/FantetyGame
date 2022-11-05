extends Node

@onready var switchLightSound = get_parent().get_parent().get_node("Sound/LightSwitchSound")

@onready var bedroomLight1 = get_parent().get_node("BedroomLight/TopLight")
@onready var bedroomLight2 = get_parent().get_node("BedroomLight/TopLight2")
@onready var bedroomLight3 = get_parent().get_node("BedroomLight/TopLight3")
@onready var bedroomLight4 = get_parent().get_node("BedroomLight/TopLight4")

func _on_player_change_bedroom_light_status(num):
	switchLightSound.play()
	if num == 1:
		if Common.bedroomSwitch1Status:
			get_node("Switch1").color= Color(1, 0, 0, 1) 
		else:
			get_node("Switch1").color= Color(0, 1, 0, 1)
		bedroomLight1.set_visible(!Common.bedroomSwitch1Status)
		Common.bedroomSwitch1Status = !Common.bedroomSwitch1Status
	elif num == 2:
		if Common.bedroomSwitch2Status:
			get_node("Switch2").color= Color(1, 0, 0, 1) 
		else:
			get_node("Switch2").color= Color(0, 1, 0, 1)
		bedroomLight2.set_visible(!Common.bedroomSwitch2Status)
		Common.bedroomSwitch2Status = !Common.bedroomSwitch2Status
	elif num == 3:
		if Common.bedroomSwitch3Status:
			get_node("Switch3").color= Color(1, 0, 0, 1) 
		else:
			get_node("Switch3").color= Color(0, 1, 0, 1)
		bedroomLight3.set_visible(!Common.bedroomSwitch3Status)
		Common.bedroomSwitch3Status = !Common.bedroomSwitch3Status
	elif num == 4:
		if Common.bedroomSwitch4Status:
			get_node("Switch4").color= Color(1, 0, 0, 1) 
		else:
			get_node("Switch4").color= Color(0, 1, 0, 1)
		bedroomLight4.set_visible(!Common.bedroomSwitch4Status)
		Common.bedroomSwitch4Status = !Common.bedroomSwitch4Status
	pass # Replace with function body.
