extends CharacterBody2D

var focused
var taking
var tile
var tile_group
var turn
var readd_markers

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
var fl5_frinedly_border
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


func _process(delta: float) -> void:
	if(readd_markers):
		var markers = $MovementMarkers
		var test_gp = $MovementMarkers.global_position
		$".".remove_child(markers)
		await get_tree().process_frame
		$".".add_child(markers)
		$MovementMarkers.global_position = test_gp
		readd_markers = false
		return
	if(Globals.piece_focused == "QueenWhite" && self.name == "QueenWhite" || Globals.piece_focused == "QueenBlack" && self.name == "QueenBlack"):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectQueen.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			z_index = 5
			move_to_front()
			taking = true
			#region making sure flags are a-ok
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
				if(fr5_touching_border || fr6_friendly_border):
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_5):
				if(fr4_touching_border || fr5_friendly_border):
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
		if(Globals.piece_focused != self.name):
			Globals.piece_focused = self.name
			focused = true
		else:
			Globals.piece_focused = ""
			focused = false

func _on_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]

func _on_collision_area_body_entered(body: Node2D) -> void:
	if(self.name == "QueenWhite" && body.name != "QueenWhite" || self.name == "QueenBlack" && body.name != "QueenBlack"):
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
	
	enemyfr_1 = false
	enemyfr_2 = false
	enemyfr_3 = false
	enemyfr_4 = false
	enemyfr_5 = false
	enemyfr_6 = false
	enemyfr_7 = false

	enemyfl_1 = false
	enemyfl_2 = false
	enemyfl_3 = false
	enemyfl_4 = false
	enemyfl_5 = false
	enemyfl_6 = false
	enemyfl_7 = false

	enemybl_1 = false
	enemybl_2 = false
	enemybl_3 = false
	enemybl_4 = false
	enemybl_5 = false
	enemybl_6 = false
	enemybl_7 = false

	enemybr_1 = false
	enemybr_2 = false
	enemybr_3 = false
	enemybr_4 = false
	enemybr_5 = false
	enemybr_6 = false
	enemybr_7 = false
	readd_markers = true
	focused = false
	Globals.piece_focused = ""

#region Up, Down, Left, and Right

#region All the inputs for the Right markers.

#region All the button signals.

func _on_right_button_button_up() -> void:
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
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
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



#endregion
#region All the collision signals.

func _on_right_area_1_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right1 = true
				right1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right1 = true
					right1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right1 = true
					right1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right1 = true
				right1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right1 = true
					right1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right1 = true
					right1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right1 = true
				right1_touching_border = true
			else:
				enemy_right1 = true
				right1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right1 = true
				right1_touching_border = true
			else:
				enemy_right1 = true
				right1_touching_border = false
	

func _on_right_area_1_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right1 = false


func _on_right_area_2_body_entered(body: Node2D) -> void:
	right2_tile = body.tile
	right2_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right2 = true
				right2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right2 = true
					right2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right2 = true
					right2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right2 = true
				right2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right2 = true
					right2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right2 = true
					right2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right2 = true
				right2_touching_border = true
			else:
				enemy_right2 = true
				right2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right2 = true
				right2_touching_border = true
			else:
				enemy_right2 = true
				right2_touching_border = false


func _on_right_area_2_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right2 = false


func _on_right_area_3_body_entered(body: Node2D) -> void:
	right3_tile = body.tile
	right3_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right3 = true
				right3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right3 = true
					right3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right3 = true
					right3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right3 = true
				right3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right3 = true
					right3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right3 = true
					right3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right3 = true
				right3_touching_border = true
			else:
				enemy_right3 = true
				right3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right3 = true
				right3_touching_border = true
			else:
				enemy_right3 = true
				right3_touching_border = false


func _on_right_area_3_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right3 = false


func _on_right_area_4_body_entered(body: Node2D) -> void:
	right4_tile = body.tile
	right4_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right4 = true
				right4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right4 = true
					right4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right4 = true
					right4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right4 = true
				right4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right4 = true
					right4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right4 = true
					right4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right4 = true
				right4_touching_border = true
			else:
				enemy_right4 = true
				right4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right4 = true
				right4_touching_border = true
			else:
				enemy_right4 = true
				right4_touching_border = false


func _on_right_area_4_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right4 = false


func _on_right_area_5_body_entered(body: Node2D) -> void:
	right5_tile = body.tile
	right5_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right5 = true
				right5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right5 = true
					right5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right5 = true
					right5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right5 = true
				right5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right5 = true
					right5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right5 = true
					right5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right5 = true
				right5_touching_border = true
			else:
				enemy_right5 = true
				right5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right5 = true
				right5_touching_border = true
			else:
				enemy_right5 = true
				right5_touching_border = false


func _on_right_area_5_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right5 = false


func _on_right_area_6_body_entered(body: Node2D) -> void:
	right6_tile = body.tile
	right6_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right6 = true
				right6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right6 = true
					right6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right6 = true
					right6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right6 = true
				right6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right6 = true
					right6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right6 = true
					right6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right6 = true
				right6_touching_border = true
			else:
				enemy_right6 = true
				right6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right6 = true
				right6_touching_border = true
			else:
				enemy_right6 = true
				right6_touching_border = false


func _on_right_area_6_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right6 = false


func _on_right_area_7_body_entered(body: Node2D) -> void:
	right7_tile = body.tile
	right7_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_right7 = true
				right7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right7 = true
					right7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_right7 = true
					right7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_right7 = true
				right7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_right7 = true
					right7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_right7 = true
					right7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_right7 = true
				right7_touching_border = true
			else:
				enemy_right7 = true
				right7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_right7 = true
				right7_touching_border = true
			else:
				enemy_right7 = true
				right7_touching_border = false


func _on_right_area_7_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right7 = false

#endregion
#region All the edge collision signals.

func _on_right_area_1_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right1_touching_border = true
		enemy_right1 = true
	if(area.is_in_group("Tiles")):
		right1_tile = area.name
		right1_tile_group = str(area.name)[0]


func _on_right_area_1_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right1_touching_border = false
		enemy_right1 = false


