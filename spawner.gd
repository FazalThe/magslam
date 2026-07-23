extends Node2D

var dual_scene = preload("res://dualbot.tscn")
var gameOver = false
@onready var parent: Node2D = get_parent()
@onready var magnet: CharacterBody2D = $"../Magnet"
@onready var timer: Timer = $"../SpawnTimer"

const mindis = 150
const maxdis = 250

const fact = mindis - maxdis # no need to/ dont change

func _ready() -> void:
	randomize()

func _physics_process(_delta: float) -> void:
	if gameOver:
		timer.paused = true
	



func _on_timer_timeout() -> void:
	var dualbot:CharacterBody2D = dual_scene.instantiate()
	add_child(dualbot)
	var magPos = magnet.global_position
	var pos = magPos + (Vector2(randf(),randf()) * (mindis + (randf()*fact))) # returns a random point around magnet with dis b/w min & max dis
	dualbot.position = pos


func _on_magnet_died() -> void:
	print("hi")
	gameOver = true
	#for enemies in get_children():
		#enemies.gameOver = true
