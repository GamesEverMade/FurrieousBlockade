extends Control
class_name tutorial_HUD

# LABELS: Containing the Tutorial text
@export var label : Label 
@export var timer : Timer
@onready var label_2: Label = $Label2


var labels = [
	"The Bat Country Syndicate has blocked out the Sun",
	"In order to create an eternal night", 
	"Push forward and Unlock the Sun!",
	"MOUSE: move your shield to block attacks",
	"LEFT MOUSE BUTTON to deflect projectiles back",
	"W, A, S, D: movement",
	"Be careful not to be overwhelmed by enemies"
]

var current_item :int

func _ready():
		# Exibe a primeira mensagem
	update_label()
	timer.wait_time = 3
	timer.start()

func update_label():
	label.text = labels[current_item]

func _on_timer_timeout() -> void:
	if current_item < labels.size() - 1:
		current_item += 1
		update_label()
	else:
		label.visible = false
		timer.stop()

func update_win():
	label_2.visible = true
