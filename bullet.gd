extends Node2D

var velocity = 10
var rot
@onready var dual_bot: CharacterBody2D = $"../../DualBot"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rot = global_rotation + PI/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var baseSpeed = dual_bot.velocity
	var bulletSpeed = Vector2(cos(rot),sin(rot)) * velocity
	global_position += baseSpeed + bulletSpeed
