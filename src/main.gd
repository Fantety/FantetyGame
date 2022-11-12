extends Node2D


@onready var paperSound = get_node("Sound/PaperSound")
@onready var bubbleSound = get_node("Sound/Bubble")
var bedpaper
# var dialogue_line = await DialogueManager.get_next_dialogue_line(bed_dialog, "start")

# Called when the node enters the scene tree for the first time.

func play_check_bed_paper_sound():
	paperSound.play()
func new_bedpaper():
	bedpaper = load("res://scene/plot/bed_paper.tscn").instantiate()
	add_child(bedpaper)
	pass

func play_bubble_sound():
	bubbleSound.play()

func remove_kuikui():
	get_node("Animation/BedroomAnimation").play("RemoveKuikui")
	pass

func _on_dead_area_body_entered(body):
	if body == get_node("Player"):
		get_tree().paused = true
		var death = load("res://scene/death.tscn").instantiate()
		add_child(death)
		pass
	pass # Replace with function body.
