extends Node
class_name GameManager

static var gm
static var player:Player
static var bullet = preload("res://Objects/Enemies/bullet.tscn")

func _ready() -> void:
	gm = GameManager.new() if gm == null else gm
	
static func create_bullet(_origin, _speed = null, _damage = null):
	var b = bullet.instantiate()
	if _speed  != null: b.speed = _speed
	if _damage != null: b.damage = _damage
	b.global_position = _origin
	return b
