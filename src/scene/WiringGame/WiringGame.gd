extends CanvasLayer


var wiringGameItems = []
var wiringGamePosValue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 10:
		for j in 10:
			wiringGameItems.append(load("res://scene/component/wiring_game_item.tscn").instantiate())
			$GridContainer.add_child(wiringGameItems[i+j])
			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
