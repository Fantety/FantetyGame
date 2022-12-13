extends Sprite2D

@onready var backpackSound = get_parent().get_parent().get_node("Sound/BackPack")

func _ready():
	set_visible(false)

var isOpen = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var lightPos = global_position
	var mousePos = get_global_mouse_position()
	set_rotation(atan2(lightPos.y-mousePos.y,lightPos.x-mousePos.x)-PI/2)
	if Backpack.flashLight:
		if Input.is_action_just_pressed("action_q"):
			isOpen = !isOpen
			backpackSound.play()
			if isOpen:
				set_visible(true)
				$AnimationPlayer.play_backwards("default")
				await $AnimationPlayer.animation_finished
				$PointLight2D.set_enabled(true)
			else:
				$PointLight2D.set_enabled(false)
				$AnimationPlayer.play("default")
				await $AnimationPlayer.animation_finished
				set_visible(false)
	pass
