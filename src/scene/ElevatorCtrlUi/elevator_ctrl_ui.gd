extends Control

signal elevator_floor_selected(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_selected(index):
	emit_signal("elevator_floor_selected",index)
	pass # Replace with function body.
