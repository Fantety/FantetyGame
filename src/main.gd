extends Node2D


var paperSound
@export var bedDialog = load("res://dialog/bedroom/bed.dialogue")
@export var kuikuiDialog = load("res://dialog/bedroom/kuikui.dialogue")
# var dialogue_line = await DialogueManager.get_next_dialogue_line(bed_dialog, "start")

# Called when the node enters the scene tree for the first time.
func _ready():
	paperSound = get_node("Sound/PaperSound")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func play_check_bed_paper_sound():
	paperSound.play()
