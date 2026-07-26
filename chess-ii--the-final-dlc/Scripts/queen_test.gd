extends CharacterBody2D

var focused
var taking
var touching_border
var forward_touching_border
var back_touching_border

var tile
var tile_group

var target #this is for moving to a tile

# all the right variables
#region all the "enemy in way" variables.
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

var enemy_back1
var enemy_back2
var enemy_back3
var enemy_back4
var enemy_back5
var enemy_back6
var enemy_back7
#endregion
#region all the "x_tile" variables for saving.

#region Forward
var forward1_tile
var forward2_tile
var forward3_tile
var forward4_tile
var forward5_tile
var forward6_tile
var forward7_tile

var forward1_tile_group
var forward2_tile_group
var forward3_tile_group
var forward4_tile_group
var forward5_tile_group
var forward6_tile_group
var forward7_tile_group

#endregion
#region Back
var back1_tile
var back2_tile
var back3_tile
var back4_tile
var back5_tile
var back6_tile
var back7_tile

var back1_tile_group
var back2_tile_group
var back3_tile_group
var back4_tile_group
var back5_tile_group
var back6_tile_group
var back7_tile_group
#endregion
#region Right
var right1_tile
var right2_tile
var right3_tile
var right4_tile
var right5_tile
var right6_tile
var right7_tile

var right1_tile_group
var right2_tile_group
var right3_tile_group
var right4_tile_group
var right5_tile_group
var right6_tile_group
var right7_tile_group

#endregion



func _ready() -> void:
	print("Right spacing: ", $MovementMarkers/Right/Right2.position - $MovementMarkers/Right/Right1.position)
	focused = false


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
			#region Back Movement Narker Visibility Control
			
			$MovementMarkers.visible = true
			$MovementMarkers/Back.visible = true
			$MovementMarkers/Back/Back1.visible = true
			$MovementMarkers/Back/Back2.visible = true
			$MovementMarkers/Back/Back3.visible = true
			$MovementMarkers/Back/Back4.visible = true
			$MovementMarkers/Back/Back5.visible = true
			$MovementMarkers/Back/Back6.visible = true
			$MovementMarkers/Back/Back7.visible = true
			
			if(enemy_back1):
				if(back_touching_border):
					$MovementMarkers/Back/Back1.visible = false
				$MovementMarkers/Back/Back2.visible = false
				$MovementMarkers/Back/Back3.visible = false
				$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back2):
				if(back_touching_border):
					$MovementMarkers/Back/Back2.visible = false
				$MovementMarkers/Back/Back3.visible = false
				$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back3):
				if(back_touching_border):
					$MovementMarkers/Back/Back3.visible = false
				$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back4):
				if(back_touching_border):
					$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back5):
				if(back_touching_border):
					$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back6):
				if(back_touching_border):
					$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = false
			if(enemy_back1):
				if(back_touching_border):
					$MovementMarkers/Back/Back7.visible = false
				
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
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	


func _on_right_button_2_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	


func _on_right_button_3_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_right_button_4_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_right_button_5_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_right_button_6_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_right_button_7_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	


#endregion
#region All the collision signals.

func _on_right_area_1_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
	if(Globals.board_tiles[right1_tile_group][right1_tile].state == true):
		enemy_right1 = true
	

func _on_right_area_1_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right1 = false


func _on_right_area_2_body_entered(body: Node2D) -> void:
	right2_tile = body.tile
	right2_tile_group = body.tile_group
	if(Globals.board_tiles[right2_tile_group][right2_tile].state == true):
		enemy_right2 = true


func _on_right_area_2_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right2 = false


func _on_right_area_3_body_entered(body: Node2D) -> void:
	right3_tile = body.tile
	right3_tile_group = body.tile_group
	if(Globals.board_tiles[right3_tile_group][right3_tile].state == true):
		enemy_right3 = true

func _on_right_area_3_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right3 = false


