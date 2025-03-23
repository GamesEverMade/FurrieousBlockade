extends Area2D
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
@export var block_sound:AudioStream
@export var parry_sound:AudioStream
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"
@onready var player: Player = $".."
@onready var parry_timer: Timer = $ParryTimer
@onready var parry_cooldown: Timer = $ParryCooldown


enum State{
	default,
	parry,
	cooldown
}

var state = State.default

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
	if Input.is_action_pressed("LeftClick") and state == State.default:
		state = State.parry
		set_modulate(Color(1, 0, 0, 1))
		parry_timer.start()

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
	var shield_to_player_vector  : Vector2 = mouse_position - player.global_position
	var shield_to_player_distance  : float = shield_to_player_vector.length()
	var shield_to_player_angle : float = shield_to_player_vector.angle()
	
	"""Known Issue: When angle between shield and player is full left, angle goes from +Pi to -Pi and snaps to zero, shifting it to the right.""" 
	shield_to_player_distance = clamp(shield_to_player_distance, 0, clamp_radius)
	
	final_position = Vector2.from_angle(shield_to_player_angle) * shield_to_player_distance
	return final_position

func _on_area_entered(area: Area2D) -> void:
	
	var should_destroy = area.is_in_group('Bullet') and state == State.default
	var should_deflect = area.is_in_group('Bullet') and state == State.parry and area.has_method('deflect')
	
	if should_deflect: 
		area.deflect()
		Globals.new().tocar_audio(audio_stream_player, parry_sound, -3, 0.8, 1.2)
	elif should_destroy: 
		Globals.new().tocar_audio(audio_stream_player, block_sound, -3, 0.8, 1.2)
		area.queue_free()

func _on_parry_timer_timeout() -> void:
	state = State.cooldown
	set_modulate(Color(0, 1, 0, 1))
	parry_cooldown.start()
	
func _on_parry_cooldown_timeout() -> void:
	state = State.default
	set_modulate(Color(1, 1, 1, 1))
