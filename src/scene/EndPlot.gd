extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("也许并没有")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("或许很短")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("但是我希望")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("还有未来")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("谢谢")
	$AnimationPlayer.play_backwards("default")
	await $AnimationPlayer.animation_finished
	ChangeScene.change_scene("res://scene/start_game_ui.tscn")
	pass # Replace with function body.

