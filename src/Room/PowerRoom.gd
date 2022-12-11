extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var lights = $PowerRoomLight.get_children()
	for light in lights:
		light.set_enabled(false)
	$ChargeMechine/Lights/PointLight2D.set_enabled(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Common.powerRoomTerminalReady:
		if Input.is_action_just_pressed("action"):
			charge_machine_start_charge()
	pass


signal charge_machine_finish_charge
func charge_machine_start_charge():
	$ChargeMechine/Lights/PointLight2D.set_enabled(true)
	$ChargeMechine/AnimationPlayer.play("default")
	$ChargeMechine/ElectricSoundEffect.play()
	await $ChargeMechine/ElectricSoundEffect.finished
	emit_signal("charge_machine_finish_charge")
	pass


func _on_charge_machine_finish_charge():
	$LightChargeSound.play()
	var lights = $PowerRoomLight.get_children()
	for light in lights:
		light.set_enabled(true)
	pass # Replace with function body.
