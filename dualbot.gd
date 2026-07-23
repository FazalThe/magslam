extends CharacterBody2D

@onready var magnet: CharacterBody2D = $"../../Magnet"
@onready var tile: TileMapLayer = $"../../TileMapLayer"


const minDistance = 220
const SPEED = 300.0
var health = 100
@onready var spawner: Node2D = $".."

func _physics_process(delta: float) -> void:
	if health <=0 :
		queue_free()
	else:
		var gameOver = spawner.gameOver
		if not gameOver:
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
					var collider = collision.get_collider()
					if collider != tile:
						collision.get_collider().take_damage(damage)
					
		

			
		
func take_damage(damage):
	health -= damage
