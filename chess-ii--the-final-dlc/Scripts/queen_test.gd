extends CharacterBody2D

var focused
var taking
var touching_border
var forward_touching_border
var back_touching_border
var left_touching_border
var fr_touching_border
var fl_touching_border
var br_touching_border
var bl_touching_border

var tile
var tile_group

var turn

var target #this is for moving to a tile

# all the right variables
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

func _ready() -> void:
	print("Right spacing: ", $MovementMarkers/Right/Right2.position - $MovementMarkers/Right/Right1.position)
	focused = false

func _process(delta: float) -> void:
	if(Globals.piece_focused == "QueenWhite" && self.name == "QueenWhite" || Globals.piece_focused == "QueenBlack" && self.name == "QueenBlack"):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		if(focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_INHERIT
			z_index = 5
			move_to_front()
			taking = true
			#region Right Movement Marker Visibility Control
			
			$MovementMarkers.visible = true
			$MovementMarkers/Right.visible = true
			$MovementMarkers/Right/Right1.visible = true
			$MovementMarkers/Right/Right2.visible = true
			$MovementMarkers/Right/Right3.visible = true
			$MovementMarkers/Right/Right4.visible = true
			$MovementMarkers/Right/Right5.visible = true
			$MovementMarkers/Right/Right6.visible = true
			$MovementMarkers/Right/Right7.visible = true
			
		
			if(enemy_right7):
				if(touching_border):
					$MovementMarkers/Right/Right7.visible = false
				else:
					pass
			if(enemy_right6):
				if(touching_border):
					$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right5):
				if(touching_border):
					$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right4):
				if(touching_border):
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
			if(enemy_right2):
				if(touching_border):
					$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
			if(enemy_right1):
				if(touching_border):
					$MovementMarkers/Right/Right1.visible = false
				$MovementMarkers/Right/Right2.visible = false
				$MovementMarkers/Right/Right3.visible = false
				$MovementMarkers/Right/Right4.visible = false
				$MovementMarkers/Right/Right5.visible = false
				$MovementMarkers/Right/Right6.visible = false
				$MovementMarkers/Right/Right7.visible = false
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
				else:
					pass
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
			#region Forward-Right Movement Marker Visibility Control
			
			$MovementMarkers/DiagonalRightForward.visible = true
			$MovementMarkers/DiagonalRightForward/FR1.visible = true
			$MovementMarkers/DiagonalRightForward/FR2.visible = true
			$MovementMarkers/DiagonalRightForward/FR3.visible = true
			$MovementMarkers/DiagonalRightForward/FR4.visible = true
			$MovementMarkers/DiagonalRightForward/FR5.visible = true
			$MovementMarkers/DiagonalRightForward/FR6.visible = true
			$MovementMarkers/DiagonalRightForward/FR7.visible = true
			
			if(enemyfr_7):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR7.visible = false
				else:
					pass
			if(enemyfr_6):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_5):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_4):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR4.visible = false
				$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_3):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR3.visible = false
				$MovementMarkers/DiagonalRightForward/FR4.visible = false
				$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_2):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR2.visible = false
				$MovementMarkers/DiagonalRightForward/FR3.visible = false
				$MovementMarkers/DiagonalRightForward/FR4.visible = false
				$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			if(enemyfr_1):
				if(fr_touching_border):
					$MovementMarkers/DiagonalRightForward/FR1.visible = false
				$MovementMarkers/DiagonalRightForward/FR2.visible = false
				$MovementMarkers/DiagonalRightForward/FR3.visible = false
				$MovementMarkers/DiagonalRightForward/FR4.visible = false
				$MovementMarkers/DiagonalRightForward/FR5.visible = false
				$MovementMarkers/DiagonalRightForward/FR6.visible = false
				$MovementMarkers/DiagonalRightForward/FR7.visible = false
			#endregion
			#region Forward-Left Movement Marker Visibility Control
			
			$MovementMarkers/DiagonalLeftFoward.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL1.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL2.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL3.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL4.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL5.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL6.visible = true
			$MovementMarkers/DiagonalLeftFoward/FL7.visible = true
			
			if(enemyfl_7):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
				else:
					pass
			if(enemyfl_6):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			if(enemyfl_5):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			if(enemyfl_4):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			if(enemyfl_3):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			if(enemyfl_2):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			if(enemyfl_1):
				if(fl_touching_border):
					$MovementMarkers/DiagonalLeftFoward/FL1.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL2.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL3.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL4.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL5.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL6.visible = false
				$MovementMarkers/DiagonalLeftFoward/FL7.visible = false
			
			#endregion
			#region Back-Right Movement Marker Visibility Control
			
			$MovementMarkers/DiagonalRightBack.visible = true
			$MovementMarkers/DiagonalRightBack/BR1.visible = true
			$MovementMarkers/DiagonalRightBack/BR2.visible = true
			$MovementMarkers/DiagonalRightBack/BR3.visible = true
			$MovementMarkers/DiagonalRightBack/BR4.visible = true
			$MovementMarkers/DiagonalRightBack/BR5.visible = true
			$MovementMarkers/DiagonalRightBack/BR6.visible = true
			$MovementMarkers/DiagonalRightBack/BR7.visible = true
			
			if(enemybr_7):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR7.visible = false
				else:
					pass
			if(enemybr_6):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
			if(enemybr_5):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
			if(enemybr_4):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR4.visible = false
				$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
			if(enemybr_3):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR3.visible = false
				$MovementMarkers/DiagonalRightBack/BR4.visible = false
				$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
			if(enemybr_2):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR2.visible = false
				$MovementMarkers/DiagonalRightBack/BR3.visible = false
				$MovementMarkers/DiagonalRightBack/BR4.visible = false
				$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
			if(enemybr_1):
				if(br_touching_border):
					$MovementMarkers/DiagonalRightBack/BR1.visible = false
				$MovementMarkers/DiagonalRightBack/BR2.visible = false
				$MovementMarkers/DiagonalRightBack/BR3.visible = false
				$MovementMarkers/DiagonalRightBack/BR4.visible = false
				$MovementMarkers/DiagonalRightBack/BR5.visible = false
				$MovementMarkers/DiagonalRightBack/BR6.visible = false
				$MovementMarkers/DiagonalRightBack/BR7.visible = false
				#endregion
			#region Back-Left Movement Markers Visibility Control
			
			$MovementMarkers/DiagonalLeftBack.visible = true
			$MovementMarkers/DiagonalLeftBack/BL1.visible = true
			$MovementMarkers/DiagonalLeftBack/BL2.visible = true
			$MovementMarkers/DiagonalLeftBack/BL3.visible = true
			$MovementMarkers/DiagonalLeftBack/BL4.visible = true
			$MovementMarkers/DiagonalLeftBack/BL5.visible = true
			$MovementMarkers/DiagonalLeftBack/BL6.visible = true
			$MovementMarkers/DiagonalLeftBack/BL7.visible = true

			if(enemybl_7):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL7.visible = false
				else:
					pass
			if(enemybl_6):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			if(enemybl_5):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			if(enemybl_4):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL4.visible = false
				$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			if(enemybl_3):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL3.visible = false
				$MovementMarkers/DiagonalLeftBack/BL4.visible = false
				$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			if(enemybl_2):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL2.visible = false
				$MovementMarkers/DiagonalLeftBack/BL3.visible = false
				$MovementMarkers/DiagonalLeftBack/BL4.visible = false
				$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			if(enemybl_1):
				if(bl_touching_border):
					$MovementMarkers/DiagonalLeftBack/BL1.visible = false
				$MovementMarkers/DiagonalLeftBack/BL2.visible = false
				$MovementMarkers/DiagonalLeftBack/BL3.visible = false
				$MovementMarkers/DiagonalLeftBack/BL4.visible = false
				$MovementMarkers/DiagonalLeftBack/BL5.visible = false
				$MovementMarkers/DiagonalLeftBack/BL6.visible = false
				$MovementMarkers/DiagonalLeftBack/BL7.visible = false
			#endregion
		elif(!focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_DISABLED
			$MovementMarkers.visible = false
	else:
		$MovementMarkers.visible = false
		focused = false
		for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_DISABLED

func _on_select_queen_button_up() -> void:
	if(Globals.piece_focused != "QueenWhite" && self.name == "QueenWhite"):
		Globals.piece_focused = "QueenWhite"
		focused = true
	elif(Globals.piece_focused != "QueenBlack" && self.name == "QueenBlack"):
		Globals.piece_focused = "QueenBlack"
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
	
	focused = false
	Globals.piece_focused = ""

#region Up, Down, Left, and Right

#region All the inputs for the Right markers.

#region All the button signals.

func _on_right_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_right_button_2_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_3_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_4_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn




func _on_right_button_5_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

	



func _on_right_button_6_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_right_button_7_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



#endregion
#region All the collision signals.

func _on_right_area_1_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right1 = true
			touching_border = true
		else:
			enemy_right1 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right1 = true
			touching_border = true
		else:
			enemy_right1 = true
	if(Globals.board_tiles[right1_tile_group][right1_tile].state == true):
		enemy_right1 = true
	

func _on_right_area_1_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right1 = false


func _on_right_area_2_body_entered(body: Node2D) -> void:
	right2_tile = body.tile
	right2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right2 = true
			touching_border = true
		else:
			enemy_right2 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right2 = true
			touching_border = true
		else:
			enemy_right2 = true
	if(Globals.board_tiles[right2_tile_group][right2_tile].state == true):
		enemy_right2 = true


func _on_right_area_2_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right2 = false


func _on_right_area_3_body_entered(body: Node2D) -> void:
	right3_tile = body.tile
	right3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right3 = true
			touching_border = true
		else:
			enemy_right3 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right3 = true
			touching_border = true
		else:
			enemy_right3 = true
	if(Globals.board_tiles[right3_tile_group][right3_tile].state == true):
		enemy_right3 = true

func _on_right_area_3_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right3 = false


func _on_right_area_4_body_entered(body: Node2D) -> void:
	right4_tile = body.tile
	right4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right4 = true
			touching_border = true
		else:
			enemy_right4 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right4 = true
			touching_border = true
		else:
			enemy_right4 = true
	if(Globals.board_tiles[right4_tile_group][right4_tile].state == true):
		enemy_right4 = true


func _on_right_area_4_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right4 = false


func _on_right_area_5_body_entered(body: Node2D) -> void:
	right5_tile = body.tile
	right5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right5 = true
			touching_border = true
		else:
			enemy_right5 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right5 = true
			touching_border = true
		else:
			enemy_right5 = true
	if(Globals.board_tiles[right5_tile_group][right5_tile].state == true):
		enemy_right5 = true


func _on_right_area_5_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right5 = false


func _on_right_area_6_body_entered(body: Node2D) -> void:
	right6_tile = body.tile
	right6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right6 = true
			touching_border = true
		else:
			enemy_right6 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right6 = true
			touching_border = true
		else:
			enemy_right6 = true
	if(Globals.board_tiles[right6_tile_group][right6_tile].state == true):
		enemy_right6 = true


func _on_right_area_6_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right6 = false


func _on_right_area_7_body_entered(body: Node2D) -> void:
	right7_tile = body.tile
	right7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_right7 = true
			touching_border = true
		else:
			enemy_right7 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_right7 = true
			touching_border = true
		else:
			enemy_right7 = true
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
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	

func _on_forward_button_2_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward2_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

func _on_forward_button_3_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward3_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_4_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward4_tile
	await get_tree().process_frame
	await get_tree().process_frame
	global_position = Globals.position_target
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_5_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward5_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
	



func _on_forward_button_6_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward6_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_forward_button_7_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward7_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward1 = true
			forward_touching_border = true
		else:
			enemy_forward1 = true
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward1 = true
			forward_touching_border = true
		else:
			enemy_forward1 = true
	if(body != self):
		if(Globals.board_tiles[forward1_tile_group][forward1_tile].state == true):
			enemy_forward1 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward2 = true
			forward_touching_border = true
		else:
			enemy_forward2 = true
	if(body != self):
		if(Globals.board_tiles[forward2_tile_group][forward2_tile].state == true):
			enemy_forward2 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward3 = true
			forward_touching_border = true
		else:
			enemy_forward3 = true
	if(body != self):
		if(Globals.board_tiles[forward3_tile_group][forward3_tile].state == true):
			enemy_forward3 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward4 = true
			forward_touching_border = true
		else:
			enemy_forward4 = true
	if(body != self):
		if(Globals.board_tiles[forward4_tile_group][forward4_tile].state == true):
			enemy_forward4 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward5 = true
			forward_touching_border = true
		else:
			enemy_forward5 = true
	if(body != self):
		if(Globals.board_tiles[forward5_tile_group][forward5_tile].state == true):
			enemy_forward5 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward6 = true
			forward_touching_border = true
		else:
			enemy_forward6 = true
	if(body != self):
		if(Globals.board_tiles[forward6_tile_group][forward6_tile].state == true):
			enemy_forward6 = true
	

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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward7 = true
			forward_touching_border = true
		else:
			enemy_forward7 = true
	if(body != self):
		if(Globals.board_tiles[forward7_tile_group][forward7_tile].state == true):
			enemy_forward7 = true


func _on_forward_7_area_body_exited(body: Node2D) -> void:
	enemy_forward7 = false

#endregion

#endregion
#region All the inputs for the Back markers.

	#region ALl the button signals


func _on_back_1_button_button_up() -> void:
	focused = false
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_2_button_button_up() -> void:
	focused = false
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_3_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_4_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_5_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_6_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_back_7_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back1 = true
			back_touching_border = true
		else:
			enemy_back1 = true
	if(Globals.board_tiles[back1_tile_group][back1_tile].state == true):
		enemy_back1 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back2 = true
			back_touching_border = true
		else:
			enemy_back2 = true
	if(Globals.board_tiles[back2_tile_group][back2_tile].state == true):
		enemy_back2 = true



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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back3 = true
			back_touching_border = true
		else:
			enemy_back3 = true
	if(Globals.board_tiles[back3_tile_group][back3_tile].state == true):
		enemy_back3 = true



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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back4 = true
			back_touching_border = true
		else:
			enemy_back4 = true
	if(Globals.board_tiles[back4_tile_group][back4_tile].state == true):
		enemy_back4 = true



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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back5 = true
			back_touching_border = true
		else:
			enemy_back5 = true
	if(Globals.board_tiles[back5_tile_group][back5_tile].state == true):
		enemy_back5 = true



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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back6 = true
			back_touching_border = true
		else:
			enemy_back6 = true
	if(Globals.board_tiles[back6_tile_group][back6_tile].state == true):
		enemy_back5 = true



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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back7 = true
			back_touching_border = true
		else:
			enemy_back7 = true
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
#region All the inputs for the Left markers.

	#region All the Button signals


func _on_left_1_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_2_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_3_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_left_4_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn



func _on_left_5_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_6_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


func _on_left_7_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left7_tile # tells the global script that youre accessing tile X
	Globals.accessing_group = left7_tile_group
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.
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
	if(not area.is_in_group("Edge")):
		left_touching_border = false


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left1 = true
			left_touching_border = true
		else:
			enemy_left1 = true
	if(Globals.board_tiles[left1_tile_group][left1_tile].state == true):
		enemy_left1 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left2 = true
			left_touching_border = true
		else:
			enemy_left2 = true
	if(Globals.board_tiles[left2_tile_group][left2_tile].state == true):
		enemy_left2 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left3 = true
			left_touching_border = true
		else:
			enemy_left3 = true
	if(body != self):
		if(Globals.board_tiles[left3_tile_group][left3_tile].state == true):
			enemy_left3 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left4 = true
			left_touching_border = true
		else:
			enemy_left4 = true
	if(body != self):
		if(Globals.board_tiles[left4_tile_group][left4_tile].state == true):
			enemy_left4 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left5 = true
			left_touching_border = true
		else:
			enemy_left5 = true
	if(body != self):
		if(Globals.board_tiles[left5_tile_group][left5_tile].state == true):
			enemy_left5 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left6 = true
			left_touching_border = true
		else:
			enemy_left6 = true
	if(body != self):
		if(Globals.board_tiles[left6_tile_group][left6_tile].state == true):
			enemy_left6 = true


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
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_left7 = true
			left_touching_border = true
		else:
			enemy_left7 = true
	if(body != self):
		if(Globals.board_tiles[left7_tile_group][left7_tile].state == true):
			enemy_left7 = true


func _on_left_7_area_body_exited(body: Node2D) -> void:
	enemy_left7 = false

#endregion

#endregion

#endregion

#region Diagonal (FR, FL, BR, BL)

#region Diagonal Forward-Right

#region All the Button Signals


func _on_fr_1_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_2_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_3_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_4_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_5_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_6_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fr_7_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.

#endregion
#region All the Edge Collisional Signals
	

func _on_fr_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_1 = true
	if(area.is_in_group("Tiles")):
		fr1_tile = area.name
		fr1_tile_group = str(area.name)[0]


func _on_fr_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_1 = false


func _on_fr_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_2 = true
	if(area.is_in_group("Tiles")):
		fr2_tile = area.name
		fr2_tile_group = str(area.name)[0]


func _on_fr_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_2 = false


func _on_fr_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_3 = true
	if(area.is_in_group("Tiles")):
		fr3_tile = area.name
		fr3_tile_group = str(area.name)[0]


func _on_fr_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_3 = false


func _on_fr_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_4 = true
	if(area.is_in_group("Tiles")):
		fr4_tile = area.name
		fr4_tile_group = str(area.name)[0]


func _on_fr_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_4 = false


func _on_fr_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_5 = true
	if(area.is_in_group("Tiles")):
		fr5_tile = area.name
		fr5_tile_group = str(area.name)[0]


func _on_fr_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_5 = false


func _on_fr_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_6 = true
	if(area.is_in_group("Tiles")):
		fr6_tile = area.name
		fr6_tile_group = str(area.name)[0]


func _on_fr_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_6 = false


func _on_fr_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemyfr_7 = true
	if(area.is_in_group("Tiles")):
		fr7_tile = area.name
		fr7_tile_group = str(area.name)[0]


func _on_fr_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemyfr_7 = false

#endregion
#region All the Collisions


func _on_fr_1_area_body_entered(body: Node2D) -> void:
	fr1_tile = body.tile
	fr1_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr1_tile_group][fr1_tile].state == true):
			enemyfr_1 = true


