extends CanvasLayer

func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func change_scene(scene:String):
	get_node("ColorRect").show()
	get_node("AnimationPlayer").play("ChangeScene")
	await get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file(scene)
	get_node("AnimationPlayer").play_backwards("ChangeScene")
	await get_node("AnimationPlayer").animation_finished
	get_node("ColorRect").hide()
	pass
