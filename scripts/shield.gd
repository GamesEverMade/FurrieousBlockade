extends Node2D
class_name Shield

## SHIELD
##
## Defines the Shield Class, with its properties and methods.

"""
@param clamp_radius : Expect the float radius value of the clamp.
@param clam_angle_change : Expect the float clamp angle value of the clamp.
@param player : Expect the reference for the player.
"""
@export var clamp_radius:float = 150
@export var clamp_angle_range = 160 # in degrees, from leftmost angle to rightmost angle.
@onready var player: Player = $".."

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

@param _delta : The time elapsed since the last frame. 
"""
func _process(_delta: float) -> void:
	position = get_clamped_mouse_position()

"""
get_clamped_mouse_position:
Uses the mouse position amd the character position in order to
Return the final position of the shield.
"""
func get_clamped_mouse_position() -> Vector2:
	## 
	var final_position: Vector2 = Vector2.ZERO
	var mouse_position : Vector2 = get_global_mouse_position()
	
	## Calculating the variation of the shield position, distance and angle.
	var shield_to_player_vector  : Vector2 = mouse_position - player.position
	var shield_to_player_distance  : float = shield_to_player_vector.length()
	var shield_to_player_angle : float = shield_to_player_vector.angle()
	
	## Calculating the minimum and maximum angle.
	var min_angle : float =  deg_to_rad(-90-clamp_angle_range/2) # -90 is up direction in godot. 
	var max_angle : float =  deg_to_rad(-90+clamp_angle_range/2)
	
	shield_to_player_angle = clamp(shield_to_player_angle, min_angle, max_angle)
	"""Known Issue: When angle between shield and player is full left, angle goes from +Pi to -Pi and snaps to zero, shifting it to the right.""" 
	shield_to_player_distance = clamp(shield_to_player_distance, 0, clamp_radius)
	
	final_position = Vector2.from_angle(shield_to_player_angle) * shield_to_player_distance
	return final_position
