extends Node2D
@onready var camera: Camera2D = $Camera2D
@onready var magnet: CharacterBody2D = $Magnet
var gameOver = false
var kill = 0
@onready var endScreen: Control = $CanvasLayer/GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not gameOver:
		camera.position = magnet.position
	if gameOver:
		if Input.is_action_just_pressed("enter"):
			get_tree().reload_current_scene()


func _on_end_timer_timeout() -> void:
	endScreen.visible = true



func _on_magnet_died() -> void:
	gameOver = true
