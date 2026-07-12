extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	# Rotate the body to mouse



	# Get the input direction and handle the movement/deceleration.
	var directionX := Input.get_axis("A", "D")
	var directionY := Input.get_axis("W", "S")
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
