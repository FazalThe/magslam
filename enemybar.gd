extends Control

@onready var bar: ProgressBar = $ProgressBar
@onready var parent:= get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	bar.value = parent.health