func _on_right_area_2_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right2_touching_border = true
		enemy_right2 = true
	if(area.is_in_group("Tiles")):
		right2_tile = area.name
		right2_tile_group = str(area.name)[0]


func _on_right_area_2_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right2_touching_border = false
		enemy_right2 = false

func _on_right_area_3_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right3_touching_border = true
		enemy_right3 = true
	if(area.is_in_group("Tiles")):
		right3_tile = area.name
		right3_tile_group = str(area.name)[0]


func _on_right_area_3_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right3_touching_border = false
		enemy_right3 = false


func _on_right_area_4_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		right4_touching_border = true
		enemy_right4 = true
	if(area.is_in_group("Tiles")):
		right4_tile = area.name
		right4_tile_group = str(area.name)[0]


func _on_right_area_4_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right4_touching_border = false
		enemy_right4 = false


func _on_right_area_5_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		right5_touching_border = true
		enemy_right5 = true
	if(area.is_in_group("Tiles")):
		right5_tile = area.name
		right5_tile_group = str(area.name)[0]


func _on_right_area_5_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right5_touching_border = false
		enemy_right5 = false
	


func _on_right_area_6_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right6_touching_border = true
		enemy_right6 = true
	if(area.is_in_group("Tiles")):
		right6_tile = area.name
		right6_tile_group = str(area.name)[0]


func _on_right_area_6_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):	
		right6_touching_border = false
		enemy_right6 = false


func _on_right_area_7_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right7_touching_border = true
		enemy_right7 = true
	if(area.is_in_group("Tiles")):
		right7_tile = area.name
		right7_tile_group = str(area.name)[0]


func _on_right_area_7_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right7_touching_border = false
		enemy_right7 = false
	
#endregion

#endregion
#region All the inputs for the Forward markers.

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
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	


#endregion
	#region All the edge collision signals.

func _on_forward_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward1_touching_border = true
		enemy_forward1 = true
	if(area.is_in_group("Tiles")):
		forward1_tile = area.name
		forward1_tile_group = str(area.name)[0]


func _on_forward_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward1_touching_border = false
		enemy_forward1 = false


func _on_forward_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward2_touching_border = true
		enemy_forward2 = true
	if(area.is_in_group("Tiles")):
		forward2_tile = area.name
		var group = str(area.name)[0]
		forward2_tile_group = group

func _on_forward_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward2_touching_border = false
		enemy_forward2 = false


func _on_forward_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward3_touching_border = true
		enemy_forward3 = true
	if(area.is_in_group("Tiles")):
		forward3_tile = area.name
		var group = str(area.name)[0]
		forward3_tile_group = group

func _on_forward_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward3_touching_border = false
		enemy_forward3 = false


func _on_forward_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward4_touching_border = true
		enemy_forward4 = true
	if(area.is_in_group("Tiles")):
		forward4_tile = area.name
		forward4_tile_group = str(area.name)[0]
		
func _on_forward_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward4_touching_border = false
		enemy_forward4 = false


func _on_forward_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward5_touching_border = true
		enemy_forward5 = true
	if(area.is_in_group("Tiles")):
		forward5_tile = area.name
		var group = str(area.name)[0]
		forward5_tile_group = group


func _on_forward_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward5_touching_border = false
		enemy_forward5 = false


func _on_forward_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward6_touching_border = true
		enemy_forward6 = true
	if(area.is_in_group("Tiles")):
		forward6_tile = area.name
		var group = str(area.name)[0]
		forward6_tile_group = group


func _on_forward_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward6_touching_border = false
		enemy_forward6 = false


func _on_forward_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward7_touching_border = true
		enemy_forward7 = true
	if(area.is_in_group("Tiles")):
		forward7_tile = area.name
		var group = str(area.name)[0]
		forward7_tile_group = group


func _on_forward_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward7_touching_border = false
		enemy_forward7 = false

#endregion=
#endregion
	#region ALl the collision signals


func _on_forward_1_area_body_entered(body: Node2D) -> void:
	forward1_tile = body.tile
	forward1_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward1 = true
				forward1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward1 = true
					forward1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward1 = true
					forward1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward1 = true
				forward1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward1 = true
					forward1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward1 = true
					forward1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward1 = true
				forward1_touching_border = true
			else:
				enemy_forward1 = true
				forward1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward1 = true
				forward1_touching_border = true
			else:
				enemy_forward1 = true
				forward1_touching_border = false


func _on_forward_1_area_body_exited(body: Node2D) -> void:
	enemy_forward1 = false


func _on_forward_2_area_body_entered(body: Node2D) -> void:
	forward2_tile = body.tile
	forward2_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward2 = true
				forward2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward2 = true
					forward2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward2 = true
					forward2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward2 = true
				forward2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward2 = true
					forward2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward2 = true
					forward2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward2 = true
				forward2_touching_border = true
			else:
				enemy_forward2 = true
				forward2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward2 = true
				forward2_touching_border = true
			else:
				enemy_forward2 = true
				forward2_touching_border = false


func _on_forward_2_area_body_exited(body: Node2D) -> void:
	enemy_forward2 = false


func _on_forward_3_area_body_entered(body: Node2D) -> void:
	forward3_tile = body.tile
	forward3_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward3 = true
				forward3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward3 = true
					forward3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward3 = true
					forward3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward3 = true
				forward3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward3 = true
					forward3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward3 = true
					forward3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward3 = true
				forward3_touching_border = true
			else:
				enemy_forward3 = true
				forward3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward3 = true
				forward3_touching_border = true
			else:
				enemy_forward3 = true
				forward3_touching_border = false


func _on_forward_3_area_body_exited(body: Node2D) -> void:
	enemy_forward3 = false


func _on_forward_4_area_body_entered(body: Node2D) -> void:
	forward4_tile = body.tile
	forward4_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward4 = true
				forward4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward4 = true
					forward4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward4 = true
					forward4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward4 = true
				forward4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward4 = true
					forward4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward4 = true
					forward4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward4 = true
				forward4_touching_border = true
			else:
				enemy_forward4 = true
				forward4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward4 = true
				forward4_touching_border = true
			else:
				enemy_forward4 = true
				forward4_touching_border = false


