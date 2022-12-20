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
		$AnimationPlayer.play("desktop_show")
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


func _on_search_line_edit_text_submitted(new_text):
	if new_text.contains("白止"):
		$Seach/Label.set_text("白止实验室\n成立于3012年,负责人余芷,主要用于研究生物技术,但是后来于3057年废弃")
		pass
	elif new_text.contains("日期"):
		$Seach/Label.set_text("当前日期\n3073年12月18日")
	elif new_text.contains("余芷"):
		$Seach/Label.set_text("余芷\n性别:女\n生物学家,白止实验室负责人\n单身\n于3058年2月离世")
	elif new_text.contains("余柒"):
		$Seach/Label.set_text("余柒\n性别:男\n白止负责人余芷的儿子\n出生于3055年5月\n于3057年12月离世\n供电室密码:984573")
	else:
		$Seach/Label.set_text("无法查询到任何相关信息或无相关访问权限")
		pass
	pass # Replace with function body.


func _on_search_close_button_pressed():
	$Seach.hide()
	$Panel2.show()
	pass # Replace with function body.


func _on_button_pressed():
	$Seach.show()
	$Panel2.hide()
	pass # Replace with function body.
