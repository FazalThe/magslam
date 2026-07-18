extends Area2D

const rforce = 800
const aforce = 700

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		for body: RigidBody2D in get_overlapping_bodies():
			var dir = global_position.direction_to(body.global_position)
			body.apply_central_force(aforce*dir)
	
	if Input.is_action_pressed("Right"):
		for body: RigidBody2D in get_overlapping_bodies():
			var dir = -global_position.direction_to(body.global_position)
			body.apply_central_force(rforce*dir)
