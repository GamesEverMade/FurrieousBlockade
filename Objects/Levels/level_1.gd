extends Levels
# @onready var level = Levels.new()

func _ready() -> void:
	pass
	

# Deixar esses controles de hud e vida em outro lugar de forma que todos os levels utilizem
func _physics_process(_delta: float) -> void:
	hud.update_health_label(player.life)
	hud.update_boost_label(player.boosts)
	_text_alert_update(_delta)
	grid_speed += 0.1 * _delta
	grid.speed_scale = grid_speed

func _text_alert_update(_delta):
	var life = player.life
	if life <= 0:
		get_tree().change_scene_to_file(Globals.new().GAME_OVER_SCENE)

# função que serve de script da fase
# ao longo do tempo spawna inimigos e obstáculos
# ex: if elapsed_time = 5: create enemy_light at pos(200,500) etc etc
