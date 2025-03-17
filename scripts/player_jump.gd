extends State

## JUMP STATE

# Importing Player's Speed to the Script
var jump_force = Player.new().JUMP_FORCE
var gravity = Globals.new().GRAVITY

func enter() -> void :
	if player:
		player.player_sprite.play('jump')
		player.velocity.y = -jump_force
	
func update(delta) -> void:
	player.velocity.y += gravity * delta
	var direction = Input.get_axis("left","right")
	player.velocity.x = direction * 300
	player.move_and_slide()
	
	# CHANGE STATE
	if player.is_on_floor():
		# TO IDLE
		if direction == 0:
			state_finished.emit("Idle")
		else:
			state_finished.emit("walk")
