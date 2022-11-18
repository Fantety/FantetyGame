extends Node2D

var isSearchComputer = false


#balcony plot
var balconyFirstChoise = 0
var balconySecondChoise = 0

func balcony_finish() -> bool:
	return balconyFirstChoise==2 and balconySecondChoise==2
	