func _on_fr_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_1 = false


func _on_fr_2_area_body_entered(body: Node2D) -> void:
	fr2_tile = body.tile
	fr2_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr2_tile_group][fr2_tile].state == true):
			enemyfr_2 = true


func _on_fr_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_2 = false


func _on_fr_3_area_body_entered(body: Node2D) -> void:
	fr2_tile = body.tile
	fr2_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr2_tile_group][fr2_tile].state == true):
			enemyfr_2 = true


func _on_fr_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_3 = false


func _on_fr_4_area_body_entered(body: Node2D) -> void:
	fr4_tile = body.tile
	fr4_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr4_tile_group][fr4_tile].state == true):
			enemyfr_4 = true


func _on_fr_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_4 = false


func _on_fr_5_area_body_entered(body: Node2D) -> void:
	fr5_tile = body.tile
	fr5_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr5_tile_group][fr5_tile].state == true):
			enemyfr_5 = true


func _on_fr_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_5 = false


func _on_fr_6_area_body_entered(body: Node2D) -> void:
	fr1_tile = body.tile
	fr6_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr6_tile_group][fr6_tile].state == true):
			enemyfr_6 = true


func _on_fr_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_6 = false


func _on_fr_7_area_body_entered(body: Node2D) -> void:
	fr7_tile = body.tile
	fr7_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fr7_tile_group][fr7_tile].state == true):
			enemyfr_7 = true