func _on_forward_4_area_body_exited(body: Node2D) -> void:
	enemy_forward4 = false


func _on_forward_5_area_body_entered(body: Node2D) -> void:
	forward5_tile = body.tile
	forward5_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward5 = true
				forward5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward5 = true
					forward5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward5 = true
					forward5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward5 = true
				forward5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward5 = true
					forward5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward5 = true
					forward5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward5 = true
				forward5_touching_border = true
			else:
				enemy_forward5 = true
				forward5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward5 = true
				forward5_touching_border = true
			else:
				enemy_forward5 = true
				forward5_touching_border = false


func _on_forward_5_area_body_exited(body: Node2D) -> void:
	enemy_forward5 = false	


func _on_forward_6_area_body_entered(body: Node2D) -> void:
	forward6_tile = body.tile
	forward6_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward6 = true
				forward6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward6 = true
					forward6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward6 = true
					forward6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward6 = true
				forward6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward6 = true
					forward6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward6 = true
					forward6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward6 = true
				forward6_touching_border = true
			else:
				enemy_forward6 = true
				forward6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward6 = true
				forward6_touching_border = true
			else:
				enemy_forward6 = true
				forward6_touching_border = false
	

func _on_forward_6_area_body_exited(body: Node2D) -> void:
	enemy_forward6 = false


func _on_forward_7_area_body_entered(body: Node2D) -> void:
	forward7_tile = body.tile
	forward7_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_forward7 = true
				forward7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward7 = true
					forward7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_forward7 = true
					forward7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_forward7 = true
				forward7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_forward7 = true
					forward7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_forward7 = true
					forward7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_forward7 = true
				forward7_touching_border = true
			else:
				enemy_forward7 = true
				forward7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_forward7 = true
				forward7_touching_border = true
			else:
				enemy_forward7 = true
				forward7_touching_border = false


func _on_forward_7_area_body_exited(body: Node2D) -> void:
	enemy_forward7 = false

#endregion

#endregion
#region All the inputs for the Back markers.

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
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
	#region All the collision signals


func _on_back_1_area_body_entered(body: Node2D) -> void:
	back1_tile = body.tile
	back1_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back1 = true
				back1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back1 = true
					back1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back1 = true
					back1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back1 = true
				back1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back1 = true
					back1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back1 = true
					back1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back1 = true
				back1_touching_border = true
			else:
				enemy_back1 = true
				back1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back1 = true
				back1_touching_border = true
			else:
				enemy_back1 = true
				back1_touching_border = false


func _on_back_1_area_body_exited(body: Node2D) -> void:
	enemy_back1 = false


func _on_back_2_area_body_entered(body: Node2D) -> void:
	back2_tile = body.tile
	back2_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back2 = true
				back2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back2 = true
					back2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back2 = true
					back2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back2 = true
				back2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back2 = true
					back2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back2 = true
					back2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back2 = true
				back2_touching_border = true
			else:
				enemy_back2 = true
				back2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back2 = true
				back2_touching_border = true
			else:
				enemy_back2 = true
				back2_touching_border = false



func _on_back_2_area_body_exited(body: Node2D) -> void:
	enemy_back2 = false


func _on_back_3_area_body_entered(body: Node2D) -> void:
	back3_tile = body.tile
	back3_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back3 = true
				back3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back3 = true
					back3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back3 = true
					back3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back3 = true
				back3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back3 = true
					back3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back3 = true
					back3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back3 = true
				back3_touching_border = true
			else:
				enemy_back3 = true
				back3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back3 = true
				back3_touching_border = true
			else:
				enemy_back3 = true
				back3_touching_border = false


func _on_back_3_area_body_exited(body: Node2D) -> void:
	enemy_back3 = false


func _on_back_4_area_body_entered(body: Node2D) -> void:
	back4_tile = body.tile
	back4_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back4 = true
				back4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back4 = true
					back4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back4 = true
					back4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back4 = true
				back4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back4 = true
					back4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back4 = true
					back4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back4 = true
				back4_touching_border = true
			else:
				enemy_back4 = true
				back4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back4 = true
				back4_touching_border = true
			else:
				enemy_back4 = true
				back4_touching_border = false



func _on_back_4_area_body_exited(body: Node2D) -> void:
	enemy_back4 = false


func _on_back_5_area_body_entered(body: Node2D) -> void:
	back5_tile = body.tile
	back5_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back5 = true
				back5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back5 = true
					back5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back5 = true
					back5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back5 = true
				back5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back5 = true
					back5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back5 = true
					back5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back5 = true
				back5_touching_border = true
			else:
				enemy_back5 = true
				back5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back5 = true
				back5_touching_border = true
			else:
				enemy_back5 = true
				back5_touching_border = false



func _on_back_5_area_body_exited(body: Node2D) -> void:
	enemy_back5 = false


func _on_back_6_area_body_entered(body: Node2D) -> void:
	back6_tile = body.tile
	back6_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back6 = true
				back6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back6 = true
					back6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back6 = true
					back6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back6 = true
				back6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back6 = true
					back6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back6 = true
					back6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back6 = true
				back6_touching_border = true
			else:
				enemy_back6 = true
				back6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back6 = true
				back6_touching_border = true
			else:
				enemy_back6 = true
				back6_touching_border = false



func _on_back_6_area_body_exited(body: Node2D) -> void:
	enemy_back6 = false


func _on_back_7_area_body_entered(body: Node2D) -> void:
	back7_tile = body.tile
	back7_tile_group = body.tile_group
	# This monster of code is checking if the king is in check, and if they can attack the piece in back1.
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_back7 = true
				back7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back7 = true
					back7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_back7 = true
					back7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_back7 = true
				back7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_back7 = true
					back7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_back7 = true
					back7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_back7 = true
				back7_touching_border = true
			else:
				enemy_back7 = true
				back7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_back7 = true
				back7_touching_border = true
			else:
				enemy_back7 = true
				back7_touching_border = false



func _on_back_7_area_body_exited(body: Node2D) -> void:
	enemy_back7 = false

