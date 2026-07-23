extends Control

@onready var bar: ProgressBar = $ProgressBar
@onready var mag: CharacterBody2D = $"../Magnet"
var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not gameOver:
		bar.value = mag.health


func _on_magnet_died() -> void:
	gameOver = true
