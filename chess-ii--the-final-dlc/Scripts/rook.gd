extends CharacterBody2D

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

var enemy_forward1
var enemy_forward2
var enemy_forward3
var enemy_forward4
var enemy_forward5
var enemy_forward6
var enemy_forward7

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

var enemy_back1
var enemy_back2
var enemy_back3
var enemy_back4
var enemy_back5
var enemy_back6
var enemy_back7

#endregion
#region Left

var left1_tile
var left2_tile
var left3_tile
var left4_tile
var left5_tile
var left6_tile
var left7_tile

var left1_tile_group
var left2_tile_group
var left3_tile_group
var left4_tile_group
var left5_tile_group
var left6_tile_group
var left7_tile_group

var enemy_left1
var enemy_left2
var enemy_left3
var enemy_left4
var enemy_left5
var enemy_left6
var enemy_left7

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

var enemy_right1
var enemy_right2
var enemy_right3
var enemy_right4
var enemy_right5
var enemy_right6
var enemy_right7

#endregion

var focused
var moved
var taking
var tile
var tile_group
var select_buffer

var r_train = false

var touching_border
var forward_touching_border
var left_touching_border
var back_touching_border

#region a train rook variables

# right r train
var r_train_enemy1: String
var r_train_enemy2: String
var r_train_enemy3: String
var r_train_enemy4: String
var r_train_enemy5: String
var r_train_enemy6: String
var r_train_enemy7: String

# foward r train
var fr_train_enemy1: String
var fr_train_enemy2: String
var fr_train_enemy3: String
var fr_train_enemy4: String
var fr_train_enemy5: String
var fr_train_enemy6: String
var fr_train_enemy7: String

# back r train
var br_train_enemy1: String
var br_train_enemy2: String
var br_train_enemy3: String
var br_train_enemy4: String
var br_train_enemy5: String
var br_train_enemy6: String
var br_train_enemy7: String

# left r train

var lr_train_enemy1: String
var lr_train_enemy2: String
var lr_train_enemy3: String
var lr_train_enemy4: String
var lr_train_enemy5: String
var lr_train_enemy6: String
var lr_train_enemy7: String
#endregion
func _ready() -> void:
	Globals.rook_a1_moved = false
	Globals.rook_a8_moved = false
	Globals.rook_h1_moved = false
	Globals.rook_h8_moved = false
	moved = false
	taking = false
	if(self.name == "RookBlackA1"):
		tile = "A1"
		tile_group = "A"
	elif(self.name == "RookBlackA8"):
		tile = "A8"
		tile_group = "A"
	elif(self.name == "RookH1"):
		tile = "H1"
		tile_group = "H"
	elif(self.name == "RookH8"):
		tile = "H8"
		tile_group = "H"
	#region markers
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
	
	enemy_left1 = false
	enemy_left2 = false
	enemy_left3 = false
	enemy_left4 = false
	enemy_left5 = false
	enemy_left6 = false
	enemy_left7 = false
	
	focused = false
	Globals.piece_focused = " "
	#endregion


