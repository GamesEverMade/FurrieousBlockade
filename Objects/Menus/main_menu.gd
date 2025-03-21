extends Control

## MAIN MENU
##
## It controls the Main Menu Functionalities.


"""
_on_play_pressed:
It awaits for the signal event of the button 'play' be press.
@param play.pressed(): Signal
"""
func _on_play_pressed():
	get_tree().change_scene_to_file(Globals.new().MAIN_SCENE)

"""
_on_options_pressed:
It awaits for the signal event of the button 'play' be press.
@param play.pressed(): Signal
"""
func _on_options_pressed():
	get_tree().change_scene_to_file(Globals.new().OPTIONS_MENU)

"""
_on_quit_pressed:
It awaits for the signal event of the button 'play' be press.
@param play.pressed(): Signal
"""
func _on_quit_pressed():
	# Closes all the nodes on the game tree, closing the game.
	get_tree().quit()
