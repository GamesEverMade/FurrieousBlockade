extends Area2D
class_name Player

## MAIN CHARACTER
## 
## This is the main character class script.
## Defines the properties and methods expected to be done by the Player.


"""
Properties:
Players properties

@param SPEED : Defines the Player's movement speed.
@param JUMP_FORCE : Defines the Player's jump force against the gravity.
@param state_machine : Requires an State Machine Node that makes the management of the states.
@param player_sprite : Requires
"""
@export var speed: float = 500
@export var JUMP_FORCE: float = 500
@export var life : int = 12 # Thinking about zelda's hearth, each hart can be divided into 4 pieces, 3 hearts... 12 pieces.
@onready var player_sprite: AnimatedSprite2D = $player_sprite

"""
_ready:
Called once, as soon as the scene is rendered. The functions in this methods will run once.
"""
func _ready() -> void:
	pass

"""
_process:
Called every frame, keeps updating while the Player is in the scene. 
The functions in this methods will run every frame.

@param delta: The time elapsed since the last frame. 
"""
func _process(_delta: float) -> void:
	move_player(_delta)
	
func move_player(_delta):
	var x_dir = Input.get_axis("left", "right")
	var y_dir = Input.get_axis("up", "down")
	var dir = Vector2(x_dir, y_dir)  
	position += dir * speed * _delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Projectiles'):
		life -= 1
		print('Player life is now {0}'.format([life]))
