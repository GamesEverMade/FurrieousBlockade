extends State

## DIE STATE

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	if player:
		player.player_sprite.play('die')

func update(_delta) -> void:
	_on_die_timer_timeout()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	pass

func _on_die_timer_timeout() -> void:
	pass # Replace with function body.