#endregion
	#region All the edge collision signals


func _on_back_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back1_touching_border = true
		enemy_back1 = true
	if(area.is_in_group("Tiles")):
		back1_tile = area.name
		back1_tile_group = str(area.name)[0]


func _on_back_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back1_touching_border = false
		enemy_back1 = false


func _on_back_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back2_touching_border = true
		enemy_back2 = true
	if(area.is_in_group("Tiles")):
		back2_tile = area.name
		back2_tile_group = str(area.name)[0]


func _on_back_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back2_touching_border = false
		enemy_back2 = false


func _on_back_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back3_touching_border = true
		enemy_back3 = true
	if(area.is_in_group("Tiles")):
		back3_tile = area.name
		back3_tile_group = str(area.name)[0]


func _on_back_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back3_touching_border = false
		enemy_back3 = false


func _on_back_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back4_touching_border = true
		enemy_back4 = true
	if(area.is_in_group("Tiles")):
		back4_tile = area.name
		back4_tile_group = str(area.name)[0]


func _on_back_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back4_touching_border = false
		enemy_back4 = false


func _on_back_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back5_touching_border = true
		enemy_back5 = true
	if(area.is_in_group("Tiles")):
		back5_tile = area.name
		back5_tile_group = str(area.name)[0]


func _on_back_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back5_touching_border = false
		enemy_back5 = false


func _on_back_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back6_touching_border = true
		enemy_back6 = true
	if(area.is_in_group("Tiles")):
		back6_tile = area.name
		back6_tile_group = str(area.name)[0]


func _on_back_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back6_touching_border = false
		enemy_back6 = false


func _on_back_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back7_touching_border = true
		enemy_back7 = true
	if(area.is_in_group("Tiles")):
		back7_tile = area.name
		back7_tile_group = str(area.name)[0]


func _on_back_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back7_touching_border = false
		enemy_back7 = false

#endregion

#endregion
#region All the inputs for the Left markers.

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
	#region All the Edge Collision signals

func _on_left_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left1_touching_border = true
		enemy_left1 = true
	if(area.is_in_group("Tiles")):
		left1_tile = area.name
		left1_tile_group = str(area.name)[0]


func _on_left_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left2_touching_border = true
		enemy_left2 = true
	if(area.is_in_group("Tiles")):
		left2_tile = area.name
		left2_tile_group = str(area.name)[0]


func _on_left_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left3_touching_border = true
		enemy_left3 = true
	if(area.is_in_group("Tiles")):
		left3_tile = area.name
		left3_tile_group = str(area.name)[0]


func _on_left_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left4_touching_border = true
		enemy_left4 = true
	if(area.is_in_group("Tiles")):
		left4_tile = area.name
		left4_tile_group = str(area.name)[0]


func _on_left_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left5_touching_border = true
		enemy_left5 = true
	if(area.is_in_group("Tiles")):
		left5_tile = area.name
		left5_tile_group = str(area.name)[0]


func _on_left_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left6_touching_border = true
		enemy_left6 = true
	if(area.is_in_group("Tiles")):
		left6_tile = area.name
		left6_tile_group = str(area.name)[0]


func _on_left_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left7_touching_border = true
		enemy_left7 = true
	if(area.is_in_group("Tiles")):
		left7_tile = area.name
		left7_tile_group = str(area.name)[0]


func _on_left_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left7_touching_border = false
		enemy_left7 = false


func _on_left_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left6_touching_border = false
		enemy_left6 = false


func _on_left_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left5_touching_border = false
		enemy_left5 = false


func _on_left_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left4_touching_border = false
		enemy_left4 = false


func _on_left_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left3_touching_border = false
		enemy_left3 = false


func _on_left_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left2_touching_border = false
		enemy_left2 = false


func _on_left_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left1_touching_border = false
		enemy_left1 = false

#endregion
	#region ALl collision signals


func _on_left_1_area_body_entered(body: Node2D) -> void:
	left1_tile = body.tile
	left1_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left1 = true
				left1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left1 = true
					left1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left1 = true
					left1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left1 = true
				left1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left1 = true
					left1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left1 = true
					left1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left1 = true
				left1_touching_border = true
			else:
				enemy_left1 = true
				left1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left1 = true
				left1_touching_border = true
			else:
				enemy_left1 = true
				left1_touching_border = false


func _on_left_1_area_body_exited(body: Node2D) -> void:
	enemy_left1 = false


func _on_left_2_area_body_entered(body: Node2D) -> void:
	left2_tile = body.tile
	left2_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left2 = true
				left2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left2 = true
					left2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left2 = true
					left2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left2 = true
				left2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left2 = true
					left2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left2 = true
					left2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left2 = true
				left2_touching_border = true
			else:
				enemy_left2 = true
				left2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left2 = true
				left2_touching_border = true
			else:
				enemy_left2 = true
				left2_touching_border = false


func _on_left_2_area_body_exited(body: Node2D) -> void:
	enemy_left2 = false


func _on_left_3_area_body_entered(body: Node2D) -> void:
	left3_tile = body.tile
	left3_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left3 = true
				left3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left3 = true
					left3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left3 = true
					left3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left3 = true
				left3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left3 = true
					left3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left3 = true
					left3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left3 = true
				left3_touching_border = true
			else:
				enemy_left3 = true
				left3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left3 = true
				left3_touching_border = true
			else:
				enemy_left3 = true
				left3_touching_border = false


func _on_left_3_area_body_exited(body: Node2D) -> void:
	enemy_left3 = false


func _on_left_4_area_body_entered(body: Node2D) -> void:
	left4_tile = body.tile
	left4_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left4 = true
				left4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left4 = true
					left4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left4 = true
					left4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left4 = true
				left4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left4 = true
					left4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left4 = true
					left4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left4 = true
				left4_touching_border = true
			else:
				enemy_left4 = true
				left4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left4 = true
				left4_touching_border = true
			else:
				enemy_left4 = true
				left4_touching_border = false


func _on_left_4_area_body_exited(body: Node2D) -> void:
	enemy_left4 = false


