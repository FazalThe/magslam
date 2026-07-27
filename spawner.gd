extends Node2D

var x = 0

var dual_scene = preload("res://dualbot.tscn")
var gameOver = false
@onready var parent: Node2D = get_parent()
@onready var magnet: CharacterBody2D = $"../Magnet"
@onready var timer: Timer = $SpawnTimer
@onready var wall: TileMapLayer = $"../TileMapLayer"

const mindis = 250
const maxdis = 450
@onready var area: Area2D = $Area2D

const fact = maxdis - mindis # no need to/ dont change

var i = 0

func _ready() -> void:
	randomize()

func _physics_process(_delta: float) -> void:
	if gameOver:
		timer.paused = true
	



func _on_timer_timeout() -> void:
	var dualbot:CharacterBody2D = dual_scene.instantiate()
	
	var space = get_world_2d().direct_space_state
	var magPos = magnet.global_position 
	
	var inArea = false
	var inWall = false
	var limit = 0
	while true:

		limit += 1
		if limit > 100:
			break
		
		var angle = randf_range(0,TAU)
		var dis = (mindis + (randf()*fact))
		var vectorDis = Vector2( cos(angle), sin(angle) ) * dis
		var pos = magPos + vectorDis # returns a random point around magnet with dis b/w min & max dis
		
		var query = PhysicsShapeQueryParameters2D.new()
		query.shape = dualbot.get_node("CollisionShape2D").shape
		query.transform = Transform2D(0, pos)
		query.collide_with_areas = true
		
		
		var colliding = space.intersect_shape(query)
		
		for collision in colliding:
			if collision.collider == area:
				inArea = true
			if collision.collider == wall:
				inWall = true
			
		if inArea && not inWall:
			dualbot.position = pos 
			add_child(dualbot)
			break
			
	# timer dur
	i += 1
	if i >= 5:
		timer.wait_time -= 0.1
		i = 0


func _on_magnet_died() -> void:
	gameOver = true
	#for enemies in get_children():
		#enemies.gameOver = true
