extends Node2D

@onready var lightList = $GreenHouseLight.get_children()

func _ready():
	for light in lightList:
		light.set_enabled(false)
	pass

func change_green_house_room_light(status:bool):
	for light in lightList:
		light.set_enabled(status)
	pass


func _on_green_house_light_switch_change_light_statue(roomName,status):
	if roomName == "GreenHouseLightSwitch":
		change_green_house_room_light(status)
		pass
	pass # Replace with function body.
