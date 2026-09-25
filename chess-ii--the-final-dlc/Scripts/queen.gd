extends CharacterBody2D

var focused
var taking
var tile
var tile_group
var turn
var readd_markers

var raycast = []

#region border touch variables
#region right
var right1_touching_border
var right2_touching_border
var right3_touching_border
var right4_touching_border
var right5_touching_border
var right6_touching_border
var right7_touching_border

var right1_friendly_border
var right2_friendly_border
var right3_friendly_border
var right4_friendly_border
var right5_friendly_border
var right6_friendly_border
var right7_friendly_border
#endregion
#region forward
var forward1_touching_border
var forward2_touching_border
var forward3_touching_border
var forward4_touching_border
var forward5_touching_border
var forward6_touching_border
var forward7_touching_border

var forward1_friendly_border
var forward2_friendly_border
var forward3_friendly_border
var forward4_friendly_border
var forward5_friendly_border
var forward6_friendly_border
var forward7_friendly_border
#endregion
#region back

var back1_touching_border
var back2_touching_border
var back3_touching_border
var back4_touching_border
var back5_touching_border
var back6_touching_border
var back7_touching_border

var back1_friendly_border
var back2_friendly_border
var back3_friendly_border
var back4_friendly_border
var back5_friendly_border
var back6_friendly_border
var back7_friendly_border
#endregion
#region left
var left1_touching_border
var left2_touching_border
var left3_touching_border
var left4_touching_border
var left5_touching_border
var left6_touching_border
var left7_touching_border

var left1_friendly_border
var left2_friendly_border
var left3_friendly_border
var left4_friendly_border
var left5_friendly_border
var left6_friendly_border
var left7_friendly_border
#endregion
#region forward left
var fl1_touching_border
var fl2_touching_border
var fl3_touching_border
var fl4_touching_border
var fl5_touching_border
var fl6_touching_border
var fl7_touching_border

var fl1_friendly_border
var fl2_friendly_border
var fl3_friendly_border
var fl4_friendly_border
var fl5_friendly_border
var fl6_friendly_border
var fl7_friendly_border
#endregion
#region forward right
var fr1_touching_border
var fr2_touching_border
var fr3_touching_border
var fr4_touching_border
var fr5_touching_border
var fr6_touching_border
var fr7_touching_border

var fr1_friendly_border
var fr2_friendly_border
var fr3_friendly_border
var fr4_friendly_border
var fr5_friendly_border
var fr6_friendly_border
var fr7_friendly_border
#endregion
#region back left
var bl1_touching_border
var bl2_touching_border
var bl3_touching_border
var bl4_touching_border
var bl5_touching_border
var bl6_touching_border
var bl7_touching_border

var bl1_friendly_border
var bl2_friendly_border
var bl3_friendly_border
var bl4_friendly_border
var bl5_friendly_border
var bl6_friendly_border
var bl7_friendly_border

#endregion
#region back right
var br1_touching_border
var br2_touching_border
var br3_touching_border
var br4_touching_border
var br5_touching_border
var br6_touching_border
var br7_touching_border
var br1_friendly_border
var br2_friendly_border
var br3_friendly_border
var br4_friendly_border
var br5_friendly_border
var br6_friendly_border
var br7_friendly_border
#endregion
#endregion

#region all the "enemy in way" variables.

	#region Basics (Forward, Back, Left, Right)
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

var enemy_left1
var enemy_left2
var enemy_left3
var enemy_left4
var enemy_left5
var enemy_left6
var enemy_left7

#endregion

	#region Diagonals (FR, FL, DR, DL)

var enemyfr_1
var enemyfr_2
var enemyfr_3
var enemyfr_4
var enemyfr_5
var enemyfr_6
var enemyfr_7

var enemyfl_1
var enemyfl_2
var enemyfl_3
var enemyfl_4
var enemyfl_5
var enemyfl_6
var enemyfl_7

var enemybl_1
var enemybl_2
var enemybl_3
var enemybl_4
var enemybl_5
var enemybl_6
var enemybl_7

var enemybr_1
var enemybr_2
var enemybr_3
var enemybr_4
var enemybr_5
var enemybr_6
var enemybr_7


#endregion

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

#endregion
#region Forward-Right Diagonal

var fr1_tile
var fr2_tile
var fr3_tile
var fr4_tile
var fr5_tile
var fr6_tile
var fr7_tile

var fr1_tile_group
var fr2_tile_group
var fr3_tile_group
var fr4_tile_group
var fr5_tile_group
var fr6_tile_group
var fr7_tile_group

#endregion
#region Forward-Left Diagonal
var fl1_tile
var fl2_tile
var fl3_tile
var fl4_tile
var fl5_tile
var fl6_tile
var fl7_tile

var fl1_tile_group
var fl2_tile_group
var fl3_tile_group
var fl4_tile_group
var fl5_tile_group
var fl6_tile_group
var fl7_tile_group


#endregion
#region Back-Right Diagonal

var br1_tile
var br2_tile
var br3_tile
var br4_tile
var br5_tile
var br6_tile
var br7_tile

var br1_tile_group
var br2_tile_group
var br3_tile_group
var br4_tile_group
var br5_tile_group
var br6_tile_group
var br7_tile_group

#endregion
#region Back-Left Diagonal

var bl1_tile
var bl2_tile
var bl3_tile
var bl4_tile
var bl5_tile
var bl6_tile
var bl7_tile

