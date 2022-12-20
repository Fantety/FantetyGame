extends Object

var dataArray:Array

func _ready():
	randomize()
	var file = FileAccess.open("res://data/VendingMachineItem.json", FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	json.parse(content)
	var datas = json.get_data()
	if typeof(datas) == TYPE_ARRAY:
		for data in datas:
			dataArray.append(data)
			pass
	else:
		print("Unexpected data")

signal show_vending_machine_result(result)
func _on_player_use_vending_machine():
	var index = randi()%(dataArray.size()-1)
	emit_signal("show_vending_machine_result",dataArray[index])
	pass # Replace with function body.
