extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var lights = $FantetyLabLight.get_children()
	for light in lights:
		light.set_enabled(false)
	lights = $TerminalLight.get_children()
	for light in lights:
		light.set_enabled(false)
	pass # Replace with function body.




func _on_power_room_charge_machine_finish_charge():
	$FantetyLabDoorCtrl/PointLight2D.set_enabled(true)
	pass # Replace with function body.
