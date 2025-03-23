extends Control
class_name tutorial_HUD

# LABELS: Containing the Tutorial text
@export var label : Label 
@export var timer : Timer

var labels = [
	"welcome to Unleash the Sun!",
	"Fender, the defender needs your help!", 
	"The Evil Batwigs blocked the sunlight, For its evil purposes!", 
	"Help us guiding Fender to Unliesh the sun!", 
	"Use 'W', 'S', or 'Up Arrow' and 'Down arrow' keys to move Up and Down.", 
	"Use 'A', 'D', or 'Left Arrow' and 'Right arrow' keys to move Left and Right.", 
	"Fender is equiped with a Pawn Shield, use the mouse to move it in order to block", 
	"You can also parry the enemies attack, clicking the 'left mouse button'", 
	"You must parry at the exact moment of the enemies attack touches your shield",
	"Try to defeat all enemies you encounter, otherwise there will be many on screen", 
	"They will also throw rocks on your direction, pay attention to not let it hit you.", 
	"GOOD LUCK!!!"
	]

var current_item = 0

func _ready():
	label.text = labels[0]
	timer.start()

func _physics_process(_delta: float) -> void:
	label.text = labels[current_item]
	timer.wait_time = 3
	timer.start()

func _on_timer_timeout() -> void:
	if current_item < labels.size():
		current_item += 1
