extends CanvasLayer

func _ready():
	get_tree().paused = true

func _on_exit_pressed():
	ChangeScene.change_scene("res://scene/start_game_ui.tscn")
	queue_free()
	pass # Replace with function body.


func _on_continue_pressed():
	get_tree().paused = false
	queue_free()
	pass # Replace with function body.
