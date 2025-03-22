extends Area2D
class_name Obstacle

var pos_3d : Vector2
var z: float = 500 # Obstacle spawns far away

#@export var horizon_center = Vector2(640, 320)
@export var horizon_center = Vector2(240, 320)
@export var z_speed:float = -50 # Negative speed because object is moving towards "camera" (z = 0)
@export var z_threshold: float = 0 # After Obstacle passes the "camera", z < 0 and should be deleted.
@export var scaling_factor: float = 5 
@export var min_scaling: float = 0 
@export var max_scaling: float = 2 # Biggest scaling the object will ever have on screen

func _ready() -> void:
	scale = Vector2.ZERO
	pos_3d = Vector2(0, 0) #TODO : Infer 3d pos from screen pos
	pass

func _process(delta: float) -> void:
	z += z_speed * delta
	scale = get_scale_from_z()
	position = get_position_from_z()
	if z < z_threshold:
		queue_free()

func get_scale_from_z(): 
	# Multiply by (1,1) to transform it into a Vector
	var new_scale = Vector2.ONE * 1/z * (max_scaling)
	return new_scale.clamp(Vector2.ONE * min_scaling, Vector2.ONE * max_scaling)
	 
func get_position_from_z(): # SIM, TEM UMA LINHA. MAS SE NÃO FOSSE ASSIM NINGUÉM ENTENDE PORRA NENHUMA
	#TODO: Allow for spawning along horizon line, instead of from infinity
	return pos_3d * 1/z * scaling_factor + horizon_center
	
#TODO: Add collision with player
#TODO: Adjust z-index according to scale