func _on_left_5_area_body_entered(body: Node2D) -> void:
	left5_tile = body.tile
	left5_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left5 = true
				left5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left5 = true
					left5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left5 = true
					left5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left5 = true
				left5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left5 = true
					left5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left5 = true
					left5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left5 = true
				left5_touching_border = true
			else:
				enemy_left5 = true
				left5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left5 = true
				left5_touching_border = true
			else:
				enemy_left5 = true
				left5_touching_border = false


func _on_left_5_area_body_exited(body: Node2D) -> void:
	enemy_left5 = false


func _on_left_6_area_body_entered(body: Node2D) -> void:
	left6_tile = body.tile
	left6_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left6 = true
				left6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left6 = true
					left6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left6 = true
					left6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left6 = true
				left6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left6 = true
					left6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left6 = true
					left6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left6 = true
				left6_touching_border = true
			else:
				enemy_left6 = true
				left6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left6 = true
				left6_touching_border = true
			else:
				enemy_left6 = true
				left6_touching_border = false


func _on_left_6_area_body_exited(body: Node2D) -> void:
	enemy_left6 = false


func _on_left_7_area_body_entered(body: Node2D) -> void:
	left7_tile = body.tile
	left7_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemy_left7 = true
				left7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left7 = true
					left7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemy_left7 = true
					left7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemy_left7 = true
				left7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemy_left7 = true
					left7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemy_left7 = true
					left7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemy_left7 = true
				left7_touching_border = true
			else:
				enemy_left7 = true
				left7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemy_left7 = true
				left7_touching_border = true
			else:
				enemy_left7 = true
				left7_touching_border = false


func _on_left_7_area_body_exited(body: Node2D) -> void:
	enemy_left7 = false

#endregion

#endregion

#endregion

#region Diagonal (FR, FL, BR, BL)

#region Diagonal Forward-Right
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
#region All the Edge Collisional Signals
	

func _on_fr_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr1_touching_border = true
		enemyfr_1 = true
	if(area.is_in_group("Tiles")):
		fr1_tile = area.name
		fr1_tile_group = str(area.name)[0]


func _on_fr_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr1_touching_border = false
		enemyfr_1 = false


func _on_fr_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr2_touching_border = true
		enemyfr_2 = true
	if(area.is_in_group("Tiles")):
		fr2_tile = area.name
		fr2_tile_group = str(area.name)[0]


func _on_fr_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr2_touching_border = false
		enemyfr_2 = false


func _on_fr_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr3_touching_border = true
		enemyfr_3 = true
	if(area.is_in_group("Tiles")):
		fr3_tile = area.name
		fr3_tile_group = str(area.name)[0]


func _on_fr_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr3_touching_border = false
		enemyfr_3 = false


func _on_fr_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr4_touching_border = true
		enemyfr_4 = true
	if(area.is_in_group("Tiles")):
		fr4_tile = area.name
		fr4_tile_group = str(area.name)[0]


func _on_fr_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr4_touching_border = false
		enemyfr_4 = false


func _on_fr_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr5_touching_border = true
		enemyfr_5 = true
	if(area.is_in_group("Tiles")):
		fr5_tile = area.name
		fr5_tile_group = str(area.name)[0]


func _on_fr_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr5_touching_border = false
		enemyfr_5 = false


func _on_fr_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr6_touching_border = true
		enemyfr_6 = true
	if(area.is_in_group("Tiles")):
		fr6_tile = area.name
		fr6_tile_group = str(area.name)[0]


func _on_fr_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr6_touching_border = false
		enemyfr_6 = false


func _on_fr_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr7_touching_border = true
		enemyfr_7 = true
	if(area.is_in_group("Tiles")):
		fr7_tile = area.name
		fr7_tile_group = str(area.name)[0]


func _on_fr_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr7_touching_border = false
		enemyfr_7 = false

#endregion
#region All the Collisions


func _on_fr_1_area_body_entered(body: Node2D) -> void:
	fr1_tile = body.tile
	fr1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_1 = true
			fr1_touching_border = true
		else:
			enemyfr_1 = true
			fr1_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_1 = true
			fr1_touching_border = true
		else:
			enemyfr_1 = true
			fr1_touching_border = false


func _on_fr_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_1 = false


func _on_fr_2_area_body_entered(body: Node2D) -> void:
	fr2_tile = body.tile
	fr2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_2 = true
			fr2_touching_border = true
		else:
			enemyfr_2 = true
			fr2_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_2 = true
			fr2_touching_border = true
		else:
			enemyfr_2 = true
			fr2_touching_border = false


func _on_fr_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_2 = false


func _on_fr_3_area_body_entered(body: Node2D) -> void:
	fr3_tile = body.tile
	fr3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_3 = true
			fr3_touching_border = true
		else:
			enemyfr_3 = true
			fr3_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_3 = true
			fr3_touching_border = true
		else:
			enemyfr_3 = true
			fr3_touching_border = false

func _on_fr_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_3 = false


func _on_fr_4_area_body_entered(body: Node2D) -> void:
	fr4_tile = body.tile
	fr4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_4 = true
			fr4_touching_border = true
		else:
			enemyfr_4 = true
			fr4_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_4 = true
			fr4_touching_border = true
		else:
			enemyfr_4 = true
			fr4_touching_border = false


func _on_fr_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_4 = false


func _on_fr_5_area_body_entered(body: Node2D) -> void:
	fr5_tile = body.tile
	fr5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_5 = true
			fr5_touching_border = true
		else:
			enemyfr_5 = true
			fr5_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_5 = true
			fr5_touching_border = true
		else:
			enemyfr_5 = true
			fr5_touching_border = false


func _on_fr_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_5 = false


func _on_fr_6_area_body_entered(body: Node2D) -> void:
	fr1_tile = body.tile
	fr6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_6 = true
			fr6_touching_border = true
		else:
			enemyfr_6 = true
			fr6_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_6 = true
			fr6_touching_border = true
		else:
			enemyfr_6 = true
			fr6_touching_border = false


func _on_fr_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_6 = false


func _on_fr_7_area_body_entered(body: Node2D) -> void:
	fr7_tile = body.tile
	fr7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_7 = true
			fr7_touching_border = true
		else:
			enemyfr_7 = true
			fr7_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_7 = true
			fr7_touching_border = true
		else:
			enemyfr_7 = true
			fr7_touching_border = false


