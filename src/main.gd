extends Node2D


@onready var paperSound = get_node("Sound/PaperSound")
@onready var bubbleSound = get_node("Sound/Bubble")
var tips
var bedpaper
# var dialogue_line = await DialogueManager.get_next_dialogue_line(bed_dialog, "start")

# Called when the node enters the scene tree for the first time.
func _ready():
	$BackPack/FlashLight.hide()
	$BackPack/AccessCard.hide()
	$BackPack/Battery.hide()
	var greenhouseLigths = $GreenHouse/GreenHouseLight.get_children()
	for greenhouseLigth in greenhouseLigths:
		greenhouseLigth.set_enabled(false)
		pass
	pass


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
	
func search_access_control_card():
	Backpack.playerLevel = Common.accessCardLevels.LEVEL1;
	Backpack.accessControlCard = true
	Common.show_tips("获得：门禁卡（等级一）", true)
	$BackPack/AccessCard.show()
	$BackPack/AccessCard/AnimationPlayer.play("default")
	
func search_falsh_light():
	Backpack.flashLight = true
	Common.show_tips("获得：手电筒", true)
	$BackPack/FlashLight.show()
	$BackPack/FlashLight/AnimationPlayer.play("default")

func search_battery():
	Backpack.battery = true
	Common.show_tips("获得：门禁外接电源", true)
	$BackPack/Battery.show()
	$BackPack/Battery/AnimationPlayer.play("default")


signal signal_get_accress_card_level2
func get_accress_card_level2():
	emit_signal("signal_get_accress_card_level2")
	Common.show_tips("获得：门禁卡（等级二）", true)
	Backpack.playerLevel = Common.accessCardLevels.LEVEL2;
	

func _on_dead_area_body_entered(body):
	if body == get_node("Player"):
		get_tree().paused = true
		var death = load("res://scene/death.tscn").instantiate()
		add_child(death)
		pass
	pass # Replace with function body.


func _on_bedroom_out_show_vending_machine_result(result):
	Common.show_tips("获得："+result, true)
	pass # Replace with function body.


func _on_player_lack_of_authority():
	Common.show_tips("权限不足", true)
	pass # Replace with function body.

func _on_player_passwd_error():
	Common.show_tips("密码错误", true)
	
func show_bedroom_computer():
	if find_child("BedroomComputer", false, false) != null:
		get_node("BedroomComputer").show()
	else:
		var bedroomComputerUi = load("res://scene/furniture/bedroom_computer.tscn").instantiate()
		add_child(bedroomComputerUi)

func repos_camera():
	Common.inputLock = true
	var tween = create_tween().bind_node($Player/Camera).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($Player/Camera, "position", Vector2(get_node("Player/Camera").position.x+50,get_node("Player/Camera").position.y),2)
	tween.play()
	await tween.finished
	Common.inputLock = false
