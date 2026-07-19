extends CharacterBody2D

@onready var magnet: CharacterBody2D = $"../Magnet"


const minDistance = 220
const SPEED = 300.0
var health = 100


func _physics_process(delta: float) -> void:
	if health <=0 :
		queue_free()
	else:
		#face the magnet
		var magPosition: Vector2 = magnet.global_position 
		var target_angle = global_position.angle_to_point(magPosition)
		rotation = lerp_angle(rotation, target_angle, 3.5 * delta)
		
		#move towards magnet
		var distance = global_position.distance_to(magPosition)
		if distance > minDistance:
			position = lerp(position, magPosition, 0.2*delta)
			
		var speed = velocity.length()
		
		move_and_slide()
		
		if get_slide_collision_count() > 0:
			var collision = get_slide_collision(0)
			
			if speed > 100:
				var damage = (speed - 100) * 0.1
				take_damage(damage)
				print(health)
				var collider = collision.get_collider()
				if collider != $"../TileMapLayer":
					collision.get_collider().take_damage(damage)
				else:
					print("collided with wall")
		

			
		
func take_damage(damage):
	health -= damage
