extends Area2D

@onready var attack_timer: Timer = $AttackTimer
@onready var bullet = preload("res://Objects/Enemies/bullet.tscn")
@export var audio_stream_player: AudioStreamPlayer
@export var bullet_speed:float = 400
@export var damage:int = 1
@export var explosao:AudioStream
@export var tiro:AudioStream

func _ready() -> void:
	attack_timer.start()
	pass

func fire_bullet(_origin, _speed = null, _damage = null):
	Globals.new().tocar_audio(audio_stream_player, tiro, -10, 0.5, 1.4)
	var b = bullet.instantiate()
	if _speed  != null: b.speed = _speed
	if _damage != null: b.damage = _damage
	b.global_position = _origin
	return b

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullet') and area.is_deflected:
		area.queue_free()
		queue_free() # mudar para dano causado?

# funcao para atirar a cada X segundos
func _on_attack_timer_timeout() -> void:
	var b = fire_bullet(global_position, bullet_speed, damage)
	add_sibling(b)

func _on_tree_exited() -> void:
	Globals.new().tocar_audio(audio_stream_player, explosao, 5, 0.8, 1.2)
