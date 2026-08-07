extends CharacterBody2D


var fr_touching_border
var fl_touching_border
var br_touching_border
var bl_touching_border
var focused
var taking

var tile
var tile_group


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
	focused = false
	if(self.name == "BishopH6"):
		tile = "H6"
		tile_group = "H"
	elif(self.name == "BishopBlackA6"):
		tile = "A6"
		tile_group = "H"
	elif(self.name == "BishopBlackA3"):
		tile = "A3"
		tile_group = "A"
	else:
		tile = "H3"
		tile_group = "H"


func _process(delta: float) -> void:
	if(Globals.piece_focused == self.name):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectBishop.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_INHERIT
			z_index = 5
			move_to_front()
			taking = true
			#region Forward-Right Movement Marker Visibility Control
			$MovementMarkers.visible = true
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
			z_index = 1
			$MovementMarkers.visible = false
	else:
		$MovementMarkers.visible = false
		focused = false
		for child in $MovementMarkers.get_children():
			child.process_mode = Node.PROCESS_MODE_DISABLED
		$SelectBishop.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_select_bishop_button_up() -> void:
	if(Globals.turn_tracking == 0 && self.is_in_group("Black") || Globals.turn_tracking == 1 && self.is_in_group("White")):
		if(Globals.piece_focused != self.name):
			Globals.piece_focused = self.name
			focused = true
		else:
			Globals.piece_focused = ""
			focused = false


func _on_collision_area_body_entered(body: Node2D) -> void:
	if(self.name != body.name):
		if(taking):
			body.queue_free()
			taking = false
		else:
			queue_free()


func _on_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]


func reset_markers():
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

	focused = false
	Globals.piece_focused = ""


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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_1 = true
			fr_touching_border = true
		else:
			enemyfr_1 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_1 = true
			fr_touching_border = true
		else:
			enemyfr_1 = true
			fr_touching_border = false


func _on_fr_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_1 = false


func _on_fr_2_area_body_entered(body: Node2D) -> void:
	fr2_tile = body.tile
	fr2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_2 = true
			fr_touching_border = true
		else:
			enemyfr_2 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_2 = true
			fr_touching_border = true
		else:
			enemyfr_2 = true
			fr_touching_border = false


func _on_fr_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_2 = false


func _on_fr_3_area_body_entered(body: Node2D) -> void:
	fr2_tile = body.tile
	fr2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_3 = true
			fr_touching_border = true
		else:
			enemyfr_3 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_3 = true
			fr_touching_border = true
		else:
			enemyfr_3 = true
			fr_touching_border = false

func _on_fr_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_3 = false


func _on_fr_4_area_body_entered(body: Node2D) -> void:
	fr4_tile = body.tile
	fr4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_4 = true
			fr_touching_border = true
		else:
			enemyfr_4 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_4 = true
			fr_touching_border = true
		else:
			enemyfr_4 = true
			fr_touching_border = false


func _on_fr_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_4 = false


func _on_fr_5_area_body_entered(body: Node2D) -> void:
	fr5_tile = body.tile
	fr5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_5 = true
			fr_touching_border = true
		else:
			enemyfr_5 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_5 = true
			fr_touching_border = true
		else:
			enemyfr_5 = true
			fr_touching_border = false


func _on_fr_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_5 = false


func _on_fr_6_area_body_entered(body: Node2D) -> void:
	fr1_tile = body.tile
	fr6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_6 = true
			fr_touching_border = true
		else:
			enemyfr_6 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_6 = true
			fr_touching_border = true
		else:
			enemyfr_6 = true
			fr_touching_border = false


func _on_fr_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfr_6 = false


func _on_fr_7_area_body_entered(body: Node2D) -> void:
	fr7_tile = body.tile
	fr7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfr_7 = true
			fr_touching_border = true
		else:
			enemyfr_7 = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfr_7 = true
			fr_touching_border = true
		else:
			enemyfr_7 = true
			fr_touching_border = false


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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_1 = true
			fl_touching_border = true
		else:
			enemyfl_1 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_1 = true
			fl_touching_border = true
		else:
			enemyfl_1 = true
			fl_touching_border = false


func _on_fl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_1 = false


func _on_fl_2_area_body_entered(body: Node2D) -> void:
	fl2_tile = body.tile
	fl2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_2 = true
			fl_touching_border = true
		else:
			enemyfl_2 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_2 = true
			fl_touching_border = true
		else:
			enemyfl_2 = true
			fl_touching_border = false


func _on_fl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_2 = false


func _on_fl_3_area_body_entered(body: Node2D) -> void:
	fl3_tile = body.tile
	fl3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_3 = true
			fl_touching_border = true
		else:
			enemyfl_3 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_3 = true
			fl_touching_border = true
		else:
			enemyfl_3 = true
			fl_touching_border = false


func _on_fl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_3 = false


func _on_fl_4_area_body_entered(body: Node2D) -> void:
	fl4_tile = body.tile
	fl4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_4 = true
			fl_touching_border = true
		else:
			enemyfl_4 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_4 = true
			fl_touching_border = true
		else:
			enemyfl_4 = true
			fl_touching_border = false


func _on_fl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_4 = false


