extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("要不再躺一会吧")
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
	$Label.set_text("不知道又躺了多久了")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("不过怎么好像什么都不记得了")
	$AnimationPlayer.play_backwards("default")
	$Timer.start()
	await $Timer.timeout
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	$Label.set_text("不管了，先起来吧")
	$AnimationPlayer.play_backwards("default")
	pass # Replace with function body.

