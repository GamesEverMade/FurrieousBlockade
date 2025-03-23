extends Node
class_name Globals

## GLOBALS
##
## Global Variables to be used throughout the game.

@export var GRAVITY: float = 980
var rng = RandomNumberGenerator.new()

# PLAYER REFERENCE
@export var PLAYER_SCENE = "res://Objects/Player/hero.tscn"
@export var PLAYER_SHIELD = "res://Objects/Player/shield.tscn"

# PLAYERS MODIFIES
@export var ITEM_BOOST = "res://Objects/Items/boost.tscn"
@export var ITEM_CURE = "res://Objects/Items/health.tscn"

# SCENES
@export var GAME_OVER_SCENE = "res://Objects/Levels/game_over.tscn"
@export var MAIN_SCENE ="res://Objects/Levels/main_scene.tscn"
@export var TEST_SCENE ="res://Objects/Levels/test_level.tscn"

# ENEMIES DAMAGE 
@export var BULLET = "res://Objects/Enemies/bullet.tscn"

# MENUS
@export var MAIN_MENU = "res://Objects/Menus/main_menu.tscn"
@export var OPTIONS_MENU = "res://Objects/Menus/options_menu.tscn"

func play_audio(audio_stream_player:AudioStreamPlayer, file:AudioStream, volume:float, pitch_min:float, pitch_max:float):
	audio_stream_player.stream = file
	audio_stream_player.volume_db = volume
	audio_stream_player.set_pitch_scale(rng.randf_range(pitch_min, pitch_max))
	audio_stream_player.play()
