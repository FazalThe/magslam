extends Area2D

const force = 800

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		print("leftpress")
		for body: RigidBody2D in get_overlapping_bodies():
			var dir = global_position.direction_to(body.global_position)
			body.apply_central_force(force*dir)
