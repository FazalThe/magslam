extends Node2D

var dual_scene = preload("res://dualbot.tscn")
var gameOver = false
@onready var parent: Node2D = get_parent()
@onready var magnet: CharacterBody2D = $"../Magnet"
@onready var timer: Timer = $"../SpawnTimer"

const mindis = 250
const maxdis = 350

const fact = maxdis - mindis # no need to/ dont change

func _ready() -> void:
	randomize()

func _physics_process(_delta: float) -> void:
	if gameOver:
		timer.paused = true
	



func _on_timer_timeout() -> void:
	var dualbot:CharacterBody2D = dual_scene.instantiate()
	add_child(dualbot)
	var magPos = magnet.global_position
	
	var angle = randf_range(0,2*PI)
	var dis = (mindis + (randf()*fact))
	var vectorDis = Vector2( cos(angle), sin(angle) ) * dis
	print(angle," ",dis," ",vectorDis)
	
	var pos = magPos + vectorDis # returns a random point around magnet with dis b/w min & max dis
	print(magPos-pos)
	dualbot.position = pos


func _on_magnet_died() -> void:
	print("hi")
	gameOver = true
	#for enemies in get_children():
		#enemies.gameOver = true
