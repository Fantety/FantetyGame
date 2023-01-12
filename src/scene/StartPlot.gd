extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("我这是怎么了")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("要不再躺会吧")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("Z Z Z Z Z")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("睡了多久了")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("不能再睡下去了")
	$AnimationPlayer.play_backwards("default")
	await $AnimationPlayer.animation_finished
	ChangeScene.change_scene("res://scene/main.tscn")
	pass # Replace with function body.

