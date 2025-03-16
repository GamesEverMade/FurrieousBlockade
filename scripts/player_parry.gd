extends State

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	if player:
		player.player_sprite.play('parry')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_parry_timer_timeout() -> void:
	pass # Replace with function body.
