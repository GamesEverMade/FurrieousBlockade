extends Area2D
class_name Projectile
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	sprite.play("default")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Player'):
		queue_free()
