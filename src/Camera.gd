extends Camera2D
const amp = 1.0
const cycle = 2
const duration = 0.3
const beta = 3 / duration
const omega = 2 * PI / duration * cycle

var a: Vector2

func _ready():
	pass

func rnd_amp(amp_max: float):
	return randi_range(amp_max / 2, amp_max) * [1, -1][randi() % 2]

func _on_vibra_finished():
	offset.x = 0
	offset.y = 0

func damped_vibra(t: float):
	offset.x = a.x * exp(-beta * t) * sin(omega * t)
	offset.y = a.y * exp(-beta * t) * sin(omega * t)

func _on_Main_sig_bad():
	a = Vector2(rnd_amp(amp), rnd_amp(amp))
	var tween = create_tween()
	tween.finished.connect(Callable(self,"_on_vibra_finished"))
	tween.tween_method(damped_vibra, 0.0, duration, duration)

