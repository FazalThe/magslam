extends Control

@onready var parent: Node2D = $"../.."
@onready var label: Label = $Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_end_timer_timeout() -> void:
	label.text = "KILL : " + str(parent.kill)
