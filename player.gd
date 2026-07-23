extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var timer: Timer = $"../EndTimer"
signal died

const SPEED = 200.0
var health = 30


func _physics_process(delta: float) -> void:
	if health <= 0 :
		emit_signal("died")
		queue_free()
		timer.start()
		
	# Rotate the body to mouse
	var mouse_angle = global_position.angle_to_point(get_global_mouse_position())
	rotation = lerp_angle(rotation, mouse_angle, 6*delta)


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
	#attraction
	
	move_and_slide()

func take_damage(damage):
	health -= damage
