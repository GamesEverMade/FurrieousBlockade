extends Node2D
class_name Shield

@export var clamp_radius:float = 150
@export var clamp_angle_range = 160 # in degrees, from leftmost angle to rightmost angle.
@onready var player: Player = $".."

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position = get_clamped_mouse_position()
	
func get_clamped_mouse_position() -> Vector2:
	var final_position: Vector2 = Vector2.ZERO
	var mouse_position = get_global_mouse_position()
	var shield_to_player_vector = mouse_position - player.position
	var shield_to_player_distance = shield_to_player_vector.length()
	var shield_to_player_angle = shield_to_player_vector.angle()
	
	var min_angle =  deg_to_rad(-90-clamp_angle_range/2) # -90 is up direction in godot. 
	var max_angle =  deg_to_rad(-90+clamp_angle_range/2)
	
	shield_to_player_angle = clamp(shield_to_player_angle, min_angle, max_angle)
	# Known Issue: When angle between shield and player is full left, angle goes from +Pi to -Pi and snaps to zero, shifting it to the right.
	shield_to_player_distance = clamp(shield_to_player_distance, 0, clamp_radius)
	
	final_position = Vector2.from_angle(shield_to_player_angle) * shield_to_player_distance
	return final_position
