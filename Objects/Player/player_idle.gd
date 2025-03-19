extends State

## IDLE STATE

func enter() -> void:
	if player:
		player.player_sprite.play('idle')
		player.velocity = Vector2.ZERO

func update(_delta) -> void:
	# Verifies if there is an player
	if !player:
		return
		
	# Change State
	# TO WALK
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left"):
		state_finished.emit("walk")
	# TO JUMP
	elif Input.is_action_just_pressed("up"):
		state_finished.emit("jump")
	# TO ROLL
	elif Input.is_action_just_pressed("roll"):
		state_finished.emit("roll")
	# TO PARRY
	elif Input.is_action_just_pressed("parry"):
		state_finished.emit("parry")
