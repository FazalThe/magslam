extends Control

@onready var bar: ProgressBar = $ProgressBar
@onready var mag: CharacterBody2D = $"../../Magnet"
var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not gameOver:
		bar.value = mag.health
		if bar.value < 60:
			var newStyle = bar.get_theme_stylebox("fill").duplicate()
			newStyle.bg_color = Color(0.933, 0.0, 0.0, 1.0)
			bar.add_theme_stylebox_override("fill", newStyle)


func _on_magnet_died() -> void:
	gameOver = true
