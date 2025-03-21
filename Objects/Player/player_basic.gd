extends Area2D
class_name Player

## MAIN CHARACTER
## 
## This is the main character class script.
## Defines the properties and methods expected to be done by the Player.


"""
Properties:
Players properties

@param speed : Defines the Player's movement speed.
@param state_machine : Requires an State Machine Node that makes the management of the states.
@param player_sprite : Requires
"""
@export var speed: float = 500
@export var life : int = 7
@export var boosts : int = 1
@onready var player_sprite: AnimatedSprite2D = $player_sprite

"""
_ready:
Called once, as soon as the scene is rendered. The functions in this methods will run once.
"""
func _ready() -> void:
	GameManager.player = self
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
	var x_direction = Input.get_axis("left", "right")
	var y_direction = Input.get_axis("up", "down")
	var direction = Vector2(x_direction, y_direction)  
	position += direction * speed * _delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullet'):
		life -= area.damage
		print('Player life is now {0}'.format([life]))
	
	#if area.is_in_group('Cure'):
		#life += area.bullet_damage
		#print('Player life is now {0}'.format([life]))
	
	#if area.is_in_group('Boosts'):
		#print('Player boosts is now {0}'.format([boosts]))
	#
	#if area.is_in_group('Enemies'):
		#print('Player life is now {0}'.format([life]))
