extends CharacterBody2D

var focused
var taking
var touching_border
var forward_touching_border

# all the right variables

var enemy_right1
var enemy_right2
var enemy_right3
var enemy_right4
var enemy_right5
var enemy_right6
var enemy_right7

var enemy_forward1
var enemy_forward2
var enemy_forward3
var enemy_forward4
var enemy_forward5
var enemy_forward6
var enemy_forward7



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	#if(Globals.turn_tracking == 1):
		if(focused):
			z_index = 5
			move_to_front()
			taking = true
			#region Right Movement Marker Visibility Control
			
			$MovementMarkers.visible = true
			$MovementMarkers/Right.visible = true
			$MovementMarkers/Right/Right1.visible = true
			$MovementMarkers/Right/Right2.visible = 	true
			$MovementMarkers/Right/Right3.visible = true
			$MovementMarkers/Right/Right4.visible = true
			$MovementMarkers/Right/Right5.visible = true
			$MovementMarkers/Right/Right6.visible = true
			$MovementMarkers/Right/Right7.visible = true
		
			if(enemy_right1):
				if(touching_border):
					$MovementMarkers/Right/Right1.visible = false
				$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right2):
				if(touching_border):
					$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right3):
				if(touching_border):
					$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right4):
				if(touching_border):
					$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right5):
				if(touching_border):
					$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right6):
				if(touching_border):
					$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right7):
				if(touching_border):
					$MovementMarkers/Right/Right7.visible = false
				pass
			#endregion
			#region Forward Movement Marker Visibility Control
			
			$MovementMarkers.visible = true
			$MovementMarkers/Foward.visible = true
			$MovementMarkers/Foward/Forward1.visible = true
			$MovementMarkers/Foward/Forward2.visible = true
			$MovementMarkers/Foward/Forward3.visible = true
			$MovementMarkers/Foward/Forward4.visible = true
			$MovementMarkers/Foward/Forward5.visible = true
			$MovementMarkers/Foward/Forward6.visible = true
			$MovementMarkers/Foward/Forward7.visible = true
			
			if(enemy_forward1):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward1.visible = false
				$MovementMarkers/Foward/Forward2.visible = false
				$MovementMarkers/Foward/Forward3.visible = false
				$MovementMarkers/Foward/Forward4.visible = false
				$MovementMarkers/Foward/Forward5.visible = false
				$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward2):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward2.visible = false
				$MovementMarkers/Foward/Forward3.visible = false
				$MovementMarkers/Foward/Forward4.visible = false
				$MovementMarkers/Foward/Forward5.visible = false
				$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward3):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward3.visible = false
				$MovementMarkers/Foward/Forward4.visible = false
				$MovementMarkers/Foward/Forward5.visible = false
				$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward4):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward4.visible = false
				$MovementMarkers/Foward/Forward5.visible = false
				$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward5):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward5.visible = false
				$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward6):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward6.visible = false
				$MovementMarkers/Foward/Forward7.visible = false
			if(enemy_forward7):
				if(forward_touching_border):
					$MovementMarkers/Foward/Forward7.visible = false
			#endregion
		elif(!focused):
			$MovementMarkers.visible = false
			
func _on_select_queen_button_up() -> void:
	if(focused):
		focused = false
	else:
		focused = true
		
#region All the inputs for the Right markers.


#region All the button signals.

func _on_right_button_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right1.global_position
	taking = true


func _on_right_button_2_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right2.global_position
	taking = true

func _on_right_button_3_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right3.global_position
	taking = true


func _on_right_button_4_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right4.global_position
	taking = true


func _on_right_button_5_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right5.global_position
	taking = true


func _on_right_button_6_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right6.global_position
	taking = true


func _on_right_button_7_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Right/Right7.global_position
	taking = true

#endregion
#region All the collision signals.

func _on_right_area_1_body_entered(body: Node2D) -> void:
	enemy_right1 = true
	

func _on_right_area_1_body_exited(body: Node2D) -> void:
	enemy_right1 = false


func _on_right_area_2_body_entered(body: Node2D) -> void:
	enemy_right2 = true


func _on_right_area_2_body_exited(body: Node2D) -> void:
	enemy_right2 = false


func _on_right_area_3_body_entered(body: Node2D) -> void:
	enemy_right3 = true


