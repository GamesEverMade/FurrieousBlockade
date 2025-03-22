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
@export var obstacle_collision_threshold = 10

@onready var player_sprite: AnimatedSprite2D = $player_sprite
@onready var invul_timer: Timer = $invul_timer

var margin = 0
var state = State.default
enum State{
	default,
	invul
}

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
	if state == State.invul: 
		blink_sprite()
		return 
	for area in get_overlapping_areas():
		check_collision_with_obstacle(area)
		check_collision_with_bullet(area)
	
func blink_sprite():
	if Engine.get_frames_drawn() % 2 == 0:
		player_sprite.self_modulate = Color(1, 0.5, 0.5, 0.5)
	else: 
		player_sprite.self_modulate = Color(1, 1, 1, 1)
		
func check_collision_with_obstacle(area):
	if area.is_in_group('Obstacle'):
		if area.z > 0 && area.z < obstacle_collision_threshold:
			damage_player(area.damage)

func check_collision_with_bullet(area):
	if area.is_in_group('Bullet'):
		damage_player(area.damage)

func damage_player(damage : int):
	life -= damage
	state = State.invul
	invul_timer.start()
	print('Player life is now {0}'.format([life]))
	
	
func move_player(_delta):
	var x_direction = Input.get_axis("left", "right")
	var y_direction = Input.get_axis("up", "down")
	var direction = Vector2(x_direction, y_direction)  
	
	var new_position = position + direction.normalized() * speed * _delta
	var viewport = get_viewport_rect().size
	
	var is_x_out_of_bounds = new_position.x > viewport.x + margin || new_position.x < 0 - margin 
	var is_y_out_of_bounds = new_position.y > viewport.y + margin || new_position.y < 0 - margin
	if !is_x_out_of_bounds:
		position.x = new_position.x
	if !is_y_out_of_bounds:
		position.y = new_position.y

func _on_invul_timer_timeout() -> void:
	state = State.default
	player_sprite.self_modulate = Color (1, 1, 1, 1)
