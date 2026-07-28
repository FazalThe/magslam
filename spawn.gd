extends Node2D

var bulletScene = preload("res://bullet.tscn")
@onready var timer: Timer = $Timer
@onready var markerUp: Marker2D = $MarkerUp
@onready var markerDown: Marker2D = $MarkerDown
@onready var parent: CharacterBody2D = get_parent()
@onready var main: Node2D = parent.get_parent()
@onready var bullets = main.get_child(3)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	var bullet: Node2D = bulletScene.instantiate()
	if randi() %2:
		bullet.position = markerDown.global_position
	else:
		bullet.position = markerUp.global_position
	
	bullet.rotation = parent.sprite.global_rotation
	bullets.add_child(bullet)
