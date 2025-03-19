extends Node
class_name Globals

## GLOBALS
##
## Global Variables to be used throughout the game.

@export var GRAVITY: float = 980

# PLAYER REFERENCE
@export var PLAYER_SCENE = "res://scenes/Player/hero.tscn"
@export var PLAYER_SHIELD = "res://scenes/Player/shield.tscn"

# PLAYERS MODIFIES
@export var ITEM_BOOST = "res://scenes/Items/boost.tscn"
@export var ITEM_CURE = "res://scenes/Items/health.tscn"

# SCENES
@export var GAME_OVER_SCENE = "res://scenes/Levels/game_over.tscn"
@export var MAIN_SCENE ="res://scenes/Levels/main_scene.tscn"
@export var TEST_SCENE ="res://scenes/Levels/test_level.tscn"

# ENEMIES DAMAGE 
@export var PROJECTILE = "res://scenes/Enemies/projectile.tscn"

# MENUS
@export var MAIN_MENU = "res://scenes/Menus/main_menu.tscn"
@export var OPTIONS_MENU = "res://scenes/Menus/options_menu.tscn"
