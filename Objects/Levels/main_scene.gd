extends Node2D
class_name Levels
@onready var globals : Globals
@onready var player = $Hero
@onready var hud = $CanvasGroup/hud
@onready var grid: AnimatedSprite2D = $Grid
@export var grid_speed: float

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	hud.update_health_label(player.life)
	hud.update_boost_label(player.boosts)
	_text_alert_update(_delta)
	grid_speed += 0.1 * _delta
	grid.speed_scale = grid_speed

func _text_alert_update(_delta):
	var life = player.life
	match life:
		7: 
			hud.update_status_label("Fender is Healthy!")
		6: 
			hud.update_status_label("Fender is less healthy... be careful")
		5: 
			hud.update_status_label("GOD... I told you! Be more careful")
		4: 
			hud.update_status_label("My systems are starting to failing...")
		3: 
			hud.update_status_label("Fender is VERY Unhealthy, now!")
		2: 
			hud.update_status_label("Never been soo bad in my whole life...")
		1: 
			hud.update_status_label("AHHH... I'm gonna DIE HEREE")
	if life <= 0:
		get_tree().change_scene_to_file(Globals.new().GAME_OVER_SCENE)
