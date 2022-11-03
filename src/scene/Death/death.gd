extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("Font")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()
		get_tree().paused = false
	pass
