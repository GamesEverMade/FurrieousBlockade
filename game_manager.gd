extends Node
class_name GameManager

static var gm
static var player:Player


func _ready() -> void:
	gm = GameManager.new() if gm == null else gm
	
