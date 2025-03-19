extends State

## WALK STATE

func enter():
	if player:
		player.player_sprite.play('walk')

func update(_delta) -> void:
	# Importing Player's Speed to the Script
	var speed = player.SPEED
	
	var direction = Input.get_axis("left","right")
	player.velocity.x = direction * speed
	player.move_and_slide()
	
	# CHANGE STATE
	# TO IDLE
	if direction == 0:
		state_finished.emit("Idle")
	# TO JUMP
	elif Input.is_action_just_pressed("up"):
		state_finished.emit("jump")
	# TO ROLL
	elif Input.is_action_just_pressed("roll"):
		state_finished.emit("roll")
	# TO PARRY
	elif Input.is_action_just_pressed("parry"):
		state_finished.emit("parry")