func _on_right_area_3_body_exited(body: Node2D) -> void:
	enemy_right3 = false


func _on_right_area_4_body_entered(body: Node2D) -> void:
	enemy_right4 = true


func _on_right_area_4_body_exited(body: Node2D) -> void:
	enemy_right4 = false


func _on_right_area_5_body_entered(body: Node2D) -> void:
	enemy_right5 = true


func _on_right_area_5_body_exited(body: Node2D) -> void:
	enemy_right5 = false


func _on_right_area_6_body_entered(body: Node2D) -> void:
	enemy_right6 = true


func _on_right_area_6_body_exited(body: Node2D) -> void:
	enemy_right6 = false


func _on_right_area_7_body_entered(body: Node2D) -> void:
	enemy_right7 = true


func _on_right_area_7_body_exited(body: Node2D) -> void:
	enemy_right7 = false

#endregion
#region All the edge collision signals.

func _on_right_area_1_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right1 = true


func _on_right_area_1_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right1 = false

func _on_right_area_2_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right2 = true


func _on_right_area_2_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right2 = false


func _on_right_area_3_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right3 = true


func _on_right_area_3_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right3 = false


func _on_right_area_4_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = true
		enemy_right4 = true


func _on_right_area_4_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right4 = false


func _on_right_area_5_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = true
		enemy_right5 = true


func _on_right_area_5_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right5 = false


func _on_right_area_6_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right6 = true


func _on_right_area_6_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = false
		enemy_right6 = false


func _on_right_area_7_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right7 = true


func _on_right_area_7_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right7 = false
#endregion

#endregion

#region All the inputs for the Forward markers.

#region All the button signals.


func _on_forward_button_1_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward1.global_position
	taking = true


func _on_forward_button_2_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward2.global_position
	taking = true


func _on_forward_button_3_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward3.global_position
	taking = true


func _on_forward_button_4_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward4.global_position
	taking = true


func _on_forward_button_5_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward5.global_position
	taking = true


func _on_forward_button_6_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward6.global_position
	taking = true


func _on_forward_button_7_button_up() -> void:
	Globals.turn_tracking += 1
	global_position = $MovementMarkers/Foward/Forward7.global_position
	taking = true

#endregion
#region ALl the collision signals


func _on_forward_1_area_body_entered(body: Node2D) -> void:
	enemy_forward1 = true


func _on_forward_1_area_body_exited(body: Node2D) -> void:
	enemy_forward1 = false


func _on_forward_2_area_body_entered(body: Node2D) -> void:
	enemy_forward2 = true


func _on_forward_2_area_body_exited(body: Node2D) -> void:
	enemy_forward2 = false


func _on_forward_3_area_body_entered(body: Node2D) -> void:
	enemy_forward3 = true


func _on_forward_3_area_body_exited(body: Node2D) -> void:
	enemy_forward3 = false


func _on_forward_4_area_body_entered(body: Node2D) -> void:
	enemy_forward4 = true


func _on_forward_4_area_body_exited(body: Node2D) -> void:
	enemy_forward4 = false


func _on_forward_5_area_body_entered(body: Node2D) -> void:
	enemy_forward5 = true


func _on_forward_5_area_body_exited(body: Node2D) -> void:
	enemy_forward5 = false	


func _on_forward_6_area_body_entered(body: Node2D) -> void:
	enemy_forward6 = true
	

func _on_forward_6_area_body_exited(body: Node2D) -> void:
	enemy_forward6 = false


func _on_forward_7_area_body_entered(body: Node2D) -> void:
	enemy_forward7 = true


func _on_forward_7_area_body_exited(body: Node2D) -> void:
	enemy_forward7 = false

#endregion
#region All the edge collision singals.



func _on_forward_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward1 = true


func _on_forward_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward1 = false


func _on_forward_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward2 = true


func _on_forward_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward2 = true


func _on_forward_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward3 = true


func _on_forward_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward3 = false


func _on_forward_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward4 = true


func _on_forward_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward4 = false


func _on_forward_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward5 = true


func _on_forward_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward5 = false


func _on_forward_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward6 = true


func _on_forward_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward6 = false


func _on_forward_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward7 = true


func _on_forward_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward7 = false

#endregion

#endregion
