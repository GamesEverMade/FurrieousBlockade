extends Area2D
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
#	sprite.play("default")
	pass

func _on_area_entered(area: Area2D) -> void:
	#if area.is_in_group('Player'):
	#	queue_free()
	pass

#funcao para atirar a cada X segundos