func _process(delta: float) -> void:
	if(r_train):
		touching_border = false
	if(Globals.rook_a_train):
		r_train = true
	else:
		r_train = false
	if(Globals.piece_focused == self.name):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectRook.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			z_index = 5
			move_to_front()
			taking = true
			if(!r_train):
				#region movement
				#region Right Movement Marker Visibility Control
				
				$MovementMarkers.visible = true
				$MovementMarkers/Right.visible = true
				$MovementMarkers/Right/Right1.visible = true
				$MovementMarkers/Right/Right1.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right2.visible = true
				$MovementMarkers/Right/Right2.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right3.visible = true
				$MovementMarkers/Right/Right3.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right4.visible = true
				$MovementMarkers/Right/Right4.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right5.visible = true
				$MovementMarkers/Right/Right5.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right6.visible = true
				$MovementMarkers/Right/Right6.PROCESS_MODE_INHERIT
				$MovementMarkers/Right/Right7.visible = true
				$MovementMarkers/Right/Right7.PROCESS_MODE_INHERIT
				
			
				if(enemy_right7):
					if(touching_border):
						$MovementMarkers/Right/Right7.visible = false
						$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
					else:
						pass
				if(enemy_right6):
					if(touching_border):
						$MovementMarkers/Right/Right6.visible = false
						$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
				if(enemy_right5):
					if(touching_border):
						$MovementMarkers/Right/Right5.visible = false
						$MovementMarkers/Right/Right5.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
				if(enemy_right4):
					if(touching_border):
						$MovementMarkers/Right/Right4.visible = false
						$MovementMarkers/Right/Right4.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right5.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
				if(enemy_right3):
					if(touching_border):
						$MovementMarkers/Right/Right3.visible = false
						$MovementMarkers/Right/Right3.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right4.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right5.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
				if(enemy_right2):
					if(touching_border):
						$MovementMarkers/Right/Right2.visible = false
						$MovementMarkers/Right/Right2.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right3.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right4.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right5.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
				if(enemy_right1):
					if(touching_border):
						$MovementMarkers/Right/Right1.visible = false
						$MovementMarkers/Right/Right1.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right2.visible = false
					$MovementMarkers/Right/Right2.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right3.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right4.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right5.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right6.PROCESS_MODE_DISABLED
					$MovementMarkers/Right/Right7.visible = false
					$MovementMarkers/Right/Right7.PROCESS_MODE_DISABLED
						#endregion
				#region Forward Movement Marker Visibility Control
						
				$MovementMarkers/Forward.visible = true
				$MovementMarkers/Forward/Forward1.visible = true
				$MovementMarkers/Forward/Forward2.visible = true
				$MovementMarkers/Forward/Forward3.visible = true
				$MovementMarkers/Forward/Forward4.visible = true
				$MovementMarkers/Forward/Forward5.visible = true
				$MovementMarkers/Forward/Forward6.visible = true
				$MovementMarkers/Forward/Forward7.visible = true
				
			
				if(enemy_forward1):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward1.visible = false
					$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward2):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward3):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward4):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward5):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward6):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward7):
					if(forward_touching_border):
						$MovementMarkers/Forward/Forward7.visible = false
						#endregion
				#region Back Movement Marker Visibility Control
				
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
				if(enemy_back7):
					if(back_touching_border):
						$MovementMarkers/Back/Back7.visible = false
							
						#endregion
				#region Left Movement Marker Visibility Control
				
				$MovementMarkers/Left.visible = true
				$MovementMarkers/Left/Left1.visible = true
				$MovementMarkers/Left/Left2.visible = true
				$MovementMarkers/Left/Left3.visible = true
				$MovementMarkers/Left/Left4.visible = true
				$MovementMarkers/Left/Left5.visible = true
				$MovementMarkers/Left/Left6.visible = true
				$MovementMarkers/Left/Left7.visible = true
				
				if(enemy_left7):
					if(left_touching_border):
						$MovementMarkers/Left/Left7.visible = false
				if(enemy_left6):
					if(left_touching_border):
						$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left5):
					if(left_touching_border):
						$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left4):
					if(left_touching_border):
						$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left3):
					if(left_touching_border):
						$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left2):
					if(left_touching_border):
						$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left1):
					if(left_touching_border):
						$MovementMarkers/Left/Left1.visible = false
					$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				#endregion
				#endregion
			else:
				#region atrain
				$MovementMarkers/Left.visible = true
				$MovementMarkers/Left/Left1.visible = false
				$MovementMarkers/Left/Left2.visible = false
				$MovementMarkers/Left/Left3.visible = false
				$MovementMarkers/Left/Left4.visible = false
				$MovementMarkers/Left/Left5.visible = false
				$MovementMarkers/Left/Left6.visible = false
				$MovementMarkers/Left/Left7.visible = true
				
				if(left_touching_border):
					$MovementMarkers/Left/Left7.visible = false
	
				$MovementMarkers/Back.visible = true
				$MovementMarkers/Back/Back1.visible = false
				$MovementMarkers/Back/Back2.visible = false
				$MovementMarkers/Back/Back3.visible = false
				$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false
				$MovementMarkers/Back/Back7.visible = true
				
				if(back_touching_border):
					$MovementMarkers/Back/Back7.visible = true
					
				$MovementMarkers/Forward.visible = true
				$MovementMarkers/Forward/Forward1.visible = false
				$MovementMarkers/Forward/Forward2.visible = false
				$MovementMarkers/Forward/Forward3.visible = false
				$MovementMarkers/Forward/Forward4.visible = false
				$MovementMarkers/Forward/Forward5.visible = false
				$MovementMarkers/Forward/Forward6.visible = false
				$MovementMarkers/Forward/Forward7.visible = true
				
				if(forward_touching_border):
					$MovementMarkers/Forward/Forward7.visible = true
				
				$MovementMarkers.visible = true
				$MovementMarkers/Right.visible = true
				$MovementMarkers/Right/Right1.visible = false
				$MovementMarkers/Right/Right1.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right2.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right3.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right4.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right5.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right6.PROCESS_MODE_ALWAYS
				$MovementMarkers/Right/Right7.visible = true
				$MovementMarkers/Right/Right7.PROCESS_MODE_ALWAYS
				
				if(touching_border):
					$MovementMarkers/Right/Right7.visible = false
				
				#endregion
		elif(!focused):
			z_index = 1
			$MovementMarkers.visible = false
	else:
		$MovementMarkers.visible = false
		focused = false


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
	
	enemy_left1 = false
	enemy_left2 = false
	enemy_left3 = false
	enemy_left4 = false
	enemy_left5 = false
	enemy_left6 = false
	enemy_left7 = false
	
	focused = false
	Globals.piece_focused = " "


