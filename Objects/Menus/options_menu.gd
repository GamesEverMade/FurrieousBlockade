extends Control
class_name Option_menu

## OPTION MENU
##
## Manages the Option Menu Methods and Behaviours.

## PLAYER AREA

## VIDEO AREA

## AUDIO AREA

"""
MAIN VOLUME
Get the event of change the volume slider, and gets its value as param to set the main value.
@param value : Gets the value of the volume.
"""
# Main Volume control
func _on_volume_value_changed(value):
	# Tracks the Main Volume
	AudioServer.set_bus_volume_db(0, value)
# Main volume mute
func _on_mute_checkbox_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)

## CONTROLS AREA

## QUIT AREA
"""
QUIT GAME
Awaits the event of 'quit' button, on the tab 'quit' from the 'options menu'.
@param Signal pressed(): Awaits a signal 'pressed()'
"""
func _on_quit_pressed():
	# It close all nodes on the tree, making the game to finish.s
	get_tree().quit()

## MAIN MENU RETURN AREA
func _on_main_menu_pressed():
	get_tree().change_scene_to_file(Globals.new().MAIN_MENU)