func _on_fl_5_area_body_entered(body: Node2D) -> void:
	fl5_tile = body.tile
	fl5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_5 = true
			fl_touching_border = true
		else:
			enemyfl_5 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_5 = true
			fl_touching_border = true
		else:
			enemyfl_5 = true
			fl_touching_border = false


func _on_fl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_5 = false


func _on_fl_6_area_body_entered(body: Node2D) -> void:
	fl6_tile = body.tile
	fl6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_6 = true
			fl_touching_border = true
		else:
			enemyfl_6 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_6 = true
			fl_touching_border = true
		else:
			enemyfl_6 = true
			fl_touching_border = false


func _on_fl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemyfl_6 = false


func _on_fl_7_area_body_entered(body: Node2D) -> void:
	fl7_tile = body.tile
	fl7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemyfl_7 = true
			fl_touching_border = true
		else:
			enemyfl_7 = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemyfl_7 = true
			fl_touching_border = true
		else:
			enemyfl_7 = true
			fl_touching_border = false


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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_1 = true
			br_touching_border = true
		else:
			enemybr_1 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_1 = true
			br_touching_border = true
		else:
			enemybr_1 = true
			br_touching_border = false


func _on_br_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_1 = false


func _on_br_2_area_body_entered(body: Node2D) -> void:
	br1_tile = body.tile
	br2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_2 = true
			br_touching_border = true
		else:
			enemybr_2 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_2 = true
			br_touching_border = true
		else:
			enemybr_2 = true
			br_touching_border = false


func _on_br_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_2 = false


func _on_br_3_area_body_entered(body: Node2D) -> void:
	br3_tile = body.tile
	br3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_3 = true
			br_touching_border = true
		else:
			enemybr_3 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_3 = true
			br_touching_border = true
		else:
			enemybr_3 = true
			br_touching_border = false


func _on_br_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_3 = false


func _on_br_4_area_body_entered(body: Node2D) -> void:
	br4_tile = body.tile
	br4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_4 = true
			br_touching_border = true
		else:
			enemybr_4 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_4 = true
			br_touching_border = true
		else:
			enemybr_4 = true
			br_touching_border = false

func _on_br_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_4 = false


func _on_br_5_area_body_entered(body: Node2D) -> void:
	br5_tile = body.tile
	br5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_5 = true
			br_touching_border = true
		else:
			enemybr_5 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_5 = true
			br_touching_border = true
		else:
			enemybr_5 = true
			br_touching_border = false


func _on_br_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_5 = false


func _on_br_6_area_body_entered(body: Node2D) -> void:
	br6_tile = body.tile
	br6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_6 = true
			br_touching_border = true
		else:
			enemybr_6 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_6 = true
			br_touching_border = true
		else:
			enemybr_6 = true
			br_touching_border = false


func _on_br_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybr_6 = false


func _on_br_7_area_body_entered(body: Node2D) -> void:
	br7_tile = body.tile
	br7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybr_7 = true
			br_touching_border = true
		else:
			enemybr_7 = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybr_7 = true
			br_touching_border = true
		else:
			enemybr_7 = true
			br_touching_border = false


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
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_1 = true
			bl_touching_border = true
		else:
			enemybl_1 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_1 = true
			bl_touching_border = true
		else:
			enemybl_1 = true
			bl_touching_border = false


func _on_bl_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_1 = false


func _on_bl_2_area_body_entered(body: Node2D) -> void:
	bl2_tile = body.tile
	bl2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_2 = true
			bl_touching_border = true
		else:
			enemybl_2 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_2 = true
			bl_touching_border = true
		else:
			enemybl_2 = true
			bl_touching_border = false


func _on_bl_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_2 = false


func _on_bl_3_area_body_entered(body: Node2D) -> void:
	bl3_tile = body.tile
	bl3_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_3 = true
			bl_touching_border = true
		else:
			enemybl_3 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_3 = true
			bl_touching_border = true
		else:
			enemybl_3 = true
			bl_touching_border = false


func _on_bl_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_3 = false


func _on_bl_4_area_body_entered(body: Node2D) -> void:
	bl4_tile = body.tile
	bl4_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_4 = true
			bl_touching_border = true
		else:
			enemybl_4 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_4 = true
			bl_touching_border = true
		else:
			enemybl_4 = true
			bl_touching_border = false


func _on_bl_4_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_4 = false


func _on_bl_5_area_body_entered(body: Node2D) -> void:
	bl5_tile = body.tile
	bl5_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_5 = true
			bl_touching_border = true
		else:
			enemybl_5 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_5 = true
			bl_touching_border = true
		else:
			enemybl_5 = true
			bl_touching_border = false


func _on_bl_5_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_5 = false


func _on_bl_6_area_body_entered(body: Node2D) -> void:
	bl6_tile = body.tile
	bl6_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_6 = true
			bl_touching_border = true
		else:
			enemybl_6 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_6 = true
			bl_touching_border = true
		else:
			enemybl_6 = true
			bl_touching_border = false


func _on_bl_6_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_6 = false


func _on_bl_7_area_body_entered(body: Node2D) -> void:
	bl7_tile = body.tile
	bl7_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemybl_7 = true
			bl_touching_border = true
		else:
			enemybl_7 = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemybl_7 = true
			bl_touching_border = true
		else:
			enemybl_7 = true
			bl_touching_border = false


func _on_bl_7_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemybl_7 = false

#endregion

#endregion

#endregion