var bl1_tile_group
var bl2_tile_group
var bl3_tile_group
var bl4_tile_group
var bl5_tile_group
var bl6_tile_group
var bl7_tile_group


#endregion

#endregion

func _ready() -> void:
	focused = false
	readd_markers = true
	raycast = [$MovementMarkers/RightRaycast, $MovementMarkers/LeftRaycast, $MovementMarkers/ForwardRaycast, $MovementMarkers/BackRaycast,$MovementMarkers/RightForwardRaycast,  $MovementMarkers/LeftForwardRaycast, $MovementMarkers/RightBackRaycast, $MovementMarkers/LeftBackRaycast]

func _process(delta: float) -> void:
	# re add markers so they come back in the scene 1 by 1 and they detect the things so we can get king checking and etc
	if(readd_markers):
		$MovementMarkers.visible = false
		#region forward
		var forward1marker = $MovementMarkers/Forward/Forward1
		var forward2marker = $MovementMarkers/Forward/Forward2
		var forward3marker = $MovementMarkers/Forward/Forward3
		var forward4marker = $MovementMarkers/Forward/Forward4
		var forward5marker = $MovementMarkers/Forward/Forward5
		var forward6marker = $MovementMarkers/Forward/Forward6
		var forward7marker = $MovementMarkers/Forward/Forward7
		var forward1pos = $MovementMarkers/Forward/Forward1.global_position
		var forward2pos = $MovementMarkers/Forward/Forward2.global_position
		var forward3pos = $MovementMarkers/Forward/Forward3.global_position
		var forward4pos = $MovementMarkers/Forward/Forward4.global_position
		var forward5pos = $MovementMarkers/Forward/Forward5.global_position
		var forward6pos = $MovementMarkers/Forward/Forward6.global_position
		var forward7pos = $MovementMarkers/Forward/Forward7.global_position
		
		# forward 1
		forward1marker.get_parent().remove_child(forward1marker)
		$MovementMarkers/Forward.add_child(forward1marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward1marker.global_position = forward1pos
		
		# forward 2
		forward2marker.get_parent().remove_child(forward2marker)
		$MovementMarkers/Forward.add_child(forward2marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward2marker.global_position = forward2pos
		
		# forward 3
		forward3marker.get_parent().remove_child(forward3marker)
		$MovementMarkers/Forward.add_child(forward3marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward3marker.global_position = forward3pos
		
		# forward 4
		forward4marker.get_parent().remove_child(forward4marker)
		$MovementMarkers/Forward.add_child(forward4marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward4marker.global_position = forward4pos
		
		# forward 5
		forward5marker.get_parent().remove_child(forward5marker)
		$MovementMarkers/Forward.add_child(forward5marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward5marker.global_position = forward5pos
		
		# forward 6
		forward6marker.get_parent().remove_child(forward6marker)
		$MovementMarkers/Forward.add_child(forward6marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward6marker.global_position = forward6pos
		
		# forward 7
		forward7marker.get_parent().remove_child(forward7marker)
		$MovementMarkers/Forward.add_child(forward7marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		forward7marker.global_position = forward7pos
		
		#endregion
		#region back
		var back1pos = $MovementMarkers/Back/Back1.global_position
		var back2pos = $MovementMarkers/Back/Back2.global_position
		var back3pos = $MovementMarkers/Back/Back3.global_position
		var back4pos = $MovementMarkers/Back/Back4.global_position
		var back5pos = $MovementMarkers/Back/Back5.global_position
		var back6pos = $MovementMarkers/Back/Back6.global_position
		var back7pos = $MovementMarkers/Back/Back7.global_position
		var back1marker = $MovementMarkers/Back/Back1
		var back2marker = $MovementMarkers/Back/Back2
		var back3marker = $MovementMarkers/Back/Back3
		var back4marker = $MovementMarkers/Back/Back4
		var back5marker = $MovementMarkers/Back/Back5
		var back6marker = $MovementMarkers/Back/Back6
		var back7marker = $MovementMarkers/Back/Back7
		
		# back 1
		back1marker.get_parent().remove_child(back1marker)
		$MovementMarkers/Back.add_child(back1marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back1marker.global_position = back1pos
		# back 2
		back2marker.get_parent().remove_child(back2marker)
		$MovementMarkers/Back.add_child(back2marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back2marker.global_position = back2pos
		# back 3
		back3marker.get_parent().remove_child(back3marker)
		$MovementMarkers/Back.add_child(back3marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back3marker.global_position = back3pos
		# baclk 4
		back4marker.get_parent().remove_child(back4marker)
		$MovementMarkers/Back.add_child(back4marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back4marker.global_position = back4pos
		# back 5
		back5marker.get_parent().remove_child(back5marker)
		$MovementMarkers/Back.add_child(back5marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back5marker.global_position = back5pos
		# back 6
		back6marker.get_parent().remove_child(back6marker)
		$MovementMarkers/Back.add_child(back6marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back6marker.global_position = back6pos
		# back 7
		back7marker.get_parent().remove_child(back7marker)
		$MovementMarkers/Back.add_child(back7marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		back7marker.global_position = back7pos
		#endregion
		#region left
		var left1marker = $MovementMarkers/Left/Left1
		var left2marker = $MovementMarkers/Left/Left2
		var left3marker = $MovementMarkers/Left/Left3
		var left4marker = $MovementMarkers/Left/Left4
		var left5marker = $MovementMarkers/Left/Left5
		var left6marker = $MovementMarkers/Left/Left6
		var left7marker = $MovementMarkers/Left/Left7
		var left1pos = $MovementMarkers/Left/Left1.global_position
		var left2pos = $MovementMarkers/Left/Left2.global_position
		var left3pos = $MovementMarkers/Left/Left3.global_position
		var left4pos = $MovementMarkers/Left/Left4.global_position
		var left5pos = $MovementMarkers/Left/Left5.global_position
		var left6pos = $MovementMarkers/Left/Left6.global_position
		var left7pos = $MovementMarkers/Left/Left7.global_position
		# left 1
		left1marker.get_parent().remove_child(left1marker)
		$MovementMarkers/Left.add_child(left1marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left1marker.global_position = left1pos
		# left 2
		left2marker.get_parent().remove_child(left2marker)
		$MovementMarkers/Left.add_child(left2marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left2marker.global_position = left2pos
		# left 3
		left3marker.get_parent().remove_child(left3marker)
		$MovementMarkers/Left.add_child(left3marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left3marker.global_position = left3pos
		# left 4
		left4marker.get_parent().remove_child(left4marker)
		$MovementMarkers/Left.add_child(left4marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left4marker.global_position = left4pos
		# left 5
		left5marker.get_parent().remove_child(left5marker)
		$MovementMarkers/Left.add_child(left5marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left5marker.global_position = left5pos
		# left 6
		left6marker.get_parent().remove_child(left6marker)
		$MovementMarkers/Left.add_child(left6marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left6marker.global_position = left6pos
		# left 7
		left7marker.get_parent().remove_child(left7marker)
		$MovementMarkers/Left.add_child(left7marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		left7marker.global_position = left7pos
		#endregion
		#region right
		var right1marker = $MovementMarkers/Right/Right1
		var right2marker = $MovementMarkers/Right/Right2
		var right3marker = $MovementMarkers/Right/Right3
		var right4marker = $MovementMarkers/Right/Right4
		var right5marker = $MovementMarkers/Right/Right5
		var right6marker = $MovementMarkers/Right/Right6
		var right7marker = $MovementMarkers/Right/Right7
		var right1pos = $MovementMarkers/Right/Right1.global_position
		var right2pos = $MovementMarkers/Right/Right2.global_position
		var right3pos = $MovementMarkers/Right/Right3.global_position
		var right4pos = $MovementMarkers/Right/Right4.global_position
		var right5pos = $MovementMarkers/Right/Right5.global_position
		var right6pos = $MovementMarkers/Right/Right6.global_position
		var right7pos = $MovementMarkers/Right/Right7.global_position
		# right 1
		right1marker.get_parent().remove_child(right1marker)
		$MovementMarkers/Right.add_child(right1marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right1marker.global_position = right1pos
		# left 2
		right2marker.get_parent().remove_child(right2marker)
		$MovementMarkers/Right.add_child(right2marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right2marker.global_position = right2pos
		# left 3
		right3marker.get_parent().remove_child(right3marker)
		$MovementMarkers/Right.add_child(right3marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right3marker.global_position = right3pos
		# left 4
		right4marker.get_parent().remove_child(right4marker)
		$MovementMarkers/Right.add_child(right4marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right4marker.global_position = right4pos
		# left 5
		right5marker.get_parent().remove_child(right5marker)
		$MovementMarkers/Right.add_child(right5marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right5marker.global_position = right5pos
		# left 6
		right6marker.get_parent().remove_child(right6marker)
		$MovementMarkers/Right.add_child(right6marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right6marker.global_position = right6pos
		# left 7
		right7marker.get_parent().remove_child(right7marker)
		$MovementMarkers/Right.add_child(right7marker)
		$MovementMarkers.visible = false
		await get_tree().process_frame
		right7marker.global_position = right7pos
		#endregion
	
		readd_markers = false
		return
	# if the focused piece is this piece then the focused variable becomes true so this piece can do its magic
	if(Globals.piece_focused == self):
		focused = true
	else:
		focused = false
	# center the movement markers
	$MovementMarkers.global_position = global_position
	# if this piece is black and the turn is blacks turn or if its white and the turn is whites turn:
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		# make it so you can click on le button
		$SelectQueen.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			# taking means that this piece, when interacting with another piece, will take it instead of dying
			taking = true
			# one makes everything true and one makes everything false so if the king is in check then instead of setting everything to true and then eliminates them, we set it all to false and readd them.
			#region making everything true outside of checks.
			if(self.is_in_group("White") && !Globals.white_in_check || self.is_in_group("Black") && !Globals.black_in_check):
				if(!readd_markers):
					#region right
					$MovementMarkers.visible = true
					$MovementMarkers/Right.visible = true
					$MovementMarkers/Right/Right1.visible = true
					$MovementMarkers/Right/Right2.visible = true
					$MovementMarkers/Right/Right3.visible = true
					$MovementMarkers/Right/Right4.visible = true
					$MovementMarkers/Right/Right5.visible = true
					$MovementMarkers/Right/Right6.visible = true
					$MovementMarkers/Right/Right7.visible = true
					
					#endregion
					#region forward
					$MovementMarkers/Forward.visible = true
					$MovementMarkers/Forward/Forward1.visible = true
					$MovementMarkers/Forward/Forward2.visible = true
					$MovementMarkers/Forward/Forward3.visible = true
					$MovementMarkers/Forward/Forward4.visible = true
					$MovementMarkers/Forward/Forward5.visible = true
					$MovementMarkers/Forward/Forward6.visible = true
					$MovementMarkers/Forward/Forward7.visible = true
					
					#endregion
					#region back
					$MovementMarkers/Back.visible = true
					$MovementMarkers/Back/Back1.visible = true
					$MovementMarkers/Back/Back2.visible = true
					$MovementMarkers/Back/Back3.visible = true
					$MovementMarkers/Back/Back4.visible = true
					$MovementMarkers/Back/Back5.visible = true
					$MovementMarkers/Back/Back6.visible = true

					$MovementMarkers/Back/Back7.visible = true
					#endregion
					#region left
					$MovementMarkers/Left.visible = true
					$MovementMarkers/Left/Left1.visible = true
					$MovementMarkers/Left/Left2.visible = true
					$MovementMarkers/Left/Left3.visible = true
					$MovementMarkers/Left/Left4.visible = true
					$MovementMarkers/Left/Left5.visible = true
					$MovementMarkers/Left/Left6.visible = true
					$MovementMarkers/Left/Left7.visible = true
					#endregion
					#region forward right
					$MovementMarkers/DiagonalRightForward.visible = true
					$MovementMarkers/DiagonalRightForward/FR1.visible = true
					$MovementMarkers/DiagonalRightForward/FR2.visible = true
					$MovementMarkers/DiagonalRightForward/FR3.visible = true
					$MovementMarkers/DiagonalRightForward/FR4.visible = true
					$MovementMarkers/DiagonalRightForward/FR5.visible = true
					$MovementMarkers/DiagonalRightForward/FR6.visible = true
					$MovementMarkers/DiagonalRightForward/FR7.visible = true
					#endregion
					#region forward left
					$MovementMarkers/DiagonalLeftFoward.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL1.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL2.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = true
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = true
					#endregion
					#region right back
					$MovementMarkers/DiagonalRightBack.visible = true
					$MovementMarkers/DiagonalRightBack/BR1.visible = true
					$MovementMarkers/DiagonalRightBack/BR2.visible = true
					$MovementMarkers/DiagonalRightBack/BR3.visible = true
					$MovementMarkers/DiagonalRightBack/BR4.visible = true
					$MovementMarkers/DiagonalRightBack/BR5.visible = true
					$MovementMarkers/DiagonalRightBack/BR6.visible = true
					$MovementMarkers/DiagonalRightBack/BR7.visible = true
					#endregion
					#region back left
					$MovementMarkers/DiagonalLeftBack.visible = true
					$MovementMarkers/DiagonalLeftBack/BL1.visible = true
					$MovementMarkers/DiagonalLeftBack/BL2.visible = true
					$MovementMarkers/DiagonalLeftBack/BL3.visible = true
					$MovementMarkers/DiagonalLeftBack/BL4.visible = true
					$MovementMarkers/DiagonalLeftBack/BL5.visible = true
					$MovementMarkers/DiagonalLeftBack/BL6.visible = true
					$MovementMarkers/DiagonalLeftBack/BL7.visible = true
			#endregion
			#endregion
			#region making everything false during of checks.
			if(self.is_in_group("White") && Globals.white_in_check || self.is_in_group("Black") && Globals.black_in_check):
				#region right
				$MovementMarkers.visible = false
				$MovementMarkers/Right.visible = false
				$MovementMarkers/Right/Right1.visible = false
				$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
				
				#endregion
				#region forward
				$MovementMarkers/Forward.visible = false
				$MovementMarkers/Forward/Forward1.visible = false
				$MovementMarkers/Forward/Forward2.visible = false
				$MovementMarkers/Forward/Forward3.visible = false
				$MovementMarkers/Forward/Forward4.visible = false
				$MovementMarkers/Forward/Forward5.visible = false
				$MovementMarkers/Forward/Forward6.visible = false
				$MovementMarkers/Forward/Forward7.visible = false
				
				#endregion
				#region back
				$MovementMarkers/Back.visible = false
				$MovementMarkers/Back/Back1.visible = false
				$MovementMarkers/Back/Back2.visible = false
				$MovementMarkers/Back/Back3.visible = false
				$MovementMarkers/Back/Back4.visible = false
				$MovementMarkers/Back/Back5.visible = false
				$MovementMarkers/Back/Back6.visible = false

				$MovementMarkers/Back/Back7.visible = true
				#endregion
				#region left
				$MovementMarkers/Left.visible = false
				$MovementMarkers/Left/Left1.visible = false
				$MovementMarkers/Left/Left2.visible = false
				$MovementMarkers/Left/Left3.visible = false
				$MovementMarkers/Left/Left4.visible = false
				$MovementMarkers/Left/Left5.visible = false
				$MovementMarkers/Left/Left6.visible = false
				$MovementMarkers/Left/Left7.visible = false
				#endregion
				#region forward right
				$MovementMarkers/DiagonalRightForward.visible = false
				$MovementMarkers/DiagonalRightForward/FR1.visible = false
				$MovementMarkers/DiagonalRightForward/FR2.visible = false
				$MovementMarkers/DiagonalRightForward/FR3.visible = false
				$MovementMarkers/DiagonalRightForward/FR4.visible = false
				$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
				#endregion
				#region forward left
				$MovementMarkers/DiagonalLeftFoward.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL1.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				#endregion
				#region right back
				$MovementMarkers/DiagonalRightBack.visible = false
				$MovementMarkers/DiagonalRightBack/BR1.visible = false
				$MovementMarkers/DiagonalRightBack/BR2.visible = false
				$MovementMarkers/DiagonalRightBack/BR3.visible = false
				$MovementMarkers/DiagonalRightBack/BR4.visible = false
				$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
				#endregion
				#region back left
				$MovementMarkers/DiagonalLeftBack.visible = false
				$MovementMarkers/DiagonalLeftBack/BL1.visible = false
				$MovementMarkers/DiagonalLeftBack/BL2.visible = false
				$MovementMarkers/DiagonalLeftBack/BL3.visible = false
				$MovementMarkers/DiagonalLeftBack/BL4.visible = false
				$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			#endregion
			#endregion
			if(self.is_in_group("White") && !Globals.white_in_check || self.is_in_group("Black") && !Globals.black_in_check):
			# when the king is not in check eliminate the places you can move to
				#region Right Movement Marker Visibility Control
			
				if(enemy_right7):
					if(right7_touching_border || right7_friendly_border):
						$MovementMarkers/Right/Right7.visible = false
					else:
						pass
				if(enemy_right6):
					if(right6_touching_border || right6_friendly_border):
						$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right5):
					if(right5_touching_border || right5_friendly_border):
						$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right4):
					if(right4_touching_border || right4_friendly_border):
						$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right3):
					if(right3_touching_border || right3_friendly_border):
						$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right2):
					if(right2_touching_border || right2_friendly_border):
						$MovementMarkers/Right/Right2.visible = false
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right1):
					if(right1_touching_border || right1_friendly_border):
						$MovementMarkers/Right/Right1.visible = false
					$MovementMarkers/Right/Right2.visible = false
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
						#endregion
				#region Forward Movement Marker Visibility Control
				
				if(enemy_forward7):
					if(forward7_touching_border || forward7_friendly_border):
						$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward6):
					if(forward6_touching_border || forward6_friendly_border):
						$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward5):
					if(forward5_touching_border || forward5_friendly_border):
						$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward4):
					if(forward4_touching_border || forward4_friendly_border):
						$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward3):
					if(forward3_touching_border || forward3_friendly_border):
						$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward2):
					if(forward2_touching_border || forward2_friendly_border):
						$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward1):
					if(forward1_touching_border || forward1_friendly_border):
						$MovementMarkers/Forward/Forward1.visible = false
					$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
						#endregion
				#region Back Movement Marker Visibility Control
				
				if(enemy_back7):
					if(back7_touching_border || back7_friendly_border):
						$MovementMarkers/Back/Back7.visible = false
				if(enemy_back6):
					if(back6_touching_border || back6_friendly_border):
						$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back5):
					if(back5_touching_border || back5_friendly_border):
						$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back4):
					if(back4_touching_border || back4_friendly_border):
						$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back3):
					if(back3_touching_border || back3_friendly_border):
						$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back2):
					if(back2_touching_border || back2_friendly_border):
						$MovementMarkers/Back/Back2.visible = false
					$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back1):
					if(back1_touching_border || back1_friendly_border):
						$MovementMarkers/Back/Back1.visible = false
					$MovementMarkers/Back/Back2.visible = false
					$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
						#endregion
				#region Left Movement Marker Visibility Control
				
				if(enemy_left7):
					if(left7_touching_border || left7_friendly_border):
						$MovementMarkers/Left/Left7.visible = false
				if(enemy_left6):
					if(left6_touching_border || left6_friendly_border):
						$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left5):
					if(left5_touching_border || left5_friendly_border):
						$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left4):
					if(left4_touching_border || left4_friendly_border):
						$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left3):
					if(left3_touching_border || left3_friendly_border):
						$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left2):
					if(left2_touching_border || left2_friendly_border):
						$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left1):
					if(left1_touching_border || left2_friendly_border):
						$MovementMarkers/Left/Left1.visible = false
					$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
					#endregion
				#region Forward-Right Movement Marker Visibility Control
				
				if(enemyfr_7):
					if(fr7_touching_border || fr7_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR7.visible = false
					else:
						pass
				if(enemyfr_6):
					if(fr6_touching_border || fr6_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_5):
					if(fr5_touching_border || fr5_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_4):
					if(fr4_touching_border || fr4_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_3):
					if(fr3_touching_border || fr3_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_2):
					if(fr2_touching_border || fr2_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR2.visible = false
					$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_1):
					if(fr1_touching_border || fr1_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR1.visible = false
					$MovementMarkers/DiagonalRightForward/FR2.visible = false
					$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				#endregion
				#region Forward-Left Movement Marker Visibility Control
				if(enemyfl_7):
					if(fl7_touching_border || fr7_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
					else:
						pass
				if(enemyfl_6):
					if(fl6_touching_border || fr6_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_5):
					if(fl5_touching_border || fr5_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_4):
					if(fl4_touching_border || fr4_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_3):
					if(fl3_touching_border || fr3_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_2):
					if(fl2_touching_border || fr2_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_1):
					if(fl1_touching_border || fr1_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL1.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				
				#endregion
				#region Back-Right Movement Marker Visibility Control
				
				if(enemybr_7):
					if(br7_touching_border || br7_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR7.visible = false
					else:
						pass
				if(enemybr_6):
					if(br6_touching_border || br6_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_5):
					if(br5_touching_border || br5_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_4):
					if(br4_touching_border || br4_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_3):
					if(br3_touching_border || br3_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_2):
					if(br2_touching_border || br2_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR2.visible = false
					$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_1):
					if(br1_touching_border || br1_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR1.visible = false
					$MovementMarkers/DiagonalRightBack/BR2.visible = false
					$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
					#endregion
				#region Back-Left Movement Markers Visibility Control
				if(enemybl_7):
					if(bl7_touching_border || bl7_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL7.visible = false
					else:
						pass
				if(enemybl_6):
					if(bl6_touching_border  || bl6_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_5):
					if(bl5_touching_border || bl5_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_4):
					if(bl4_touching_border || bl4_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_3):
					if(bl3_touching_border || bl3_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_2):
					if(bl2_touching_border || bl2_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL2.visible = false
					$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_1):
					if(bl1_touching_border || bl1_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL1.visible = false
					$MovementMarkers/DiagonalLeftBack/BL2.visible = false
					$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				#endregion
			if(self.is_in_group("White") && Globals.white_in_check || self.is_in_group("Black") && Globals.black_in_check):
				#when the king is in check add the places you can move to
				#region Right Movement Marker Visibility Control
			
				if(enemy_right7):
					if(right7_touching_border || right7_friendly_border):
						$MovementMarkers/Right/Right7.visible = false
					else:
						pass
				if(enemy_right6):
					if(right6_touching_border || right6_friendly_border):
						$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right5):
					if(right5_touching_border || right5_friendly_border):
						$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right4):
					if(right4_touching_border || right4_friendly_border):
						$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right3):
					if(right3_touching_border || right3_friendly_border):
						$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right2):
					if(right2_touching_border || right2_friendly_border):
						$MovementMarkers/Right/Right2.visible = false
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
				if(enemy_right1):
					if(right1_touching_border || right1_friendly_border):
						$MovementMarkers/Right/Right1.visible = false
					$MovementMarkers/Right/Right2.visible = false
					$MovementMarkers/Right/Right3.visible = false
					$MovementMarkers/Right/Right4.visible = false
					$MovementMarkers/Right/Right5.visible = false
					$MovementMarkers/Right/Right6.visible = false
					$MovementMarkers/Right/Right7.visible = false
						#endregion
				#region Forward Movement Marker Visibility Control
				
				if(enemy_forward7):
					if(forward7_touching_border || forward7_friendly_border):
						$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward6):
					if(forward6_touching_border || forward6_friendly_border):
						$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward5):
					if(forward5_touching_border || forward5_friendly_border):
						$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward4):
					if(forward4_touching_border || forward4_friendly_border):
						$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward3):
					if(forward3_touching_border || forward3_friendly_border):
						$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward2):
					if(forward2_touching_border || forward2_friendly_border):
						$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
				if(enemy_forward1):
					if(forward1_touching_border || forward1_friendly_border):
						$MovementMarkers/Forward/Forward1.visible = false
					$MovementMarkers/Forward/Forward2.visible = false
					$MovementMarkers/Forward/Forward3.visible = false
					$MovementMarkers/Forward/Forward4.visible = false
					$MovementMarkers/Forward/Forward5.visible = false
					$MovementMarkers/Forward/Forward6.visible = false
					$MovementMarkers/Forward/Forward7.visible = false
						#endregion
				#region Back Movement Marker Visibility Control
				
				if(enemy_back7):
					if(back7_touching_border || back7_friendly_border):
						$MovementMarkers/Back/Back7.visible = false
				if(enemy_back6):
					if(back6_touching_border || back6_friendly_border):
						$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back5):
					if(back5_touching_border || back5_friendly_border):
						$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back4):
					if(back4_touching_border || back4_friendly_border):
						$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back3):
					if(back3_touching_border || back3_friendly_border):
						$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back2):
					if(back2_touching_border || back2_friendly_border):
						$MovementMarkers/Back/Back2.visible = false
					$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
				if(enemy_back1):
					if(back1_touching_border || back1_friendly_border):
						$MovementMarkers/Back/Back1.visible = false
					$MovementMarkers/Back/Back2.visible = false
					$MovementMarkers/Back/Back3.visible = false
					$MovementMarkers/Back/Back4.visible = false
					$MovementMarkers/Back/Back5.visible = false
					$MovementMarkers/Back/Back6.visible = false
					$MovementMarkers/Back/Back7.visible = false
						#endregion
				#region Left Movement Marker Visibility Control
				
				if(enemy_left7):
					if(left7_touching_border || left7_friendly_border):
						$MovementMarkers/Left/Left7.visible = false
				if(enemy_left6):
					if(left6_touching_border || left6_friendly_border):
						$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left5):
					if(left5_touching_border || left5_friendly_border):
						$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left4):
					if(left4_touching_border || left4_friendly_border):
						$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left3):
					if(left3_touching_border || left3_friendly_border):
						$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left2):
					if(left2_touching_border || left2_friendly_border):
						$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
				if(enemy_left1):
					if(left1_touching_border || left2_friendly_border):
						$MovementMarkers/Left/Left1.visible = false
					$MovementMarkers/Left/Left2.visible = false
					$MovementMarkers/Left/Left3.visible = false
					$MovementMarkers/Left/Left4.visible = false
					$MovementMarkers/Left/Left5.visible = false
					$MovementMarkers/Left/Left6.visible = false
					$MovementMarkers/Left/Left7.visible = false
					#endregion
				#region Forward-Right Movement Marker Visibility Control
				
				if(enemyfr_7):
					if(fr7_touching_border || fr7_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR7.visible = false
					else:
						pass
				if(enemyfr_6):
					if(fr6_touching_border || fr6_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_5):
					if(fr5_touching_border || fr5_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_4):
					if(fr4_touching_border || fr4_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_3):
					if(fr3_touching_border || fr3_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_2):
					if(fr2_touching_border || fr2_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR2.visible = false
					$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				if(enemyfr_1):
					if(fr1_touching_border || fr1_friendly_border):
						$MovementMarkers/DiagonalRightForward/FR1.visible = false
					$MovementMarkers/DiagonalRightForward/FR2.visible = false
					$MovementMarkers/DiagonalRightForward/FR3.visible = false
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				#endregion
				#region Forward-Left Movement Marker Visibility Control
				if(enemyfl_7):
					if(fl7_touching_border || fr7_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
					else:
						pass
				if(enemyfl_6):
					if(fl6_touching_border || fr6_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_5):
					if(fl5_touching_border || fr5_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_4):
					if(fl4_touching_border || fr4_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_3):
					if(fl3_touching_border || fr3_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_2):
					if(fl2_touching_border || fr2_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				if(enemyfl_1):
					if(fl1_touching_border || fr1_friendly_border):
						$MovementMarkers/DiagonalLeftFoward/FL1.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				
				#endregion
				#region Back-Right Movement Marker Visibility Control
				
				if(enemybr_7):
					if(br7_touching_border || br7_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR7.visible = false
					else:
						pass
				if(enemybr_6):
					if(br6_touching_border || br6_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_5):
					if(br5_touching_border || br5_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_4):
					if(br4_touching_border || br4_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_3):
					if(br3_touching_border || br3_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_2):
					if(br2_touching_border || br2_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR2.visible = false
					$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				if(enemybr_1):
					if(br1_touching_border || br1_friendly_border):
						$MovementMarkers/DiagonalRightBack/BR1.visible = false
					$MovementMarkers/DiagonalRightBack/BR2.visible = false
					$MovementMarkers/DiagonalRightBack/BR3.visible = false
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
					#endregion
				#region Back-Left Movement Markers Visibility Control
				if(enemybl_7):
					if(bl7_touching_border || bl7_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL7.visible = false
					else:
						pass
				if(enemybl_6):
					if(bl6_touching_border  || bl6_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_5):
					if(bl5_touching_border || bl5_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_4):
					if(bl4_touching_border || bl4_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_3):
					if(bl3_touching_border || bl3_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_2):
					if(bl2_touching_border || bl2_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL2.visible = false
					$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				if(enemybl_1):
					if(bl1_touching_border || bl1_friendly_border):
						$MovementMarkers/DiagonalLeftBack/BL1.visible = false
					$MovementMarkers/DiagonalLeftBack/BL2.visible = false
					$MovementMarkers/DiagonalLeftBack/BL3.visible = false
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				#endregion

		elif(!focused):
			z_index = 1
			$MovementMarkers.visible = false
	else:
		$MovementMarkers.visible = false
		focused = false

func _on_select_queen_button_up() -> void:
	if(Globals.turn_tracking == 0 && self.is_in_group("Black") || Globals.turn_tracking == 1 && self.is_in_group("White")):
		if(Globals.piece_focused != self):
			Globals.piece_focused = self
			focused = true
			readd_markers = true
		else:
			Globals.piece_focused = null
			focused = false

func _on_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]

func _on_collision_area_body_entered(body: Node2D) -> void:
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

func reset_markers():

	#region forward
	
	forward1_friendly_border = false
	forward2_friendly_border = false
	forward3_friendly_border = false
	forward4_friendly_border = false
	forward5_friendly_border = false
	forward6_friendly_border = false
	forward7_friendly_border = false
	
	forward1_touching_border = false
	forward2_touching_border = false
	forward3_touching_border = false
	forward4_touching_border = false
	forward5_touching_border = false
	forward6_touching_border = false
	forward7_touching_border = false
	
	enemy_forward1 = false
	enemy_forward2 = false
	enemy_forward3 = false
	enemy_forward4 = false
	enemy_forward5 = false
	enemy_forward6 = false
	enemy_forward7 = false
	
	#endregion
	#region back
	
	back1_friendly_border = false
	back2_friendly_border = false
	back3_friendly_border = false
	back4_friendly_border = false
	back5_friendly_border = false
	back6_friendly_border = false
	back7_friendly_border = false
	
	back1_touching_border = false
	back2_touching_border = false
	back3_touching_border = false
	back4_touching_border = false
	back5_touching_border = false
	back6_touching_border = false
	back7_touching_border = false
	
	enemy_back1 = false
	enemy_back2 = false
	enemy_back3 = false
	enemy_back4 = false
	enemy_back5 = false
	enemy_back6 = false
	enemy_back7 = false
	
	#endregion
	#region left
	
	left1_friendly_border = false
	left2_friendly_border = false
	left3_friendly_border = false
	left4_friendly_border = false
	left5_friendly_border = false
	left6_friendly_border = false
	left7_friendly_border = false
	
	left1_touching_border = false
	left2_touching_border = false
	left3_touching_border = false
	left4_touching_border = false
	left5_touching_border = false
	left6_touching_border = false
	left7_touching_border = false
	
	enemy_left1 = false
	enemy_left2 = false
	enemy_left3 = false
	enemy_left4 = false
	enemy_left5 = false
	enemy_left6 = false
	enemy_left7 = false
	
	#endregion
	#region right
	
	right1_friendly_border = false
	right2_friendly_border = false
	right3_friendly_border = false
	right4_friendly_border = false
	right5_friendly_border = false
	right6_friendly_border = false
	right7_friendly_border = false
	
	right1_touching_border = false
	right2_touching_border = false
	right3_touching_border = false
	right4_touching_border = false
	right5_touching_border = false
	right6_touching_border = false
	right7_touching_border = false
	
	enemy_right1 = false
	enemy_right2 = false
	enemy_right3 = false
	enemy_right4 = false
	enemy_right5 = false
	enemy_right6 = false
	enemy_right7 = false
	
	#endregion
	#region forward right
	
	fr1_friendly_border = false
	fr2_friendly_border = false
	fr3_friendly_border = false
	fr4_friendly_border = false
	fr5_friendly_border = false
	fr6_friendly_border = false
	fr7_friendly_border = false
	
	fr1_touching_border = false
	fr2_touching_border = false
	fr3_touching_border = false
	fr4_touching_border = false
	fr5_touching_border = false
	fr6_touching_border = false
	fr7_touching_border = false
	
	enemyfr_1 = false
	enemyfr_2 = false
	enemyfr_3 = false
	enemyfr_4 = false
	enemyfr_5 = false
	enemyfr_6 = false
	enemyfr_7 = false
	
	#endregion
	#region forward left
	
	fl1_friendly_border = false
	fl2_friendly_border = false
	fl3_friendly_border = false
	fl4_friendly_border = false
	fl5_friendly_border = false
	fl6_friendly_border = false
	fl7_friendly_border = false
	
	fl1_touching_border = false
	fl2_touching_border = false
	fl3_touching_border = false
	fl4_touching_border = false
	fl5_touching_border = false
	fl6_touching_border = false
	fl7_touching_border = false
	
	enemyfl_1 = false
	enemyfl_2 = false
	enemyfl_3 = false
	enemyfl_4 = false
	enemyfl_5 = false
	enemyfl_6 = false
	enemyfl_7 = false
	
	#endregion
	#region back right
	
	br1_friendly_border = false
	br2_friendly_border = false
	br3_friendly_border = false
	br4_friendly_border = false
	br5_friendly_border = false
	br6_friendly_border = false
	br7_friendly_border = false
	
	br1_touching_border = false
	br2_touching_border = false
	br3_touching_border = false
	br4_touching_border = false
	br5_touching_border = false
	br6_touching_border = false
	br7_touching_border = false
	
	enemybr_1 = false
	enemybr_2 = false
	enemybr_3 = false
	enemybr_4 = false
	enemybr_5 = false
	enemybr_6 = false
	enemybr_7 = false
	
	
	#endregion
	#region back left
	
	bl1_friendly_border = false
	bl2_friendly_border = false
	bl3_friendly_border = false
	bl4_friendly_border = false
	bl5_friendly_border = false
	bl6_friendly_border = false
	bl7_friendly_border = false
	
	bl1_touching_border = false
	bl2_touching_border = false
	bl3_touching_border = false
	bl4_touching_border = false
	bl5_touching_border = false
	bl6_touching_border = false
	bl7_touching_border = false
	
	enemybl_1 = false
	enemybl_2 = false
	enemybl_3 = false
	enemybl_4 = false
	enemybl_5 = false
	enemybl_6 = false
	enemybl_7 = false
	
	#endregion

	readd_markers = true
	focused = false
	Globals.piece_focused = null

	
#region Up, Down, Left, and Right

#region All the inputs for the Right markers.
#
#region buttons
func _on_right_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_right_button_2_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_3_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_4_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_5_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

	



func _on_right_button_6_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_7_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



#endregion
#
#endregion


#region All the inputs for the Forward markers.
#
	#region All the button signals.


func _on_forward_button_1_button_up() -> void:
	focused = false
	Globals.moved = true
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
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_4_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward4_tile
	await get_tree().process_frame
	await get_tree().process_frame
	global_position = Globals.position_target
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_5_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	



func _on_forward_button_6_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_7_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	


#endregion
#
#endregion


#region All the inputs for the Back markers.
#
	#region ALl the button signals


func _on_back_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	$MoveSound.play()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#
#endregion


#region All the inputs for the Left markers.
#
	#region All the Button signals


func _on_left_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
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
#
#endregion

#endregion

#region Diagonal (FR, FL, BR, BL)
#######
#region Diagonal Forward-Right
#
#region All the Button Signals


func _on_fr_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fr_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#
#endregion
#######
#region Diagonal Forward-Left

#region ALl the Button Signals


func _on_fl_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_fl_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#endregion
#######
#region Diagonal Back-Right

#region All the Button Signals


func _on_br_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_br_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

func _on_br_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_br_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_br_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_br_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_br_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#endregion
#######
#region Diagonal Back-Left

#region All the Button Signals


func _on_bl_1_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

func _on_bl_2_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_bl_3_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_bl_4_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl4_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_bl_5_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_bl_6_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_bl_7_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#endregion
#######
#endregion