func _on_fr_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_7 = false

#endregion

#endregion

#region Diagonal Forward-Left

#region ALl the Button Signals


func _on_fl_1_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_2_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_3_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_4_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_5_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_6_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_fl_7_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.

#endregion
#region All the Edge Collision Signals
	

func _on_fl_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_1 = true
	if(area.is_in_group("Tiles")):
		fl1_tile = area.name
		fl1_tile_group = str(area.name)[0]


func _on_fl_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_1 = false


func _on_fl_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_2 = true
	if(area.is_in_group("Tiles")):
		fl2_tile = area.name
		fl2_tile_group = str(area.name)[0]


func _on_fl_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_2 = false


func _on_fl_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_3 = true
	if(area.is_in_group("Tiles")):
		fl3_tile = area.name
		fl3_tile_group = str(area.name)[0]


func _on_fl_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_3 = false


func _on_fl_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_4 = true
	if(area.is_in_group("Tiles")):
		fl4_tile = area.name
		fl4_tile_group = str(area.name)[0]


func _on_fl_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_4 = false


func _on_fl_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_5 = true
	if(area.is_in_group("Tiles")):
		fl5_tile = area.name
		fl5_tile_group = str(area.name)[0]


func _on_fl_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_5 = false


func _on_fl_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_6 = true
	if(area.is_in_group("Tiles")):
		fl6_tile = area.name
		fl6_tile_group = str(area.name)[0]


