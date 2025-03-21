extends Area2D

@onready var attack_timer: Timer = $AttackTimer

@export var bullet_speed:float = 400
@export var damage:int = 1

func _ready() -> void:
	attack_timer.start()
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullet') and area.is_deflected:
		queue_free()

# funcao para atirar a cada X segundos
func _on_attack_timer_timeout() -> void:
	var b = GameManager.create_bullet(global_position, bullet_speed, damage)
	add_sibling(b)
	
	
