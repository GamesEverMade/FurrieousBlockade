extends State

## PARRY STATE

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	if player:
		player.player_sprite.play('parry')

func update(_delta)->void:
	_on_parry_timer_timeout()
	
	var direction = Input.get_axis("left","right")
	# CHANGE STATE
	if player.is_on_floor():
		# TO IDLE
		if direction == 0:
			state_finished.emit("Idle")
		else:
			state_finished.emit("walk")

func _on_parry_timer_timeout() -> void:
	
	pass
