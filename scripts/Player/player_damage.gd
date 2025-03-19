extends State

## DAMAGE STATE
@onready var player_colision_shape: CollisionShape2D = $"../../player_colision_shape"

func enter() -> void:
	if player:
		player.player_sprite.play('damage')

func update(_delta)->void:
	pass
