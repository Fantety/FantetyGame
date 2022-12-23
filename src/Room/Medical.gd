extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var lights = $MedicvalLight.get_children()
	for light in lights:
		light.set_enabled(false)
	pass # Replace with function body.




func _on_medical_light_switch_change_light_statue(roomName, status):
	if roomName == "MedicalLightSwitch":
		var lights = $MedicvalLight.get_children()
		for light in lights:
			light.set_enabled(status)
	pass # Replace with function body.


func _on_power_room_charge_machine_finish_charge():
	$MedicalDoorCtrl/PointLight2D.set_enabled(true)
	pass # Replace with function body.