func _on_right_area_4_body_entered(body: Node2D) -> void:
	right4_tile = body.tile
	right4_tile_group = body.tile_group
	if(Globals.board_tiles[right4_tile_group][right4_tile].state == true):
		enemy_right4 = true


func _on_right_area_4_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right4 = false


func _on_right_area_5_body_entered(body: Node2D) -> void:
	right5_tile = body.tile
	right5_tile_group = body.tile_group
	if(Globals.board_tiles[right5_tile_group][right5_tile].state == true):
		enemy_right5 = true


func _on_right_area_5_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right5 = false


func _on_right_area_6_body_entered(body: Node2D) -> void:
	right6_tile = body.tile
	right6_tile_group = body.tile_group
	if(Globals.board_tiles[right6_tile_group][right6_tile].state == true):
		enemy_right6 = true


func _on_right_area_6_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right6 = false


func _on_right_area_7_body_entered(body: Node2D) -> void:
	right7_tile = body.tile
	right7_tile_group = body.tile_group
	if(Globals.board_tiles[right7_tile_group][right7_tile].state == true):
		enemy_right7 = true

func _on_right_area_7_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right7 = false

#endregion
#region All the edge collision signals.

func _on_right_area_1_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right1 = true
	if(area.is_in_group("Tiles")):
		right1_tile = area.name
		right1_tile_group = str(area.name)[0]


func _on_right_area_1_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right1 = false


func _on_right_area_2_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right2 = true
	if(area.is_in_group("Tiles")):
		right2_tile = area.name
		right2_tile_group = str(area.name)[0]


func _on_right_area_2_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right2 = false


func _on_right_area_3_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right3 = true
	if(area.is_in_group("Tiles")):
		right3_tile = area.name
		right3_tile_group = str(area.name)[0]


func _on_right_area_3_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right3 = false


func _on_right_area_4_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = true
		enemy_right4 = true
	if(area.is_in_group("Tiles")):
		right4_tile = area.name
		right4_tile_group = str(area.name)[0]


func _on_right_area_4_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right4 = false


func _on_right_area_5_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = true
		enemy_right5 = true
	if(area.is_in_group("Tiles")):
		right5_tile = area.name
		right5_tile_group = str(area.name)[0]


func _on_right_area_5_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right5 = false
	


func _on_right_area_6_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right6 = true
	if(area.is_in_group("Tiles")):
		right6_tile = area.name
		right6_tile_group = str(area.name)[0]


func _on_right_area_6_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		touching_border = false
		enemy_right6 = false


func _on_right_area_7_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right7 = true
	if(area.is_in_group("Tiles")):
		right7_tile = area.name
		right7_tile_group = str(area.name)[0]


func _on_right_area_7_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right7 = false
	
#endregion

#endregion

#region All the inputs for the Forward markers.

#region All the button signals.


func _on_forward_button_1_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	

func _on_forward_button_2_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_forward_button_3_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	


func _on_forward_button_4_button_up() -> void:
	Globals.turn_tracking += 1
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward4_tile
	reset_markers()
	await get_tree().process_frame
	await get_tree().process_frame
	global_position = Globals.position_target



func _on_forward_button_5_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_forward_button_6_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	



func _on_forward_button_7_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	


#endregion
#region All the edge collision signals.

func _on_forward_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward1 = true
	if(area.is_in_group("Tiles")):
		forward1_tile = area.name
		forward1_tile_group = str(area.name)[0]
		print("forward 1 done")


func _on_forward_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward1 = false


func _on_forward_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward2 = true
	if(area.is_in_group("Tiles")):
		forward2_tile = area.name
		var group = str(area.name)[0]
		forward2_tile_group = group

func _on_forward_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward2 = true


func _on_forward_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward3 = true
	if(area.is_in_group("Tiles")):
		forward3_tile = area.name
		print(forward3_tile)
		var group = str(area.name)[0]
		forward3_tile_group = group

func _on_forward_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward3 = false


func _on_forward_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward4 = true
	if(area.is_in_group("Tiles")):
		forward4_tile = area.name
		print(forward4_tile)
		forward4_tile_group = str(area.name)[0]
		
