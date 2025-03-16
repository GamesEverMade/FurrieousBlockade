extends Node2D
class_name GameManager

static var gm

func _ready() -> void:
	gm = GameManager.new if gm == null else gm
