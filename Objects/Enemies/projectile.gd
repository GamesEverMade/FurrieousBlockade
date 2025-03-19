extends Area2D
class_name Projectile

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var player: Player = GameManager.player

@export var speed = 400
@export var projectile_damage = 1
var dir: Vector2
var is_deflected = false

func set_direction_to_player():
	dir = player.global_position - global_position
	dir = dir.normalized()
	#print('Player position is {0} and enemy position is {1}'.format([player.global_position, global_position]))

func deflect():
	dir = -dir
	is_deflected = true

func _ready() -> void:
	sprite.play("default")
	set_direction_to_player()

func _process(delta: float) -> void:
	position += dir * speed * delta
	destroy_if_out_of_bounds()

func destroy_if_out_of_bounds():
	pass
