extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	ChangeScene.change_scene("res://scene/info_scene.tscn")
	pass # Replace with function body.
