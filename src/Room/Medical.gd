extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var lights = $MedicvalLight.get_children()
	for light in lights:
		light.set_enabled(false)
	pass # Replace with function body.


