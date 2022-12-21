extends Button


var selfPos:Vector2
var selfValue:int


func _ready():
	pass


func _on_gui_input(event):
	if event == InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if selfValue == 0:
				selfValue = get_parent().currentValue
			else:
				selfValue = 0
			if selfValue == 0:
				#set_button_icon(white)
				pass
			elif selfValue == 1:
				#set_button_icon(orange)
				pass
			elif selfValue == 2:
				#set_button_icon(green)
				pass
			elif selfValue == 3:
				#set_button_icon(blue)
				pass
			pass
		pass
	pass # Replace with function body.


func _on_mouse_entered():
	#set_button_icon(grey)
	pass # Replace with function body.


func _on_mouse_exited():
	#set_button_icon(white)
	pass # Replace with function body.
