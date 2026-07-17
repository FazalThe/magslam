extends Area2D

const forcePwr = 100

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("Left"):
		for body: CharacterBody2D in get_overlapping_bodies():
			
			repel(body, forcePwr)
	


func repel(body: CharacterBody2D, force):
	var dir = global_position.direction_to(body.global_position)
	var dist = global_position.distance_to(body.global_position)
	var factor = (1/(dist*dist))*1000
	body.velocity += factor * force * dir
