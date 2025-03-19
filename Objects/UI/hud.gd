extends Control
class_name HUD

@export var health_label : Label  
@export var boost_label : Label  
@export var status_label : Label  

func update_health_label(number: int):
	health_label.text = "x " + str(number)

func update_boost_label(number:int):
	boost_label.text = "x " + str(number)

func update_status_label(string:String):
	status_label.text = string
