extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicController.play_track("res://Sounds/Chess2TFDLCFishing2.mp3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
