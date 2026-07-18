extends CharacterBody2D

@onready var sprite: Sprite2D = $Node2D/Sprite2D

const SPEED = 200.0
var directionX = 0
var directionY = 0

func _physics_process(delta: float) -> void:
	
	# Rotate the body to mouse
	var mouse_angle = global_position.angle_to_point(get_global_mouse_position())
	rotation = lerp_angle(rotation, mouse_angle, 6*delta)

	var dirAngle = sprite.global_rotation
	# Get the input direction and handle the movement/deceleration.
	directionX = Input.get_axis("A", "D") 
	directionY = Input.get_axis("W", "S") 
	velocity.x = -directionY * sin(dirAngle) * SPEED
	velocity.y = directionY * cos(dirAngle) * SPEED

	#attraction
	
	move_and_slide()

func direction(angle):
	var dir = Vector2(cos(angle),sin(angle))
	return(dir)
