extends CharacterBody2D

var focused
var enemy_in_way
var enemy_left
var enemy_right
var taking

func _ready() -> void:
	$MovementMarkers.visible = false
	focused = false
	taking = false
	
	
func _process(delta: float) -> void:
#	if(Globals.turn_tracking == 1):
		if(focused):
			z_index = 5
			move_to_front()
			taking = true
			$MovementMarkers.visible = true
			if(enemy_right):
				$MovementMarkers/Right.visible = true
			else:
				$MovementMarkers/Right.visible = false
			if(enemy_left):
				$MovementMarkers/Left.visible = true
			else:
				$MovementMarkers/Left.visible = false
			if(enemy_in_way):
				$MovementMarkers/Forward.visible = false
			else:
				$MovementMarkers/Forward.visible = true
		elif(!focused):
			z_index = 0
			$MovementMarkers.visible = false
			taking = false

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


func _on_left_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Left.global_position
	taking = true


func _on_collision_area_body_entered(body: CharacterBody2D) -> void:
	if(body == self):
		return
	if(taking):
		if(body != self):
			body.queue_free()
	elif(!taking):
		if(body != self):
			queue_free()


func _on_foward_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Forward.global_position


func _on_right_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right.global_position
	taking = true


func _on_left_marker_area_body_exited(body: Node2D) -> void:
	enemy_left = false


func _on_right_marker_area_body_exited(body: Node2D) -> void:
	enemy_right = false


func _on_forward_marker_area_body_exited(body: Node2D) -> void:
	enemy_in_way = false


func _on_collision_area_area_entered(area: Area2D) -> void:
	if(area.name != "WhitePromotionArea"):
		return
	else:
		pass
