extends Control
class_name Option_menu

## OPTION MENU
##
## Manages the Option Menu Methods and Behaviours.

@export var main_volume : Label
@export var music_volume : Label
@export var sfx_volume : Label

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible

## PLAYER AREA

## VIDEO AREA

@onready var fullscreen: CheckBox = $MarginContainer/TabContainer/Video/HBoxContainer/checkboxes/fullscreen
@onready var windowed: CheckBox = $MarginContainer/TabContainer/Video/HBoxContainer/checkboxes/windowed

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	toggled_on = true
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	print(toggled_on)

func _on_windowed_toggled(toggled_on: bool) -> void:
	toggled_on = true
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

## AUDIO AREA
"""
MAIN VOLUME
Get the event of change the volume slider, and gets its value as param to set the main value.
@param value : Gets the value of the volume.
"""
# Main Volume control
var main_volume_value = "00"
func _on_volume_value_changed(value):
	# Tracks the Main Volume
	AudioServer.set_bus_volume_db(0, value)
	main_volume_value = str(value)
	print(main_volume_value)

# Main volume mute
func _on_mute_checkbox_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)
	main_volume_value = "00"

# Main Volume Label
func update_main_volume_label(main_volume_value: String):
	main_volume.text = str(main_volume_value)

## CONTROLS AREA

## QUIT AREA
func _on_quit_pressed():
	# It close all nodes on the tree, making the game to finish.s
	get_tree().quit()

## MAIN MENU RETURN AREA

func _on_main_menu_pressed():
	get_tree().change_scene_to_file(Globals.new().MAIN_MENU)
