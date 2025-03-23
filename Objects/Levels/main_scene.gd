extends Node2D
class_name Levels
@onready var main_scene: Levels = $"."
@onready var hero: Player = $Hero
@onready var globals : Globals
@onready var player = $Hero
@onready var hud = $CanvasGroup/hud
@onready var tutorial: tutorial_HUD = $CanvasGroup/Tutorial
@onready var spawn_timer: Timer = $SpawnTimer
@onready var grid: AnimatedSprite2D = $Grid
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var background: AnimatedSprite2D = $Background
@export var grid_speed: float

const ENEMY_LIGHT = preload("res://Objects/Enemies/enemy_light.tscn")
const ENEMY_HEAVY = preload("res://Objects/Enemies/enemy_heavy.tscn")
const OBSTACLE_1 = preload("res://Objects/Obstacles/obstacle1.tscn")
const OBSTACLE_2 = preload("res://Objects/Obstacles/obstacle2.tscn")
const OBSTACLE_3 = preload("res://Objects/Obstacles/obstacle3.tscn")

# Level vars
var level_index = 0 
var level

var level1 = [
	# WAVE 1
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 100),
	"to": Vector2(100, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 100),
	"to": Vector2(1180, 100),
	"duration": 0.0
	},
	# WAVE 2
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 250),
	"to": Vector2(100, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 250),
	"to": Vector2(1180, 250),
	"duration": 0.0
	},
	# WAVE 3
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 150),
	"to": Vector2(100, 150),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(100, 350),
	"to": Vector2(100, 350),
	"duration": 0.0
	},
	# WAVE 4
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1200, 100),
	"to": Vector2(1200, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1200, 300),
	"to": Vector2(1200, 300),
	"duration": 0.0
	},
	# WAVE 5
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 100),
	"to": Vector2(100, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 100),
	"to": Vector2(1180, 100),
	"duration": 0.0
	},
	# WAVE 6
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 250),
	"to": Vector2(100, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 250),
	"to": Vector2(1180, 250),
	"duration": 0.0
	},
	# WAVE 7
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(200, 250),
	"to": Vector2(200, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(640, 250),
	"to": Vector2(640, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(1080, 250),
	"to": Vector2(1080, 250),
	"duration": 0.0
	},
	# WAVE 8
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 650),
	"to": Vector2(100, 650),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 650),
	"to": Vector2(1180, 650),
	"duration": 0.0
	},
	# WAVE 9
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(300, 100),
	"to": Vector2(300, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(400, 200),
	"to": Vector2(400, 200),
	"duration": 0.0
	},
	# WAVE 10
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 100),
	"to": Vector2(100, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 200),
	"to": Vector2(1180, 200),
	"duration": 0.0
	},
	# WAVE 11
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1080, 100),
	"to": Vector2(1080, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 200),
	"to": Vector2(1180, 200),
	"duration": 0.0
	},
	# WAVE 12
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 100),
	"to": Vector2(100, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 5.0,
	"from": Vector2(1180, 200),
	"to": Vector2(1180, 200),
	"duration": 0.0
	},
	# WAVE 13
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1150, 300),
	"to": Vector2(1150, 300),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.0,
	"from": Vector2(1150, 450),
	"to": Vector2(1150, 450),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(1150, 600),
	"to": Vector2(1150, 600),
	"duration": 0.0
	},
	# WAVE 14
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(150, 300),
	"to": Vector2(150, 300),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(150, 450),
	"to": Vector2(150, 450),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(150, 600),
	"to": Vector2(150, 600),
	"duration": 0.0
	},
	# WAVE 15
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(500, 200),
	"to": Vector2(500, 200),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 5.0,
	"from": Vector2(700, 200),
	"to": Vector2(700, 200),
	"duration": 0.0
	},
	# WAVE 16
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(200, 100),
	"to": Vector2(200, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(150, 200),
	"to": Vector2(150, 200),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(100, 300),
	"to": Vector2(100, 300),
	"duration": 0.0
	},
	# WAVE 17
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1180, 100),
	"to": Vector2(1180, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1080, 100),
	"to": Vector2(1080, 100),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(980, 300),
	"to": Vector2(980, 300),
	"duration": 0.0
	},
	# WAVE 18
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(100, 150),
	"to": Vector2(100, 150),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 0.1,
	"from": Vector2(200, 250),
	"to": Vector2(200, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(640, 250),
	"to": Vector2(640, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "light", 
	"next_spawn_delay": 6.0,
	"from": Vector2(1080, 250),
	"to": Vector2(1080, 250),
	"duration": 0.0
	},
	{
	"spawn_type": "enemy", 
	"enemy_type": "heavy", 
	"next_spawn_delay": 0.1,
	"from": Vector2(1180, 350),
	"to": Vector2(1180, 350),
	"duration": 0.0
	},
	# Level end, go to ending scene
]
"""
Expected dictionary for obstacles:
	{
		"spawn_type": "obstacle", 
		"obstacle": 1, 
		"next_spawn_delay": 1.0,
		"pos_3d": Vector2(40, 50),
		"z": 500
	}
"""
#var level2 = {
	#
#}
#var level3 = {
	#
#}

var levels = [
	level1#, level2, level3
]

func _ready() -> void:
	level = levels[level_index]
	spawn_timer.wait_time = 19
	spawn_timer.start()
	
	music_player.stream = preload("res://music/top synth.mp3")
	music_player.play()

func create_enemy(spawn:Dictionary):
	var _enemy 
	match spawn.enemy_type:
		"light": 
			_enemy = ENEMY_LIGHT
		"heavy":
			_enemy = ENEMY_HEAVY
	
	var e = _enemy.instantiate()
	e.global_position = spawn.from
	e.move_to(spawn.to, spawn.duration)
	add_child(e)

func create_obstacle(spawn:Dictionary):
	var _obstacle
	match spawn.obstacle:
		1:
			_obstacle = OBSTACLE_1
		2:
			_obstacle = OBSTACLE_2
		3:
			_obstacle = OBSTACLE_3

	var o:Obstacle = _obstacle.instantiate()
	o.pos_3d = spawn.pos_3d
	o.z = spawn.z
	add_child(o)

func _on_spawn_timer_timeout() -> void:
	if level.is_empty(): return
	var current_enemy = level.pop_front()
	create_enemy(current_enemy)
	var wait_time = current_enemy.next_spawn_delay
	spawn_timer.start(wait_time)

func _process(_delta: float) -> void:
	hud.update_health_label(player.life)
	hud.update_boost_label(player.boosts)
	_text_alert_update(_delta)
	grid_speed += 0.01 * _delta
	grid.speed_scale = grid_speed
	if level.is_empty():
		var children_list = main_scene.get_children()
		var has_enemies = false
		for child in children_list:
			if child.is_in_group("Enemies"):
				has_enemies = true
				break
		if not has_enemies:
			background.play("final")
			grid.play("final")
			tutorial.update_win()

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
