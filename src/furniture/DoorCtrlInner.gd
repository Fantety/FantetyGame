extends AnimatedSprite2D


var doorCtrlInnerReady = false
var needLevel
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	if get_parent().name == "Bedroom":
		needLevel = Common.accessCardLevels.LEVEL1

signal door_ctrl_inner_name(name:String)
signal door_ctrl_inner_lock
func _process(delta):
	if doorCtrlInnerReady:
		if Input.is_action_just_pressed("action"):
			if Backpack.playerLevel >= needLevel:
				emit_signal("door_ctrl_inner_name",get_parent().name)
			else:
				emit_signal("door_ctrl_inner_lock")
			pass
	pass

signal door_ctrl_inner_entered
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		doorCtrlInnerReady = true
		emit_signal("door_ctrl_inner_entered")
		pass
	pass # Replace with function body.

signal door_ctrl_inner_exited
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		doorCtrlInnerReady = false
		emit_signal("door_ctrl_inner_exited")
		pass
	pass # Replace with function body.