func _on_fr_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_7 = false

#endregion
#endregion
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
#region All the Edge Collision Signals
	

func _on_fl_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl1_touching_border = true
		enemyfl_1 = true
	if(area.is_in_group("Tiles")):
		fl1_tile = area.name
		fl1_tile_group = str(area.name)[0]


func _on_fl_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl1_touching_border = false
		enemyfl_1 = false


func _on_fl_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl2_touching_border = true
		enemyfl_2 = true
	if(area.is_in_group("Tiles")):
		fl2_tile = area.name
		fl2_tile_group = str(area.name)[0]


func _on_fl_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl2_touching_border = false
		enemyfl_2 = false


func _on_fl_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl3_touching_border = true
		enemyfl_3 = true
	if(area.is_in_group("Tiles")):
		fl3_tile = area.name
		fl3_tile_group = str(area.name)[0]


func _on_fl_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl3_touching_border = false
		enemyfl_3 = false


func _on_fl_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl4_touching_border = true
		enemyfl_4 = true
	if(area.is_in_group("Tiles")):
		fl4_tile = area.name
		fl4_tile_group = str(area.name)[0]


func _on_fl_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl4_touching_border = false
		enemyfl_4 = false


func _on_fl_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl5_touching_border = true
		enemyfl_5 = true
	if(area.is_in_group("Tiles")):
		fl5_tile = area.name
		fl5_tile_group = str(area.name)[0]


func _on_fl_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl5_touching_border = false
		enemyfl_5 = false


func _on_fl_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl6_touching_border = true
		enemyfl_6 = true
	if(area.is_in_group("Tiles")):
		fl6_tile = area.name
		fl6_tile_group = str(area.name)[0]


func _on_fl_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl6_touching_border = false
		enemyfl_6 = false


func _on_fl_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl7_touching_border = true
		enemyfl_7 = true
	if(area.is_in_group("Tiles")):
		fl7_tile = area.name
		fl7_tile_group = str(area.name)[0]


func _on_fl_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl7_touching_border = false
		enemyfl_7 = false

#endregion
#region All the Collision Signals
	
	

func _on_fl_1_area_body_entered(body: Node2D) -> void:
	fl1_tile = body.tile
	fl1_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_1 = true
				fl1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_1 = true
					fl1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_1 = true
					fl1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_1 = true
				fl1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_1 = true
					fl1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_1 = true
					fl1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_1 = true
				fl1_touching_border = true
			else:
				enemyfl_1 = true
				fl1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_1 = true
				fl1_touching_border = true
			else:
				enemyfl_1 = true
				fl1_touching_border = false


func _on_fl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_1 = false


func _on_fl_2_area_body_entered(body: Node2D) -> void:
	fl2_tile = body.tile
	fl2_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_2 = true
				fl2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_2 = true
					fl2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_2 = true
					fl2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_2 = true
				fl2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_2 = true
					fl2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_2 = true
					fl2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_2 = true
				fl2_touching_border = true
			else:
				enemyfl_2 = true
				fl2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_2 = true
				fl2_touching_border = true
			else:
				enemyfl_2 = true
				fl2_touching_border = false


func _on_fl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_2 = false


func _on_fl_3_area_body_entered(body: Node2D) -> void:
	fl3_tile = body.tile
	fl3_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_3 = true
				fl3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_3 = true
					fl3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_3 = true
					fl3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_3 = true
				fl3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_3 = true
					fl3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_3 = true
					fl3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_3 = true
				fl3_touching_border = true
			else:
				enemyfl_3 = true
				fl3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_3 = true
				fl3_touching_border = true
			else:
				enemyfl_3 = true
				fl3_touching_border = false


func _on_fl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_3 = false


func _on_fl_4_area_body_entered(body: Node2D) -> void:
	fl4_tile = body.tile
	fl4_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_4 = true
				fl4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_4 = true
					fl4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_4 = true
					fl4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_4 = true
				fl4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_4 = true
					fl4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_4 = true
					fl4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_4 = true
				fl4_touching_border = true
			else:
				enemyfl_4 = true
				fl4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_4 = true
				fl4_touching_border = true
			else:
				enemyfl_4 = true
				fl4_touching_border = false


func _on_fl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_4 = false


func _on_fl_5_area_body_entered(body: Node2D) -> void:
	fl5_tile = body.tile
	fl5_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_5 = true
				fl5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_5 = true
					fl5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_5 = true
					fl5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_5 = true
				fl5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_5 = true
					fl5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_5 = true
					fl5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_5 = true
				fl5_touching_border = true
			else:
				enemyfl_5 = true
				fl5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_5 = true
				fl5_touching_border = true
			else:
				enemyfl_5 = true
				fl5_touching_border = false


func _on_fl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_5 = false


func _on_fl_6_area_body_entered(body: Node2D) -> void:
	fl6_tile = body.tile
	fl6_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_6 = true
				fl6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_6 = true
					fl6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_6 = true
					fl6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_6 = true
				fl6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_6 = true
					fl6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_6 = true
					fl6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_6 = true
				fl6_touching_border = true
			else:
				enemyfl_6 = true
				fl6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_6 = true
				fl6_touching_border = true
			else:
				enemyfl_6 = true
				fl6_touching_border = false


func _on_fl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_6 = false


func _on_fl_7_area_body_entered(body: Node2D) -> void:
	fl7_tile = body.tile
	fl7_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemyfl_7 = true
				fl7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_7 = true
					fl7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemyfl_7 = true
					fl7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemyfl_7 = true
				fl7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemyfl_7 = true
					fl7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemyfl_7 = true
					fl7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemyfl_7 = true
				fl7_touching_border = true
			else:
				enemyfl_7 = true
				fl7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemyfl_7 = true
				fl7_touching_border = true
			else:
				enemyfl_7 = true
				fl7_touching_border = false


func _on_fl_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_7 = false

#endregion
#endregion
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
#region All the Edge Collision Signals


func _on_br_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br1_touching_border = true
		enemybr_1 = true
	if(area.is_in_group("Tiles")):
		br1_tile = area.name
		br1_tile_group = str(area.name)[0]


