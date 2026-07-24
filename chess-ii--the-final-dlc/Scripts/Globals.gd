extends Node

var turn_tracking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_tracking = 1 # 1 = white, 0 = black


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
