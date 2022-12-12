extends LineEdit



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
