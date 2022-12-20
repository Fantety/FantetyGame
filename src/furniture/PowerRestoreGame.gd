extends CanvasLayer


func _ready():
	$TextureProgressBar.set_value(50)
	Common.inputLock = true
	self.charge_opt_success.connect(Callable(get_parent(),"charge_machine_start_charge"))
	$ChargeSound.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$TextureProgressBar.set_value($TextureProgressBar.get_value()-1)
	if Input.is_action_just_pressed("act_jump"):
		$TextureProgressBar.set_value($TextureProgressBar.get_value()+10)
	pass


signal charge_opt_success
func _on_texture_progress_bar_value_changed(value):
	if value == 0:
		$ChargeSound.stop()
		$ChargeFailSound.play()
		await $ChargeFailSound.finished
		Common.inputLock = false
		queue_free()
	elif value >= 100:
		emit_signal("charge_opt_success")
		Common.inputLock = false
		queue_free()
	pass # Replace with function body.


func _on_charge_sound_finished():
	$ChargeSound.play()
	pass # Replace with function body.