func _on_forward_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward4 = false


func _on_forward_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward5 = true
	if(area.is_in_group("Tiles")):
		forward5_tile = area.name
		var group = str(area.name)[0]
		forward5_tile_group = group


func _on_forward_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward5 = false


func _on_forward_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward6 = true
	if(area.is_in_group("Tiles")):
		forward6_tile = area.name
		var group = str(area.name)[0]
		forward6_tile_group = group


func _on_forward_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward6 = false


func _on_forward_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward7 = true
	if(area.is_in_group("Tiles")):
		forward7_tile = area.name
		var group = str(area.name)[0]
		forward7_tile_group = group


func _on_forward_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward7 = false

#endregion
#region ALl the collision signals


func _on_forward_1_area_body_entered(body: Node2D) -> void:
	forward1_tile = body.tile
	forward1_tile_group = body.tile_group
	if(Globals.board_tiles[forward1_tile_group][forward1_tile].state == true):
		enemy_forward1 = true


func _on_forward_1_area_body_exited(body: Node2D) -> void:
	enemy_forward1 = false


func _on_forward_2_area_body_entered(body: Node2D) -> void:
	forward2_tile = body.tile
	forward2_tile_group = body.tile_group
	if(Globals.board_tiles[forward2_tile_group][forward2_tile].state == true):
		enemy_forward2 = true


func _on_forward_2_area_body_exited(body: Node2D) -> void:
	enemy_forward2 = false


func _on_forward_3_area_body_entered(body: Node2D) -> void:
	forward3_tile = body.tile
	forward3_tile_group = body.tile_group
	if(Globals.board_tiles[forward3_tile_group][forward3_tile].state == true):
		enemy_forward3 = true


func _on_forward_3_area_body_exited(body: Node2D) -> void:
	enemy_forward3 = false


func _on_forward_4_area_body_entered(body: Node2D) -> void:
	forward4_tile = body.tile
	forward4_tile_group = body.tile_group
	if(Globals.board_tiles[forward4_tile_group][forward4_tile].state == true):
		enemy_forward4 = true


func _on_forward_4_area_body_exited(body: Node2D) -> void:
	enemy_forward4 = false


func _on_forward_5_area_body_entered(body: Node2D) -> void:
	forward5_tile = body.tile
	forward5_tile_group = body.tile_group
	if(Globals.board_tiles[forward5_tile_group][forward5_tile].state == true):
		enemy_forward5 = true


func _on_forward_5_area_body_exited(body: Node2D) -> void:
	enemy_forward5 = false	


func _on_forward_6_area_body_entered(body: Node2D) -> void:
	forward6_tile = body.tile
	forward6_tile_group = body.tile_group
	if(Globals.board_tiles[forward6_tile_group][forward6_tile].state == true):
		enemy_forward6 = true
	

func _on_forward_6_area_body_exited(body: Node2D) -> void:
	enemy_forward6 = false


func _on_forward_7_area_body_entered(body: Node2D) -> void:
	forward7_tile = body.tile
	forward7_tile_group = body.tile_group
	if(Globals.board_tiles[forward7_tile_group][forward7_tile].state == true):
		enemy_forward7 = true


func _on_forward_7_area_body_exited(body: Node2D) -> void:
	enemy_forward7 = false

#endregion

#endregion

#region All the inputs for the Back markers.

#region ALl the button signals


func _on_back_1_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_2_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_3_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_4_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_5_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_6_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_back_7_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.

#endregion
#region All the collision signals


func _on_back_1_area_body_entered(body: Node2D) -> void:
	back1_tile = body.tile
	back1_tile_group = body.tile_group
	if(Globals.board_tiles[back1_tile_group][back1_tile].state == true):
		enemy_back1 = true


func _on_back_1_area_body_exited(body: Node2D) -> void:
	enemy_back1 = false


