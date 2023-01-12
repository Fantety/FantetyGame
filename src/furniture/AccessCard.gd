extends CanvasLayer


func _on_main_signal_get_access_card_level_2():
	$AnimatedSprite2D.set_frame(Common.accessCardLevels.LEVEL2)
	pass # Replace with function body.


func _on_main_signal_get_access_card_level_3():
	$AnimatedSprite2D.set_frame(Common.accessCardLevels.LEVEL3)
	pass # Replace with function body.

signal show_card3_info
func _on_button_pressed():
	if $AnimatedSprite2D.get_frame() == 2:
		emit_signal("show_card3_info")
	pass # Replace with function body.
