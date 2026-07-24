extends CharacterBody2D

var focused
var enemy_in_way
var enemy_left
var enemy_right

func _ready() -> void:
	$MovementMarkers.visible = false
	focused = false
	
	
func _process(delta: float) -> void:
	if(focused):
		$MovementMarkers.visible = true
		if(enemy_right):
			$MovementMarkers/Right.visible = true
		else:
			$MovementMarkers/Right.visible = false
		if(enemy_left):
			$MovementMarkers/Left.visible = true
		else:
			$MovementMarkers/Left.visible = true
		if(enemy_in_way):
			$MovementMarkers/Forward.visible = true
		else:
			$MovementMarkers/Forward.visible = true
	elif(!focused):
		$MovementMarkers.visible = false

func _on_select_pawn_button_up() -> void:
	if(focused):
		focused = false
	else:
		focused = true


func _on_left_marker_area_body_entered(body: CharacterBody2D) -> void:
	enemy_left = true


func _on_forward_marker_area_body_entered(body: Node2D) -> void:
	enemy_in_way = true


func _on_right_marker_area_body_entered(body: Node2D) -> void:
	enemy_right = true