func _on_br_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br1_touching_border = false
		enemybr_1 = false


func _on_br_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br2_touching_border = true
		enemybr_2 = true
	if(area.is_in_group("Tiles")):
		br2_tile = area.name
		br2_tile_group = str(area.name)[0]


func _on_br_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br2_touching_border = false
		enemybr_2 = false


func _on_br_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br3_touching_border = true
		enemybr_3 = true
	if(area.is_in_group("Tiles")):
		br3_tile = area.name
		br3_tile_group = str(area.name)[0]


func _on_br_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br3_touching_border = false
		enemybr_3 = false


func _on_br_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br4_touching_border = true
		enemybr_4 = true
	if(area.is_in_group("Tiles")):
		br4_tile = area.name
		br4_tile_group = str(area.name)[0]


func _on_br_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br4_touching_border = false
		enemybr_4 = false


func _on_br_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br5_touching_border = true
		enemybr_5 = true
	if(area.is_in_group("Tiles")):
		br5_tile = area.name
		br5_tile_group = str(area.name)[0]


func _on_br_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br5_touching_border = false
		enemybr_5 = false


func _on_br_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br6_touching_border = true
		enemybr_6 = true
	if(area.is_in_group("Tiles")):
		br6_tile = area.name
		br6_tile_group = str(area.name)[0]

func _on_br_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br6_touching_border = false
		enemybr_6 = false


func _on_br_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br7_touching_border = true
		enemybr_7 = true
	if(area.is_in_group("Tiles")):
		br7_tile = area.name
		br7_tile_group = str(area.name)[0]


func _on_br_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br7_touching_border = false
		enemybr_7 = false

#endregion
#region All the Collision Signals


func _on_br_1_area_body_entered(body: Node2D) -> void:
	br1_tile = body.tile
	br1_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_1 = true
				br1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_1 = true
					br1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_1 = true
					br1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_1 = true
				br1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_1 = true
					br1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_1 = true
					br1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_1 = true
				br1_touching_border = true
			else:
				enemybr_1 = true
				br1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_1 = true
				br1_touching_border = true
			else:
				enemybr_1 = true
				br1_touching_border = false


func _on_br_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_1 = false


func _on_br_2_area_body_entered(body: Node2D) -> void:
	br1_tile = body.tile
	br2_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_2 = true
				br2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_2 = true
					br2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_2 = true
					br2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_2 = true
				br2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_2 = true
					br2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_2 = true
					br2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_2 = true
				br2_touching_border = true
			else:
				enemybr_2 = true
				br2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_2 = true
				br2_touching_border = true
			else:
				enemybr_2 = true
				br2_touching_border = false


func _on_br_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_2 = false


func _on_br_3_area_body_entered(body: Node2D) -> void:
	br3_tile = body.tile
	br3_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_3 = true
				br3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_3 = true
					br3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_3 = true
					br3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_3 = true
				br3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_3 = true
					br3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_3 = true
					br3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_3 = true
				br3_touching_border = true
			else:
				enemybr_3 = true
				br3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_3 = true
				br3_touching_border = true
			else:
				enemybr_3 = true
				br3_touching_border = false


func _on_br_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_3 = false


func _on_br_4_area_body_entered(body: Node2D) -> void:
	br4_tile = body.tile
	br4_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_4 = true
				br4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_4 = true
					br4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_4 = true
					br4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_4 = true
				br4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_4 = true
					br4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_4 = true
					br4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_4 = true
				br4_touching_border = true
			else:
				enemybr_4 = true
				br4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_4 = true
				br4_touching_border = true
			else:
				enemybr_4 = true
				br4_touching_border = false

func _on_br_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_4 = false


func _on_br_5_area_body_entered(body: Node2D) -> void:
	br5_tile = body.tile
	br5_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_5 = true
				br5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_5 = true
					br5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_5 = true
					br5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_5 = true
				br5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_5 = true
					br5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_5 = true
					br5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_5 = true
				br5_touching_border = true
			else:
				enemybr_5 = true
				br5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_5 = true
				br5_touching_border = true
			else:
				enemybr_5 = true
				br5_touching_border = false


func _on_br_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_5 = false


func _on_br_6_area_body_entered(body: Node2D) -> void:
	br6_tile = body.tile
	br6_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_6 = true
				br6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_6 = true
					br6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_6 = true
					br6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_6 = true
				br6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_6 = true
					br6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_6 = true
					br6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_6 = true
				br6_touching_border = true
			else:
				enemybr_6 = true
				br6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_6 = true
				br6_touching_border = true
			else:
				enemybr_6 = true
				br6_touching_border = false


func _on_br_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_6 = false


func _on_br_7_area_body_entered(body: Node2D) -> void:
	br7_tile = body.tile
	br7_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybr_7 = true
				br7_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_7 = true
					br7_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybr_7 = true
					br7_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybr_7 = true
				br7_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybr_7 = true
					br7_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybr_7 = true
					br7_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybr_7 = true
				br7_touching_border = true
			else:
				enemybr_7 = true
				br7_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybr_7 = true
				br7_touching_border = true
			else:
				enemybr_7 = true
				br7_touching_border = false


func _on_br_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_7 = false

#endregion

#endregion
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
#region All the Edge Collision

func _on_bl_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl1_touching_border = true
		enemybl_1 = true
	if(area.is_in_group("Tiles")):
		bl1_tile = area.name
		bl1_tile_group = str(area.name)[0]


func _on_bl_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl1_touching_border = false
		enemybl_1 = false


func _on_bl_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl2_touching_border = true
		enemybl_2 = true
	if(area.is_in_group("Tiles")):
		bl2_tile = area.name
		bl2_tile_group = str(area.name)[0]


func _on_bl_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl2_touching_border = false
		enemybl_2 = false


func _on_bl_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl3_touching_border = true
		enemybl_3 = true
	if(area.is_in_group("Tiles")):
		bl3_tile = area.name
		bl3_tile_group = str(area.name)[0]


func _on_bl_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl3_touching_border = false
		enemybl_3 = false


