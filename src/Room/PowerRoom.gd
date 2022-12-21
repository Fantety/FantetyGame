extends Node2D


signal shake_camera
var isShake = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.shake_camera.connect(Callable(get_parent().get_node("Player/Camera"),"_on_Main_sig_bad"))
	var lights = $PowerRoomLight.get_children()
	for light in lights:
		light.set_enabled(false)
	$ChargeMechine/Lights/PointLight2D.set_enabled(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Common.powerRoomTerminalReady && !Common.ePower:
		if Input.is_action_just_pressed("action"):
			start_charge_game()
	if isShake:
		emit_signal("shake_camera")
	pass



func start_charge_game():
	var chargeGame = load("res://scene/component/power_restore_game.tscn").instantiate()
	add_child(chargeGame)

signal charge_machine_finish_charge
func charge_machine_start_charge():
	isShake = true
	$ChargeMechine/Lights/PointLight2D.set_enabled(true)
	$ChargeMechine/AnimationPlayer.play("default")
	$ChargeMechine/ElectricSoundEffect.play()
	await $ChargeMechine/ElectricSoundEffect.finished
	isShake = false
	emit_signal("charge_machine_finish_charge")
	pass


func _on_charge_machine_finish_charge():
	Common.ePower = true
	$LightChargeSound.play()
	var lights = $PowerRoomLight.get_children()
	for light in lights:
		light.set_enabled(true)
	pass # Replace with function body.
