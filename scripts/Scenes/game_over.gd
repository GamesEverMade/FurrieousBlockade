extends Control
class_name Game_over_menu
var globals: Globals

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file(Globals.new().MAIN_SCENE)

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(Globals.new().MAIN_MENU)