func castle_prevention():
	if(self.name == "RookH1"):
		Globals.rook_h1_moved = true
	elif(self.name == "RookH8"):
		Globals.rook_h8_moved = true
	elif(self.name == "RookBlackA1"):
		Globals.rook_a1_moved = true
	elif(self.name == "RookBlackA8"):
		Globals.rook_a8_moved = true


func _on_tile_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]


func _on_tile_collision_area_body_entered(body: Node2D) -> void:
	if(self.name != body.name):
		if(taking):
			body.queue_free()
			taking = false
			if(body.is_in_group("Queen")):
				if(self.is_in_group("White")):
					Globals.white_score += 10
				else:
					Globals.black_score += 10
			if(body.is_in_group("Rook")):
				if(self.is_in_group("White")):
					Globals.white_score += 5
				else:
					Globals.black_score += 5
			if(body.is_in_group("Bishop")):
				if(self.is_in_group("White")):
					Globals.white_score += 3
				else:
					Globals.black_score += 3
			if(body.is_in_group("Knight")):
				if(self.is_in_group("White")):
					Globals.white_score += 3
				else:
					Globals.black_score += 3
			if(body.is_in_group("Pawn")):
				if(self.is_in_group("White")):
					Globals.white_score += 1
				else:
					Globals.black_score += 1
			if(body.is_in_group("King")):
				if(self.is_in_group("White")):
					Globals.white_lost = true
					Globals.black_won = true
					Globals.white_won = false
					Globals.black_lost = false
				else:
					Globals.white_lost = false
					Globals.black_won = false
					Globals.white_won = true
					Globals.black_lost = true
		else:
			queue_free()


func _on_select_rook_button_up() -> void:
	if(Globals.turn_tracking == 0 && self.is_in_group("Black") || Globals.turn_tracking == 1 && self.is_in_group("White")):
		if(Globals.piece_focused != self.name):
			Globals.piece_focused = self.name
			
			focused = true
		else:
			Globals.piece_focused = ""
			focused = false


#region movement
#region All the inputs for the Right markers.

#region All the button signals.

func _on_right_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_right_button_2_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_3_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_4_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_5_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

	



func _on_right_button_6_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_7_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	$MoveSound.play()
	if(r_train):
		$RTrainSound.play()
		var e1 = get_tree().get_root().find_child(r_train_enemy1, true, false)
		var e2 = get_tree().get_root().find_child(r_train_enemy2, true, false)
		var e3 = get_tree().get_root().find_child(r_train_enemy3, true, false)
		var e4 = get_tree().get_root().find_child(r_train_enemy4, true, false)
		var e5 = get_tree().get_root().find_child(r_train_enemy5, true, false)
		var e6 = get_tree().get_root().find_child(r_train_enemy6, true, false)
		if(e1 != null):
			e1.queue_free()
		if(e2 != null):
			e2.queue_free()
		if(e3 != null):
			e3.queue_free()
		if(e4 != null):
			e4.queue_free()
		if(e5 != null):
			e5.queue_free()
		if(e6 != null):
			e6.queue_free()
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



#endregion
#region All the collision signals.

