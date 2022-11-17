extends AnimatableBody2D

@onready var balconyDialog = load("res://dialog/balcony/balcony_plot.dialogue")
func turn_around(turn:bool):
	get_node("AnimatedSprite2D").set_flip_h(turn)
	pass


func _on_player_balcony_plot_player_arrived():
	turn_around(false)
	get_node("Timer").start()
	await get_node("Timer").timeout
	DialogueManager.show_example_dialogue_balloon(balconyDialog, "start")
	pass # Replace with function body.
