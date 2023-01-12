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

func _process(delta):
	if !Common.inputLock:
		if Input.is_action_just_pressed("exit"):
			add_child(load("res://scene/exit_menu.tscn").instantiate())
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
	unlock_move()
	
func search_falsh_light():
	Backpack.flashLight = true
	Common.show_tips("获得：手电筒（按Q打开或关闭）", true)
	$BackPack/FlashLight.show()
	$BackPack/FlashLight/AnimationPlayer.play("default")
	unlock_move()

func search_battery():
	Backpack.battery = true
	Common.show_tips("获得：门禁外接电源", true)
	$BackPack/Battery.show()
	$BackPack/Battery/AnimationPlayer.play("default")
	unlock_move()


signal signal_get_access_card_level2
func get_access_card_level2():
	emit_signal("signal_get_access_card_level2")
	Common.show_tips("获得：门禁卡（等级二）", true)
	Backpack.playerLevel = Common.accessCardLevels.LEVEL2;

signal  signal_get_access_card_level3
func get_access_card_level3():
	emit_signal("signal_get_accress_card_level3")
	Common.show_tips("获得：门禁卡（等级三）", true)
	Backpack.playerLevel = Common.accessCardLevels.LEVEL3;
	$PowerRoom/PowerRoomCardArea.set_monitoring(false)

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

func wiring_power_room_wiring():
	Common.powerRoomWiringStatue = true
	Common.show_tips("线已接上", true)
	pass


func show_fantety_lab_desk_computer():
	if find_child("DataComputer", false, false) != null:
		get_node("DataComputer").show()
	else:
		var dataComputerUi = load("res://scene/furniture/data_computer.tscn").instantiate()
		add_child(dataComputerUi)
	pass

func lock_move():
	Common.inputLock = true

func unlock_move():
	Common.inputLock = false


func _on_ender_area_body_entered(body):
	if body.name == "Player":
		if Common.fantetyLabOne and Common.fantetyLabTwo:
			$EnderAnimation.play("default")
			await $EnderAnimation.animation_finished
			ChangeScene.change_scene("res://scene/plot/end_plot.tscn")
			pass
		pass
	pass # Replace with function body.


func enable_balcony_second_plot():
	if !$Balcony/BalconyPlotSecond.is_monitoring():
		$Balcony/BalconyPlotSecond.set_monitoring(true)
	pass


func _on_access_card_show_card_3_info():
	Common.show_tips("背面的数字是367238",true)
	pass # Replace with function body.
