extends Area2D
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var attack_timer: Timer = $AttackTimer
@export var projectile : PackedScene

func _ready() -> void:
	attack_timer.start()
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Projectiles') and area.is_deflected:
		queue_free()

#funcao para atirar a cada X segundos
func _on_attack_timer_timeout() -> void:
	var p = projectile.instantiate()
	add_child(p)
	

	
