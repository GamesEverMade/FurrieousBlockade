extends State

## ROLL STATE

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	if player:
		player.player_sprite.play('roll')
		# Colocar codigo do timer da animacao da rolagem, _on_roll_timer_timeout() 

func update(_delta) -> void:
	var direction = Input.get_axis("left","right")
	
		# CHANGE STATE
	# TO IDLE
	if direction == 0:
		state_finished.emit("Idle")
	# TO JUMP
	elif Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left"):
		state_finished.emit("walk")

func _on_roll_timer_timeout() -> void:
	pass # Replace with function body.
