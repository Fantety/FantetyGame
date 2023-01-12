extends Node2D

const SPEED_FRONT = 0.8
const SPEED_BACK = 0.4
#
var backgroundMove = false
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
var moved = true
func _physics_process(_delta):
	if backgroundMove and !Common.inputLock and moved:
		var direction = Input.get_axis("act_left", "act_right")
		if direction:
			get_node("Back").set_position(get_node("Back").position+Vector2(-direction*SPEED_BACK,0))
			get_node("Front").set_position(get_node("Front").position+Vector2(-direction*SPEED_FRONT,0))
#	pass
#
#
func _on_balcony_area_body_entered(body):
	if body == get_parent().get_node("Player"):
		backgroundMove = true
#
#
func _on_balcony_area_body_exited(body):
	if body == get_parent().get_node("Player"):
		backgroundMove = false


func _on_back_stop_area_body_entered(body):
	if body.name == "Player":
		moved = false
	pass # Replace with function body.


func _on_back_stop_area_body_exited(body):
	if body.name == "Player":
		moved = true
	pass # Replace with function body.
