extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.turn_tracking == 1:
		$Control/Label.text = str("Your money is", Globals.white_money)
	if Globals.turn_tracking == 0:
		$Control/Label.text = str("Your money is", Globals.black_money)
