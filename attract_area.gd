extends Area2D

@onready var parent: CharacterBody2D = $".."


const forcePwr = 300

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:

	if Input.is_action_pressed("Right"):
		for body: CharacterBody2D in get_overlapping_bodies():
			
			attract(body)


func attract(body: CharacterBody2D):
	
	#var center: Vector2 = global_position + (Vector2(cos(angle),sin(angle)) * 200) #pulls towards a point infron of mag
	var center: Vector2 = global_position #pull towards the center of mag
	var dir = -center.direction_to(body.global_position)
	var dist = global_position.distance_to(body.global_position)
	var factor = (1/(dist*dist))*1000
	
	
	body.velocity += factor*dir*forcePwr
