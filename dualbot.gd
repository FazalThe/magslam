extends CharacterBody2D

@onready var magnet: CharacterBody2D = $"../Magnet"



const SPEED = 300.0


func _physics_process(_delta: float) -> void:
	
	look_at(magnet.position)
	
	

	move_and_slide()
