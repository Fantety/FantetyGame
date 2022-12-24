extends CanvasLayer

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if visible:
			set_visible(false)

func _ready():
	$Panel/TextureProgressBar.hide()
	$Panel2.hide()
	$Panel.hide()
	$Panel.show()
	$TextFile.hide()
	$AnimationPlayer.play("show")
	pass

func _on_line_edit_text_submitted(new_text):
	if new_text == "220323":
		$Panel/TextureProgressBar.show()
		$AnimationPlayer.play("login_progress")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play_backwards("show")
		await $AnimationPlayer.animation_finished
		$Panel2.show()
		pass
	else:
		$AnimationPlayer.play("passwd_error")
	pass # Replace with function body.


func _on_line_edit_text_changed(new_text):
	$InputEffect.play()
	pass # Replace with function body.


func _on_text_file_close_button_pressed():
	$TextFile.hide()
	$Panel2.show()
	pass # Replace with function body.


func _on_button_4_pressed():
	$Panel2.hide()
	$TextFile.show()
	pass # Replace with function body.


