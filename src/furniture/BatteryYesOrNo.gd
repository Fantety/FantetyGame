extends CanvasLayer


func _ready():
	self.battery_use_yes.connect(Callable(get_parent(),"set_battery_used"))
	pass

signal battery_use_yes
func _on_button_pressed():
	emit_signal("battery_use_yes")
	pass # Replace with function body.

func _on_button_2_pressed():
	self.battery_use_yes.disconnect(Callable(get_parent(),"set_battery_used"))
	queue_free()
	pass # Replace with function body.
