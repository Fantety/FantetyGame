extends AnimatedSprite2D


var doorCtrlInnerReady = false
var needLevel
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	set_frame(1)
	if get_parent().name == "Bedroom":
		needLevel = Common.accessCardLevels.LEVEL1

signal door_ctrl_inner_name(name:String)
func _process(delta):
	if doorCtrlInnerReady:
		if Input.is_action_just_pressed("action"):
			if Backpack.playerLevel >= needLevel:
				emit_signal("door_ctrl_inner_name",self.name)
			else:
				Common.show_tips("权限不足", true)
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