func _on_bl_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl4_touching_border = true
		enemybl_4 = true
	if(area.is_in_group("Tiles")):
		bl4_tile = area.name
		bl4_tile_group = str(area.name)[0]


func _on_bl_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl4_touching_border = false
		enemybl_4 = false


func _on_bl_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl5_touching_border = true
		enemybl_5 = true
	if(area.is_in_group("Tiles")):
		bl5_tile = area.name
		bl5_tile_group = str(area.name)[0]


func _on_bl_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl5_touching_border = false
		enemybl_5 = false


func _on_bl_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl6_touching_border = true
		enemybl_6 = true
	if(area.is_in_group("Tiles")):
		bl6_tile = area.name
		bl6_tile_group = str(area.name)[0]


func _on_bl_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl6_touching_border = false
		enemybl_6 = false


func _on_bl_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl7_touching_border = true
		enemybl_7 = true
	if(area.is_in_group("Tiles")):
		bl7_tile = area.name
		bl7_tile_group = str(area.name)[0]


func _on_bl_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl7_touching_border = false
		enemybl_7 = false

#endregion
#region All the Collisions

func _on_bl_1_area_body_entered(body: Node2D) -> void:
	bl1_tile = body.tile
	bl1_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_1 = true
				bl1_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_1 = true
					bl1_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_1 = true
					bl1_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_1 = true
				bl1_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_1 = true
					bl1_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_1 = true
					bl1_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_1 = true
				bl1_touching_border = true
			else:
				enemybl_1 = true
				bl1_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_1 = true
				bl1_touching_border = true
			else:
				enemybl_1 = true
				bl1_touching_border = false


func _on_bl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_1 = false


func _on_bl_2_area_body_entered(body: Node2D) -> void:
	bl2_tile = body.tile
	bl2_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_2 = true
				bl2_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_2 = true
					bl2_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_2 = true
					bl2_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_2 = true
				bl2_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_2 = true
					bl2_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_2 = true
					bl2_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_2 = true
				bl2_touching_border = true
			else:
				enemybl_2 = true
				bl2_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_2 = true
				bl2_touching_border = true
			else:
				enemybl_2 = true
				bl2_touching_border = false


func _on_bl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_2 = false


func _on_bl_3_area_body_entered(body: Node2D) -> void:
	bl3_tile = body.tile
	bl3_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_3 = true
				bl3_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_3 = true
					bl3_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_3 = true
					bl3_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_3 = true
				bl3_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_3 = true
					bl3_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_3 = true
					bl3_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_3 = true
				bl3_touching_border = true
			else:
				enemybl_3 = true
				bl3_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_3 = true
				bl3_touching_border = true
			else:
				enemybl_3 = true
				bl3_touching_border = false


func _on_bl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_3 = false


func _on_bl_4_area_body_entered(body: Node2D) -> void:
	bl4_tile = body.tile
	bl4_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_4 = true
				bl4_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_4 = true
					bl4_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_4 = true
					bl4_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_4 = true
				bl4_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_4 = true
					bl4_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_4 = true
					bl4_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_4 = true
				bl4_touching_border = true
			else:
				enemybl_4 = true
				bl4_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_4 = true
				bl4_touching_border = true
			else:
				enemybl_4 = true
				bl4_touching_border = false


func _on_bl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_4 = false


func _on_bl_5_area_body_entered(body: Node2D) -> void:
	bl5_tile = body.tile
	bl5_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_5 = true
				bl5_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_5 = true
					bl5_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_5 = true
					bl5_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_5 = true
				bl5_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_5 = true
					bl5_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_5 = true
					bl5_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_5 = true
				bl5_touching_border = true
			else:
				enemybl_5 = true
				bl5_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_5 = true
				bl5_touching_border = true
			else:
				enemybl_5 = true
				bl5_touching_border = false


func _on_bl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_5 = false


func _on_bl_6_area_body_entered(body: Node2D) -> void:
	bl6_tile = body.tile
	bl6_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_6 = true
				bl6_touching_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_6 = true
					bl6_touching_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_6 = true
					bl6_touching_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_6 = true
				bl6_touching_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_6 = true
					bl6_touching_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_6 = true
					bl6_touching_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_6 = true
				bl6_touching_border = true
			else:
				enemybl_6 = true
				bl6_touching_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_6 = true
				bl6_touching_border = true
			else:
				enemybl_6 = true
				bl6_touching_border = false


func _on_bl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_6 = false


func _on_bl_7_area_body_entered(body: Node2D) -> void:
	bl7_tile = body.tile
	bl7_tile_group = body.tile_group
	if(Globals.white_in_check):
		if(self.is_in_group("White")):
			# if the white king is in check and im white
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body that entered is the one attacking the king:
				enemybl_7 = true
				bl7_friendly_border = false
				# allow attack
		elif(self.is_in_group("Black")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_7 = true
					bl7_friendly_border = false
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
				if(self.is_in_group("Black")):
					enemybl_7 = true
					bl7_friendly_border = true
	if(Globals.black_in_check):
		if(self.is_in_group("Black")):
			# if the black king is in check and im black
			if(body.is_in_group(Globals.piece_attacking_king)):
				#if the body is the one attacking the king:
				enemybl_7 = true
				bl7_friendly_border = false
				#allow attack
		elif(self.is_in_group("White")):
			# if my king is not in check
			if(body.is_in_group("White")):
				#jsut check if the body is an ally or not.
					enemybl_7 = true
					bl7_friendly_border = true
			elif(body.is_in_group("Black")):
				#jsut check if the body is an ally or not.
					enemybl_7 = true
					bl7_friendly_border = false
	elif(Globals.black_in_check == false && Globals.white_in_check == false):
		# if the king isnt in check at all....
		if(body.is_in_group("White")):
			if(self.is_in_group("White")):
				enemybl_7 = true
				bl7_friendly_border = true
			else:
				enemybl_7 = true
				bl7_friendly_border = false
		elif(body.is_in_group("Black")):
			if(self.is_in_group("Black")):
				enemybl_7 = true
				bl7_friendly_border = true
			else:
				enemybl_7 = true
				bl7_friendly_border = false


func _on_bl_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_7 = false

#endregion

#endregion

#endregion
