extends CharacterBody2D
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
@export var SPEED: float = 200
@export var JUMP_FORCE: float = 500
@onready var player_sprite: AnimatedSprite2D = $player_sprite

"""
_ready:
Called once, as soon as the scene is rendered. The functions in this methods will run once.
"""
func _ready() -> void:
	for state in $state_machine.get_children():
		if state is State:
			state.player = self
		

"""
_process:
Called every frame, keeps updating while the Player is in the scene. 
The functions in this methods will run every frame.

@param delta: The time elapsed since the last frame. 
"""
func _process(_delta: float) -> void:
	pass
