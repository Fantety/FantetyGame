extends Control

var rePos:Vector2
var backPos:Vector2
var frontPos:Vector2
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	backPos = get_node("Back").position
	frontPos = get_node("Front").position
	get_node("Timer").start()
func _process(delta):
	rePos = get_viewport().get_mouse_position() - (get_viewport_rect().size/2)
	get_node("Back").set_position(backPos-rePos/50)
	get_node("Front").set_position(frontPos-rePos/25)
	pass


func _on_start_mouse_entered():
	get_node("AnimationPlayer").stop()
	get_node("AnimationPlayer").play("ButtonStart")
	pass # Replace with function body.


func _on_exit_mouse_entered():
	get_node("AnimationPlayer").stop()
	get_node("AnimationPlayer").play("ButtonExit")
	pass # Replace with function body.


func _on_start_mouse_exited():
	get_node("AnimationPlayer").stop()
	get_node("AnimationPlayer").play_backwards("ButtonStart")
	pass # Replace with function body.


func _on_exit_mouse_exited():
	get_node("AnimationPlayer").stop()
	get_node("AnimationPlayer").play_backwards("ButtonExit")
	pass # Replace with function body.


func _on_timer_timeout():
	await get_node("ThunderAnimation").play("Thunder")
	get_node("Timer2").start()
	pass # Replace with function body.


func _on_timer_2_timeout():
	get_node("ThunderSound").play()
	pass # Replace with function body.


func _on_start_pressed():
	ChangeScene.change_scene("res://scene/main.tscn")
	pass # Replace with function body.