func _on_right_area_1_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right1 = true
				touching_border = true
			else:
				enemy_right1 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right1 = true
				touching_border = true
			else:
				enemy_right1 = true
				touching_border = false
	else:
		enemy_right1 = true
		touching_border = false
	r_train_enemy1 = body.name
	

func _on_right_area_1_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right1 = false


func _on_right_area_2_body_entered(body: Node2D) -> void:
	right2_tile = body.tile
	right2_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right2 = true
				touching_border = true
			else:
				enemy_right2 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right2 = true
				touching_border = true
			else:
				enemy_right2 = true
				touching_border = false
	else:
		enemy_right2 = true
		touching_border = false
	r_train_enemy2 = body.name


func _on_right_area_2_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right2 = false


func _on_right_area_3_body_entered(body: Node2D) -> void:
	right3_tile = body.tile
	right3_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right3 = true
				touching_border = true
			else:
				enemy_right3 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right3 = true
				touching_border = true
			else:
				enemy_right3 = true
				touching_border = false
	else:
		enemy_right3 = true
		touching_border = false
	r_train_enemy3 = body.name


func _on_right_area_3_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right3 = false


func _on_right_area_4_body_entered(body: Node2D) -> void:
	right4_tile = body.tile
	right4_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right4 = true
				touching_border = true
			else:
				enemy_right4 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right4 = true
				touching_border = true
			else:
				enemy_right4 = true
				touching_border = false
	else:
		enemy_right4 = true
		touching_border = false
	r_train_enemy4 = body.name


func _on_right_area_4_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right4 = false


func _on_right_area_5_body_entered(body: Node2D) -> void:
	right5_tile = body.tile
	right5_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right5 = true
				touching_border = true
			else:
				enemy_right5 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right5 = true
				touching_border = true
			else:
				enemy_right5 = true
				touching_border = false
	else:
		enemy_right5 = true
		touching_border = false
	r_train_enemy5 = body.name


func _on_right_area_5_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right5 = false


func _on_right_area_6_body_entered(body: Node2D) -> void:
	right6_tile = body.tile
	right6_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right6 = true
				touching_border = true
			else:
				enemy_right6 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right6 = true
				touching_border = true
			else:
				enemy_right6 = true
				touching_border = false
	else:
		enemy_right6 = true
		touching_border = false
	r_train_enemy6 = body.name


func _on_right_area_6_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right6 = false


func _on_right_area_7_body_entered(body: Node2D) -> void:
	right7_tile = body.tile
	right7_tile_group = body.tile_group
	if(!r_train):
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right7 = true
				touching_border = true
			else:
				enemy_right7 = true
				touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right7 = true
				touching_border = true
			else:
				enemy_right7 = true
				touching_border = false
	elif(r_train):
		enemy_right7 = true
		touching_border = false


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
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	

func _on_forward_button_2_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

func _on_forward_button_3_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_4_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward4_tile
	await get_tree().process_frame
	await get_tree().process_frame
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_5_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	



func _on_forward_button_6_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_7_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	


#endregion
	#region All the edge collision signals.

func _on_forward_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward1 = true
	if(area.is_in_group("Tiles")):
		forward1_tile = area.name
		forward1_tile_group = str(area.name)[0]


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
		enemy_forward2 = false


func _on_forward_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward3 = true
	if(area.is_in_group("Tiles")):
		forward3_tile = area.name
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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward1 = true
			forward_touching_border = true
		else:
			enemy_forward1 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward1 = true
			forward_touching_border = true
		else:
			enemy_forward1 = true
			forward_touching_border = false


func _on_forward_1_area_body_exited(body: Node2D) -> void:
	enemy_forward1 = false


func _on_forward_2_area_body_entered(body: Node2D) -> void:
	forward2_tile = body.tile
	forward2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward2 = true
			forward_touching_border = true
		else:
			enemy_forward2 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward2 = true
			forward_touching_border = true
		else:
			enemy_forward2 = true
			forward_touching_border = false


func _on_forward_2_area_body_exited(body: Node2D) -> void:
	enemy_forward2 = false


func _on_forward_3_area_body_entered(body: Node2D) -> void:
	forward3_tile = body.tile
	forward3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward3 = true
			forward_touching_border = true
		else:
			enemy_forward3 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward3 = true
			forward_touching_border = true
		else:
			enemy_forward3 = true
			forward_touching_border = false


func _on_forward_3_area_body_exited(body: Node2D) -> void:
	enemy_forward3 = false


