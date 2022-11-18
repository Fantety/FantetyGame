extends CanvasLayer

	
func show_tip(text:String, audio:bool):
	get_node("Label").set_text(text)
	if audio:
		get_node("AudioStreamPlayer").play()
	get_node("Label").set_visible(true)
	get_node("Timer").start()
	await get_node("Timer").timeout
	get_node("AnimationPlayer").play("tips")
	await get_node("AnimationPlayer").animation_finished
	queue_free()
	pass
