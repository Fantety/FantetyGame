extends Control

signal elevator_floor_selected(index)

func _on_item_list_item_selected(index):
	if index == 0:
		emit_signal("elevator_floor_selected",3)
	elif index == 1:
		emit_signal("elevator_floor_selected",2)
	elif index == 2:
		emit_signal("elevator_floor_selected",1)
	elif index == 3:
		emit_signal("elevator_floor_selected",0)
	Common.select = true
	pass # Replace with function body.