func _on_forward_4_area_body_entered(body: Node2D) -> void:
	forward4_tile = body.tile
	forward4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward4 = true
			forward_touching_border = true
		else:
			enemy_forward4 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward4 = true
			forward_touching_border = true
		else:
			enemy_forward4 = true
			forward_touching_border = false


func _on_forward_4_area_body_exited(body: Node2D) -> void:
	enemy_forward4 = false


func _on_forward_5_area_body_entered(body: Node2D) -> void:
	forward5_tile = body.tile
	forward5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward5 = true
			forward_touching_border = true
		else:
			enemy_forward5 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward5 = true
			forward_touching_border = true
		else:
			enemy_forward5 = true
			forward_touching_border = false


func _on_forward_5_area_body_exited(body: Node2D) -> void:
	enemy_forward5 = false	


func _on_forward_6_area_body_entered(body: Node2D) -> void:
	forward6_tile = body.tile
	forward6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward6 = true
			forward_touching_border = true
		else:
			enemy_forward6 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward6 = true
			forward_touching_border = true
		else:
			enemy_forward6 = true
			forward_touching_border = false
	

func _on_forward_6_area_body_exited(body: Node2D) -> void:
	enemy_forward6 = false


func _on_forward_7_area_body_entered(body: Node2D) -> void:
	forward7_tile = body.tile
	forward7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward7 = true
			forward_touching_border = true
		else:
			enemy_forward7 = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward7 = true
			forward_touching_border = true
		else:
			enemy_forward7 = true
			forward_touching_border = false


func _on_forward_7_area_body_exited(body: Node2D) -> void:
	enemy_forward7 = false

#endregion

#endregion
#region All the inputs for the Back markers.

	#region ALl the button signals


func _on_back_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
	#region All the collision signals


func _on_back_1_area_body_entered(body: Node2D) -> void:
	back1_tile = body.tile
	back1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back1 = true
			back_touching_border = true
		else:
			enemy_back1 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back1 = true
			back_touching_border = true
		else:
			enemy_back1 = true
			back_touching_border = false


func _on_back_1_area_body_exited(body: Node2D) -> void:
	enemy_back1 = false


func _on_back_2_area_body_entered(body: Node2D) -> void:
	back2_tile = body.tile
	back2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back2 = true
			back_touching_border = true
		else:
			enemy_back2 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back2 = true
			back_touching_border = true
		else:
			enemy_back2 = true
			back_touching_border = false



func _on_back_2_area_body_exited(body: Node2D) -> void:
	enemy_back2 = false


func _on_back_3_area_body_entered(body: Node2D) -> void:
	back3_tile = body.tile
	back3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back3 = true
			back_touching_border = true
		else:
			enemy_back3 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back3 = true
			back_touching_border = true
		else:
			enemy_back3 = true
			back_touching_border = false


func _on_back_3_area_body_exited(body: Node2D) -> void:
	enemy_back3 = false


func _on_back_4_area_body_entered(body: Node2D) -> void:
	back4_tile = body.tile
	back4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back4 = true
			back_touching_border = true
		else:
			enemy_back4 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back4 = true
			back_touching_border = true
		else:
			enemy_back4 = true
			back_touching_border = false



func _on_back_4_area_body_exited(body: Node2D) -> void:
	enemy_back4 = false


func _on_back_5_area_body_entered(body: Node2D) -> void:
	back5_tile = body.tile
	back5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back5 = true
			back_touching_border = true
		else:
			enemy_back5 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back5 = true
			back_touching_border = true
		else:
			enemy_back5 = true
			back_touching_border = false



func _on_back_5_area_body_exited(body: Node2D) -> void:
	enemy_back5 = false


func _on_back_6_area_body_entered(body: Node2D) -> void:
	back6_tile = body.tile
	back6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back6 = true
			back_touching_border = true
		else:
			enemy_back6 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back6 = true
			back_touching_border = true
		else:
			enemy_back6 = true
			back_touching_border = false



func _on_back_6_area_body_exited(body: Node2D) -> void:
	enemy_back6 = false


func _on_back_7_area_body_entered(body: Node2D) -> void:
	back7_tile = body.tile
	back7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back7 = true
			back_touching_border = true
		else:
			enemy_back7 = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back7 = true
			back_touching_border = true
		else:
			enemy_back7 = true
			back_touching_border = false



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
#region All the inputs for the Left markers.

	#region All the Button signals


