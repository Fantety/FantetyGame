extends Node2D


@onready var paperSound = get_node("Sound/PaperSound")

# var dialogue_line = await DialogueManager.get_next_dialogue_line(bed_dialog, "start")

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func play_check_bed_paper_sound():
	paperSound.play()

func remove_kuikui():
	get_node("Animation/BedroomAnimation").play("RemoveKuikui")
	pass
	
func hug_kuikui():
	get_node("KuiKui").set_position(get_node("Player").position+Vector2(0,-30))
	pass



func _on_dead_area_body_entered(body):
	if body == get_node("Player"):
		get_tree().paused = true
		var death = load("res://scene/death.tscn").instantiate()
		add_child(death)
		pass
	pass # Replace with function body.
