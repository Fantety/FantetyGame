extends TextureRect

@onready var paperEgg = load("res://asset/img/plot/paper/paper_egg.png")
@onready var paper = load("res://asset/img/plot/paper/paper.png")
var isEgg = false

func _on_base_button_pressed():
	isEgg = !isEgg
	get_parent().get_node("AudioStreamPlayer").play()
	if isEgg:
		set_texture(paperEgg)
	else:
		set_texture(paper)
	pass # Replace with function body.


func _on_close_button_pressed():
	get_parent().get_node("AudioStreamPlayer").play()
	get_parent().queue_free()
	pass # Replace with function body.
