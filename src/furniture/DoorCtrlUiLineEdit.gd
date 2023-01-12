extends LineEdit



func _physics_process(delta):
	if Common.doorCtrlUiShow:
		if Input.is_action_just_pressed("num_one"):
			insert_text_at_caret("1")
		elif Input.is_action_just_pressed("num_two"):
			insert_text_at_caret("2")
		elif Input.is_action_just_pressed("num_three"):
			insert_text_at_caret("3")
		elif Input.is_action_just_pressed("num_four"):
			insert_text_at_caret("4")
		elif Input.is_action_just_pressed("num_five"):
			insert_text_at_caret("5")
		elif Input.is_action_just_pressed("num_six"):
			insert_text_at_caret("6")
		elif Input.is_action_just_pressed("num_seven"):
			insert_text_at_caret("7")
		elif Input.is_action_just_pressed("num_eight"):
			insert_text_at_caret("8")
		elif Input.is_action_just_pressed("num_nine"):
			insert_text_at_caret("9")
		elif Input.is_action_just_pressed("num_zero"):
			insert_text_at_caret("0")
	pass



func _on_button_1_pressed():
	insert_text_at_caret("1")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_2_pressed():
	insert_text_at_caret("2")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_3_pressed():
	insert_text_at_caret("3")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_4_pressed():
	insert_text_at_caret("4")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_5_pressed():
	insert_text_at_caret("5")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_6_pressed():
	insert_text_at_caret("6")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_7_pressed():
	insert_text_at_caret("7")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_8_pressed():
	insert_text_at_caret("8")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_9_pressed():
	insert_text_at_caret("9")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_delete_pressed():
	delete_char_at_caret()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_button_zero_pressed():
	insert_text_at_caret("0")
	$AudioStreamPlayer.play()
	pass # Replace with function body.

signal door_ctrl_ok_button_pressed
func _on_button_ok_pressed():
	$AudioStreamPlayer.play()
	emit_signal("door_ctrl_ok_button_pressed")
	pass # Replace with function body.
