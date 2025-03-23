extends Area2D
class_name Bullet

@onready var player: Player = GameManager.player
@onready var sprite: AnimatedSprite2D = $Sprite
@export var hit:AudioStream

var speed = 400
var damage = 1
var dir: Vector2
var is_deflected = false

var margin = 30

func set_direction_to_player():
	dir = player.global_position - global_position
	dir = dir.normalized()
	rotate(dir.angle()-PI)
	#print('Player position is {0} and enemy position is {1}'.format([player.global_position, global_position]))

func deflect():
	dir = -dir
	rotate(PI)
	is_deflected = true

func _ready() -> void:
	sprite.play("default")
	set_direction_to_player()

func _process(delta: float) -> void:
	position += dir * speed * delta
	destroy_if_out_of_bounds()

func destroy_if_out_of_bounds():
	var viewport = get_viewport_rect().size
	var is_out_of_bounds = global_position.x > viewport.x + margin || global_position.x < 0 - margin \
	|| global_position.y > viewport.y + margin || global_position.y < 0 - margin
	if is_out_of_bounds:
		queue_free()
