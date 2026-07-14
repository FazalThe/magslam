extends CharacterBody2D

@onready var magnet: CharacterBody2D = $"../Magnet"



const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	var target_angle = global_position.angle_to_point(magnet.global_position)
	rotation = lerp_angle(rotation, target_angle, 3.5 * delta)
	#lerp()



	move_and_slide()
