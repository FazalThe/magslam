extends Node2D

var dual_scene = preload("res://dualbot.tscn")
@onready var parent: Node2D = get_parent()
@onready var magnet: CharacterBody2D = $"../Magnet"

const mindis = 150
const maxdis = 250

const fact = mindis - maxdis # no need to/ dont change

func _ready() -> void:
	randomize()

func _physics_process(delta: float) -> void:
	pass
	



func _on_timer_timeout() -> void:
	var dualbot:CharacterBody2D = dual_scene.instantiate()
	parent.add_child(dualbot)
	var magPos = magnet.global_position
	var pos = magPos + (Vector2(randf(),randf()) * (mindis + (randf()*fact))) # returns a random point around magnet with dis b/w min & max dis
	dualbot.position = pos
