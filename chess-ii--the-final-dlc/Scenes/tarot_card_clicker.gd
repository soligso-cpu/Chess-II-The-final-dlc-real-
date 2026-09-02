extends Area2D

signal tarot_card_action(left: bool)

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("Click"):
		tarot_card_action.emit(true)
	if event.is_action_pressed("ClickR"):
		tarot_card_action.emit(false)
	pass
