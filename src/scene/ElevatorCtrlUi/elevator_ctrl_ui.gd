extends Control

signal elevator_floor_selected(index)

func _on_item_list_item_selected(index):
	emit_signal("elevator_floor_selected",index)
	pass # Replace with function body.