func _on_fl_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_6 = false


func _on_fl_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemyfl_7 = true
	if(area.is_in_group("Tiles")):
		fl7_tile = area.name
		fl7_tile_group = str(area.name)[0]


func _on_fl_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemyfl_7 = false

#endregion
#region All the Collision Signals
	
	

func _on_fl_1_area_body_entered(body: Node2D) -> void:
	fl1_tile = body.tile
	fl1_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl1_tile_group][fl1_tile].state == true):
			enemyfl_1 = true


func _on_fl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_1 = false


func _on_fl_2_area_body_entered(body: Node2D) -> void:
	fl2_tile = body.tile
	fl2_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl2_tile_group][fl2_tile].state == true):
			enemyfl_2 = true


func _on_fl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_2 = false


func _on_fl_3_area_body_entered(body: Node2D) -> void:
	fl3_tile = body.tile
	fl3_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl3_tile_group][fl3_tile].state == true):
			enemyfl_3 = true


func _on_fl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_3 = false


func _on_fl_4_area_body_entered(body: Node2D) -> void:
	fl4_tile = body.tile
	fl4_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl4_tile_group][fl4_tile].state == true):
			enemyfl_4 = true


func _on_fl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_4 = false


func _on_fl_5_area_body_entered(body: Node2D) -> void:
	fl5_tile = body.tile
	fl5_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl5_tile_group][fl5_tile].state == true):
			enemyfl_5 = true


