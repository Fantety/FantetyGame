extends Control



func _on_animation_player_animation_finished(anim_name):
	get_node("Timer").start()
	pass # Replace with function body.


func _on_timer_timeout():
	ChangeScene.change_scene("res://scene/start_game_ui.tscn")
	pass # Replace with function body.
