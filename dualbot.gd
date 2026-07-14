extends RigidBody2D

@onready var magnet: CharacterBody2D = $"../Magnet"


const minDistance = 220
const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	#face the magnet
	var magPosition: Vector2 = magnet.global_position 
	var target_angle = global_position.angle_to_point(magPosition)
	rotation = lerp_angle(rotation, target_angle, 3.5 * delta)
	
	#move towards magnet
	var distance = global_position.distance_to(magPosition)
	if distance > minDistance:
		position = lerp(position, magPosition, 0.2*delta)