func _on_fl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_5 = false


func _on_fl_6_area_body_entered(body: Node2D) -> void:
	fl6_tile = body.tile
	fl6_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl6_tile_group][fl6_tile].state == true):
			enemyfl_6 = true


func _on_fl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_6 = false


func _on_fl_7_area_body_entered(body: Node2D) -> void:
	fl7_tile = body.tile
	fl7_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[fl7_tile_group][fl7_tile].state == true):
			enemyfl_7 = true


func _on_fl_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_7 = false

#endregion

#endregion

#region Diagonal Back-Right

#region All the Button Signals


func _on_br_1_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_2_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_3_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_4_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_5_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_6_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_br_7_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.

#endregion
#region All the Edge Collision Signals


func _on_br_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_1 = true
	if(area.is_in_group("Tiles")):
		br1_tile = area.name
		br1_tile_group = str(area.name)[0]


func _on_br_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_1 = false


func _on_br_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_2 = true
	if(area.is_in_group("Tiles")):
		br2_tile = area.name
		br2_tile_group = str(area.name)[0]


func _on_br_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_2 = false


func _on_br_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_3 = true
	if(area.is_in_group("Tiles")):
		br3_tile = area.name
		br3_tile_group = str(area.name)[0]


func _on_br_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_3 = false


func _on_br_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_4 = true
	if(area.is_in_group("Tiles")):
		br4_tile = area.name
		br4_tile_group = str(area.name)[0]