func _on_back_2_area_body_entered(body: Node2D) -> void:
	back2_tile = body.tile
	back2_tile_group = body.tile_group
	if(Globals.board_tiles[back2_tile_group][back2_tile].state == true):
		enemy_back2 = true



func _on_back_2_area_body_exited(body: Node2D) -> void:
	enemy_back2 = false


func _on_back_3_area_body_entered(body: Node2D) -> void:
	back3_tile = body.tile
	back3_tile_group = body.tile_group
	if(Globals.board_tiles[back3_tile_group][back3_tile].state == true):
		enemy_back3 = true



func _on_back_3_area_body_exited(body: Node2D) -> void:
	enemy_back3 = false


func _on_back_4_area_body_entered(body: Node2D) -> void:
	back4_tile = body.tile
	back4_tile_group = body.tile_group
	if(Globals.board_tiles[back4_tile_group][back4_tile].state == true):
		enemy_back4 = true



func _on_back_4_area_body_exited(body: Node2D) -> void:
	enemy_back4 = false


func _on_back_5_area_body_entered(body: Node2D) -> void:
	back5_tile = body.tile
	back5_tile_group = body.tile_group
	if(Globals.board_tiles[back5_tile_group][back5_tile].state == true):
		enemy_back5 = true



func _on_back_5_area_body_exited(body: Node2D) -> void:
	enemy_back5 = false


func _on_back_6_area_body_entered(body: Node2D) -> void:
	back6_tile = body.tile
	back6_tile_group = body.tile_group
	if(Globals.board_tiles[back5_tile_group][back5_tile].state == true):
		enemy_back5 = true



func _on_back_6_area_body_exited(body: Node2D) -> void:
	enemy_back6 = false


func _on_back_7_area_body_entered(body: Node2D) -> void:
	back7_tile = body.tile
	back7_tile_group = body.tile_group
	if(Globals.board_tiles[back7_tile_group][back7_tile].state == true):
		enemy_back7 = true



func _on_back_7_area_body_exited(body: Node2D) -> void:
	enemy_back7 = false

#endregion
#region All the edge collision signals


func _on_back_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back1 = true
	if(area.is_in_group("Tiles")):
		back1_tile = area.name
		back1_tile_group = str(area.name)[0]


func _on_back_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back1 = false


func _on_back_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back2 = true
	if(area.is_in_group("Tiles")):
		back2_tile = area.name
		back2_tile_group = str(area.name)[0]


func _on_back_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back2 = false


func _on_back_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back3 = true
	if(area.is_in_group("Tiles")):
		back3_tile = area.name
		back3_tile_group = str(area.name)[0]


func _on_back_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back3 = false


func _on_back_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back4 = true
	if(area.is_in_group("Tiles")):
		back4_tile = area.name
		back4_tile_group = str(area.name)[0]


func _on_back_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back4 = false


func _on_back_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back5 = true
	if(area.is_in_group("Tiles")):
		back5_tile = area.name
		back5_tile_group = str(area.name)[0]


func _on_back_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back5 = false


func _on_back_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back6 = true
	if(area.is_in_group("Tiles")):
		back6_tile = area.name
		back6_tile_group = str(area.name)[0]


func _on_back_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back6 = false


func _on_back_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back7 = true
	if(area.is_in_group("Tiles")):
		back7_tile = area.name
		back7_tile_group = str(area.name)[0]


func _on_back_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back7 = false

#endregion

#endregion
# keeping this line here


func _on_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]

func reset_markers():
	enemy_right1 = false
	enemy_right2 = false
	enemy_right3 = false
	enemy_right4 = false
	enemy_right5 = false
	enemy_right6 = false
	enemy_right7 = false

	enemy_forward1 = false
	enemy_forward2 = false
	enemy_forward3 = false
	enemy_forward4 = false
	enemy_forward5 = false
	enemy_forward6 = false
	enemy_forward7 = false

	enemy_back1 = false
	enemy_back2 = false
	enemy_back3 = false
	enemy_back4 = false
	enemy_back5 = false
	enemy_back6 = false
	enemy_back7 = false
