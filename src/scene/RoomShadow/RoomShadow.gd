extends TextureRect


func _ready():
	if get_parent().name == "BedroomShadowArea":
		$AnimationPlayer.play("default")

func _on_bedroom_shadow_area_body_entered(body):
	if body.name == "Player" and get_parent().name == "BedroomShadowArea":
		$AnimationPlayer.play("default")
	pass # Replace with function body.


func _on_bedroom_shadow_area_body_exited(body):
	if body.name == "Player" and get_parent().name == "BedroomShadowArea":
		$AnimationPlayer.play_backwards("default")
	pass # Replace with function body.


func _on_bedroom_out_shadow_area_body_entered(body):
	if body.name == "Player" and get_parent().name == "BedroomOutShadowArea":
		$AnimationPlayer.play("default")
	pass # Replace with function body.


func _on_bedroom_out_shadow_area_body_exited(body):
	if body.name == "Player" and get_parent().name == "BedroomOutShadowArea":
		$AnimationPlayer.play_backwards("default")
	pass # Replace with function body.