func _on_br_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_4 = false


func _on_br_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_5 = true
	if(area.is_in_group("Tiles")):
		br5_tile = area.name
		br5_tile_group = str(area.name)[0]


func _on_br_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_5 = false


func _on_br_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_6 = true
	if(area.is_in_group("Tiles")):
		br6_tile = area.name
		br6_tile_group = str(area.name)[0]

func _on_br_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_6 = false


func _on_br_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemybr_7 = true
	if(area.is_in_group("Tiles")):
		br7_tile = area.name
		br7_tile_group = str(area.name)[0]


func _on_br_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemybr_7 = false

#endregion
#region All the Collision Signals


func _on_br_1_area_body_entered(body: Node2D) -> void:
	br1_tile = body.tile
	br1_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br1_tile_group][br1_tile].state == true):
			enemybr_1 = true


func _on_br_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_1 = false


func _on_br_2_area_body_entered(body: Node2D) -> void:
	br1_tile = body.tile
	br2_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br2_tile_group][br2_tile].state == true):
			enemybr_2 = true


func _on_br_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_2 = false


func _on_br_3_area_body_entered(body: Node2D) -> void:
	br3_tile = body.tile
	br3_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br3_tile_group][br3_tile].state == true):
			enemybr_3 = true


func _on_br_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_3 = false


func _on_br_4_area_body_entered(body: Node2D) -> void:
	br4_tile = body.tile
	br4_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br4_tile_group][br4_tile].state == true):
			enemybr_4 = true


