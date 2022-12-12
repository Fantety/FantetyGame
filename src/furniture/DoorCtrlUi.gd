extends CanvasLayer

func _ready():
	set_visible(false)
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") && visible == true:
		door_ctrl_ui_hide()
	pass

signal door_ctrl_ui_input_finished(parentName:String, passward)
func _on_line_edit_door_ctrl_ok_button_pressed():
	emit_signal("door_ctrl_ui_input_finished",get_parent().name, $Panel/VBoxContainer/LineEdit.get_text())
	pass # Replace with function body.

func door_ctrl_ui_show():
	set_visible(true)
	$AnimationPlayer.play("default")
	
func door_ctrl_ui_hide():
	$AnimationPlayer.play_backwards("default")
	await $AnimationPlayer.animation_finished
	set_visible(false)