func _on_left_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_left_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_left_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	castle_prevention()
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left7_tile # tells the global script that youre accessing tile X
	Globals.accessing_group = left7_tile_group
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
	#region All the Edge Collision signals

func _on_left_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left1 = true
	if(area.is_in_group("Tiles")):
		left1_tile = area.name
		left1_tile_group = str(area.name)[0]


func _on_left_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left2 = true
	if(area.is_in_group("Tiles")):
		left2_tile = area.name
		left2_tile_group = str(area.name)[0]


func _on_left_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left3 = true
	if(area.is_in_group("Tiles")):
		left3_tile = area.name
		left3_tile_group = str(area.name)[0]


func _on_left_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left4 = true
	if(area.is_in_group("Tiles")):
		left4_tile = area.name
		left4_tile_group = str(area.name)[0]


func _on_left_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left5 = true
	if(area.is_in_group("Tiles")):
		left5_tile = area.name
		left5_tile_group = str(area.name)[0]


func _on_left_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left6 = true
	if(area.is_in_group("Tiles")):
		left6_tile = area.name
		left6_tile_group = str(area.name)[0]


func _on_left_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left7 = true
	if(area.is_in_group("Tiles")):
		left7_tile = area.name
		left7_tile_group = str(area.name)[0]


func _on_left_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left7 = false


func _on_left_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left6 = false


func _on_left_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left5 = false


func _on_left_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left4 = false


func _on_left_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left3 = false


func _on_left_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left2 = false


func _on_left_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left1 = false

#endregion
	#region ALl collision signals


func _on_left_1_area_body_entered(body: Node2D) -> void:
	left1_tile = body.tile
	left1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left1 = true
			left_touching_border = true
		else:
			enemy_left1 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left1 = true
			left_touching_border = true
		else:
			enemy_left1 = true
			left_touching_border = false


func _on_left_1_area_body_exited(body: Node2D) -> void:
	enemy_left1 = false


func _on_left_2_area_body_entered(body: Node2D) -> void:
	left2_tile = body.tile
	left2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left2 = true
			left_touching_border = true
		else:
			enemy_left2 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left2 = true
			left_touching_border = true
		else:
			enemy_left2 = true
			left_touching_border = false


func _on_left_2_area_body_exited(body: Node2D) -> void:
	enemy_left2 = false


func _on_left_3_area_body_entered(body: Node2D) -> void:
	left3_tile = body.tile
	left3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left3 = true
			left_touching_border = true
		else:
			enemy_left3 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left3 = true
			left_touching_border = true
		else:
			enemy_left3 = true
			left_touching_border = false


func _on_left_3_area_body_exited(body: Node2D) -> void:
	enemy_left3 = false


func _on_left_4_area_body_entered(body: Node2D) -> void:
	left4_tile = body.tile
	left4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left4 = true
			left_touching_border = true
		else:
			enemy_left4 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left4 = true
			left_touching_border = true
		else:
			enemy_left4 = true
			left_touching_border = false


func _on_left_4_area_body_exited(body: Node2D) -> void:
	enemy_left4 = false


func _on_left_5_area_body_entered(body: Node2D) -> void:
	left5_tile = body.tile
	left5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left5 = true
			left_touching_border = true
		else:
			enemy_left5 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left5 = true
			left_touching_border = true
		else:
			enemy_left5 = true
			left_touching_border = false


func _on_left_5_area_body_exited(body: Node2D) -> void:
	enemy_left5 = false


func _on_left_6_area_body_entered(body: Node2D) -> void:
	left6_tile = body.tile
	left6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left6 = true
			left_touching_border = true
		else:
			enemy_left6 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left6 = true
			left_touching_border = true
		else:
			enemy_left6 = true
			left_touching_border = false


func _on_left_6_area_body_exited(body: Node2D) -> void:
	enemy_left6 = false


func _on_left_7_area_body_entered(body: Node2D) -> void:
	left7_tile = body.tile
	left7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_left7 = true
			left_touching_border = true
		else:
			enemy_left7 = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left7 = true
			left_touching_border = true
		else:
			enemy_left7 = true
			left_touching_border = false


func _on_left_7_area_body_exited(body: Node2D) -> void:
	enemy_left7 = false

#endregion

#endregion
#endregion