func _on_br_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_4 = false


func _on_br_5_area_body_entered(body: Node2D) -> void:
	br5_tile = body.tile
	br5_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br5_tile_group][br5_tile].state == true):
			enemybr_5 = true


func _on_br_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_5 = false


func _on_br_6_area_body_entered(body: Node2D) -> void:
	br6_tile = body.tile
	br6_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br6_tile_group][br6_tile].state == true):
			enemybr_6 = true


func _on_br_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_6 = false


func _on_br_7_area_body_entered(body: Node2D) -> void:
	br7_tile = body.tile
	br7_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[br7_tile_group][br7_tile].state == true):
			enemybr_7 = true


func _on_br_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_7 = false

#endregion

#endregion

#region Diagonal Back-Left

#region All the Button Signals


func _on_bl_1_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl1_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_2_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl2_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_3_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl3_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_4_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl4_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_5_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl5_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_6_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl6_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.


func _on_bl_7_button_button_up() -> void:
	Globals.turn_tracking += 1 # change turn
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl7_tile # tells the global script that youre accessing tile X
	reset_markers()
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target # change the position to the target.

#endregion
#region All the Edge Collision

func _on_bl_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_1 = true
	if(area.is_in_group("Tiles")):
		bl1_tile = area.name
		bl1_tile_group = str(area.name)[0]


func _on_bl_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_1 = false


func _on_bl_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_2 = true
	if(area.is_in_group("Tiles")):
		bl2_tile = area.name
		bl2_tile_group = str(area.name)[0]


func _on_bl_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_2 = false


func _on_bl_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_3 = true
	if(area.is_in_group("Tiles")):
		bl3_tile = area.name
		bl3_tile_group = str(area.name)[0]


func _on_bl_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_3 = false


func _on_bl_4_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_4 = true
	if(area.is_in_group("Tiles")):
		bl4_tile = area.name
		bl4_tile_group = str(area.name)[0]


func _on_bl_4_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_4 = false


func _on_bl_5_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_5 = true
	if(area.is_in_group("Tiles")):
		bl5_tile = area.name
		bl5_tile_group = str(area.name)[0]


func _on_bl_5_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_5 = false


func _on_bl_6_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_6 = true
	if(area.is_in_group("Tiles")):
		bl6_tile = area.name
		bl6_tile_group = str(area.name)[0]


func _on_bl_6_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_6 = false


func _on_bl_7_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemybl_7 = true
	if(area.is_in_group("Tiles")):
		bl7_tile = area.name
		bl7_tile_group = str(area.name)[0]


func _on_bl_7_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemybl_7 = false

#endregion
#region All the Collisions

func _on_bl_1_area_body_entered(body: Node2D) -> void:
	bl1_tile = body.tile
	bl1_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl1_tile_group][bl1_tile].state == true):
			enemybl_1 = true


func _on_bl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_1 = false


func _on_bl_2_area_body_entered(body: Node2D) -> void:
	bl2_tile = body.tile
	bl2_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl2_tile_group][bl2_tile].state == true):
			enemybl_2 = true


func _on_bl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_2 = false


func _on_bl_3_area_body_entered(body: Node2D) -> void:
	bl3_tile = body.tile
	bl3_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl3_tile_group][bl3_tile].state == true):
			enemybl_3 = true

func _on_bl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_3 = false


func _on_bl_4_area_body_entered(body: Node2D) -> void:
	bl4_tile = body.tile
	bl4_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl4_tile_group][bl4_tile].state == true):
			enemybl_4 = true


func _on_bl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_4 = false


func _on_bl_5_area_body_entered(body: Node2D) -> void:
	bl5_tile = body.tile
	bl5_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl5_tile_group][bl5_tile].state == true):
			enemybl_5 = true


func _on_bl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_5 = false


func _on_bl_6_area_body_entered(body: Node2D) -> void:
	bl6_tile = body.tile
	bl6_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl6_tile_group][bl6_tile].state == true):
			enemybl_6 = true


func _on_bl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_6 = false


func _on_bl_7_area_body_entered(body: Node2D) -> void:
	bl7_tile = body.tile
	bl7_tile_group = body.tile_group
	if(body != self):
		if(Globals.board_tiles[bl7_tile_group][bl7_tile].state == true):
			enemybl_7 = true


func _on_bl_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_7 = false

#endregion

#endregion

#endregion
