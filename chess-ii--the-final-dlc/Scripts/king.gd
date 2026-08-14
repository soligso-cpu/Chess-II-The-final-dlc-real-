extends CharacterBody2D

var forward_touching_border
var touching_border
var left_touching_border
var back_touching_border
var fr_touching_border
var fl_touching_border
var br_touching_border
var bl_touching_border

var moved
var no_castle_right
var no_castle_left
var focused
var taking

var tile
var tile_group

var close_to_king_left
var close_to_king_right
var close_to_king_forward
var close_to_king_back

var close_to_king_fl
var close_to_king_fr
var close_to_king_bl
var close_to_king_br
var close_to_king_castle_right1
var close_to_king_castle_left1
var close_to_king_castle_right2
var close_to_king_castle_left2

var enemy_left1
var enemy_left2
var enemy_left3
var enemy_right1
var enemy_right2
var enemy_right3
var enemy_forward
var enemy_back

var enemy_fr
var enemy_fl
var enemy_br
var enemy_bl

var fr_tile
var fr_tile_group
var fl_tile
var fl_tile_group
var br_tile
var br_tile_group
var bl_tile
var bl_tile_group
var forward_tile
var forward_tile_group
var left1_tile
var left1_tile_group
var right1_tile
var right1_tile_group
var back_tile
var back_tile_group

func _ready() -> void:
	focused = false
	moved = false
	no_castle_left = false
	no_castle_right = false


func _process(delta: float) -> void:
	
	if ($MovementMarkers/Left3/Left3Sprite/Left3Area.get_overlapping_bodies().is_empty()):
		if(!left_touching_border):
			enemy_left3 = false
		else:
			if($MovementMarkers/Left3/Left3Sprite/Left3Area.get_overlapping_bodies().is_empty()):
				enemy_left3 = false

	if(self.name == "BlackKing"):
		if(Globals.rook_a1_moved):
			no_castle_left = true
		elif(Globals.rook_a8_moved):
			no_castle_right = true
	if(self.name == "WhiteKing"):
		if(Globals.rook_h1_moved):
			no_castle_left = true
		elif(Globals.rook_h8_moved):
			no_castle_right = true
	if(Globals.piece_focused == self.name):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(close_to_king_castle_left1):
		no_castle_left = true
	if(close_to_king_castle_left2):
		no_castle_right = true
	if(close_to_king_castle_right1):
		no_castle_right = true
	if(close_to_king_castle_right2):
		no_castle_right = true
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectKing.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_INHERIT
			z_index = 5
			move_to_front()
			taking = true
			
			#region forward
			
			$MovementMarkers.visible = true
			$MovementMarkers/Forward.visible = true
			if(enemy_forward):
				$MovementMarkers/Forward.visible = false
			if(close_to_king_forward):
				$MovementMarkers/Forward.visible = false
			#endregion
			#region back
			
			$MovementMarkers/Back.visible = true
			if(enemy_back):
				$MovementMarkers/Back.visible = true
				if(back_touching_border):
					$MovementMarkers/Back.visible = false
			if(close_to_king_back):
				$MovementMarkers/Back.visible = false
			
			#endregion
			#region left
			
			$MovementMarkers/Left1.visible = true
			$MovementMarkers/Left2.visible = true
			$MovementMarkers/Left3.visible = true
			
			if(!moved):
				$MovementMarkers/Left2.visible = true
				$MovementMarkers/Left3.visible = true
			if(enemy_left1):
				$MovementMarkers/Left1.visible = true
				$MovementMarkers/Left2.visible = false
				$MovementMarkers/Left3.visible = false
				if(left_touching_border):
					$MovementMarkers/Left1.visible = false
			elif(enemy_left2):
				$MovementMarkers/Left1.visible = true
				$MovementMarkers/Left2.visible = false
				$MovementMarkers/Left3.visible = false
			elif(enemy_left3):
				$MovementMarkers/Left1.visible = true
				$MovementMarkers/Left2.visible = true
				$MovementMarkers/Left3.visible = false
			if(close_to_king_left):
				$MovementMarkers/Left1.visible = false
				$MovementMarkers/Left2.visible = false
				$MovementMarkers/Left3.visible = false
			if(no_castle_left):
				$MovementMarkers/Left2.visible = false
				$MovementMarkers/Left3.visible = false
			if(moved):
				$MovementMarkers/Left2.visible = false
				$MovementMarkers/Left3.visible = false
			if(self.is_in_group("White")):
				$MovementMarkers/Left2.visible = false
			else:
				$MovementMarkers/Left3.visible = false
			#endregion
			#region right
			
			$MovementMarkers/Right1.visible = true
			$MovementMarkers/Right2.visible = true
			$MovementMarkers/Right3.visible = true
			
			if(!moved):
				$MovementMarkers/Right2.visible = true
				$MovementMarkers/Right3.visible = true
			if(enemy_right1):
				$MovementMarkers/Right1.visible = true
				$MovementMarkers/Right2.visible = false
				$MovementMarkers/Right3.visible = false
				if(touching_border):
					$MovementMarkers/Right1.visible = false
			elif(enemy_right2):
				$MovementMarkers/Right1.visible = true
				$MovementMarkers/Right2.visible = false
				$MovementMarkers/Right3.visible = false
			elif(enemy_right3):
				$MovementMarkers/Right1.visible = true
				$MovementMarkers/Right2.visible = true
				$MovementMarkers/Right3.visible = false
			if(close_to_king_right):
				$MovementMarkers/Right1.visible = false
				$MovementMarkers/Right2.visible = false
				$MovementMarkers/Right3.visible = false
			if(no_castle_right):
				$MovementMarkers/Right2.visible = false
				$MovementMarkers/Right3.visible = false
			if(moved):
				$MovementMarkers/Right2.visible = false
				$MovementMarkers/Right3.visible = false
			if(self.is_in_group("White")):
				$MovementMarkers/Right3.visible = false
			else:
				$MovementMarkers/Right2.visible = false
			#endregion
			#region diagonals
			
			$MovementMarkers/FL.visible = true
			$MovementMarkers/FR.visible = true
			$MovementMarkers/DL.visible = true
			$MovementMarkers/DR.visible = true
			
			if(fl_touching_border || close_to_king_fl):
				$MovementMarkers/FL.visible = false
			if(fr_touching_border || close_to_king_fr):
				$MovementMarkers/FR.visible = false
			if(bl_touching_border || close_to_king_bl):
				$MovementMarkers/DL.visible = false
			if(br_touching_border || close_to_king_br):
				$MovementMarkers/DR.visible = false
			
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
		$SelectKing.mouse_filter = Control.MOUSE_FILTER_IGNORE

func reset_markers():
	
	enemy_back = false
	enemy_forward = false
	enemy_left1 = false
	enemy_left2 = false
	enemy_left3 = false
	enemy_right1 = false
	enemy_right2 = false
	enemy_right3 = false
	enemy_fl = false
	enemy_fr = false
	enemy_bl = false
	enemy_br = false
	close_to_king_left = false
	close_to_king_right = false
	close_to_king_forward = false
	close_to_king_back = false
	close_to_king_fl = false
	close_to_king_fr = false
	close_to_king_bl = false
	close_to_king_br = false
	close_to_king_castle_right1 = false
	close_to_king_castle_left1 = false
	close_to_king_castle_right2 = false
	close_to_king_castle_left2 = false
	
	focused = false
	Globals.piece_focused = ""


func _on_select_king_button_up() -> void:
	if(Globals.turn_tracking == 0 && self.is_in_group("Black") || Globals.turn_tracking == 1 && self.is_in_group("White")):
		if(Globals.piece_focused != self.name):
			Globals.piece_focused = self.name
			focused = true
		elif(Globals.piece_focused != self.name):
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
	if(self.name != body.name):
		if(taking):
			body.queue_free()
			taking = false
		else:
			var who_lost
			if(self.is_in_group("White")):
				Globals.white_lost = true
				Globals.black_won = true
			else:
				Globals.black_lost = true
				Globals.white_won = true
			queue_free()


#region cardinal movement
#region forward
#region movementmarker


func _on_forward_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		forward_tile = area.name
		forward_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		enemy_forward = true


func _on_forward_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		enemy_forward = false


func _on_forward_area_body_entered(body: Node2D) -> void:
	forward_tile = body.tile
	forward_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_forward = true
			forward_touching_border = true
		else:
			enemy_forward = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_forward = true
			forward_touching_border = true
		else:
			enemy_forward = true
			forward_touching_border = false


func _on_forward_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_forward = false


func _on_forward_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region closetoking

func _on_close_forward_area_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_forward = true
	else:
		close_to_king_forward = false


func _on_close_forward_area_body_exited(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_forward = false
	else:
		pass

#endregion
#endregion

#region left
#region left1

func _on_left_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		left1_tile = area.name
		left1_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left1 = true


func _on_left_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left1 = false


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
	if(body.is_in_group("Pieces")):
		enemy_left1 = false


func _on_left_1_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = left1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region left2


func _on_left_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left2 = true


func _on_left_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left2 = false


func _on_left_2_area_body_entered(body: Node2D) -> void:
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
	if(body.is_in_group("Pieces")):
		enemy_left2 = false


func _on_left_2_button_button_up() -> void:
	if(self.name == "BlackKing"):
		$"../../Black/RookBlackA1".global_position = Vector2(496, 43)
		global_position = Vector2(416, 43)
		Globals.rook_a1_moved = true
		Globals.moved = true
		moved = true
		Globals.turn_tracking += 1


#endregion
#region left3
func _on_left_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left3 = true


func _on_left_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left3 = false


func _on_left_3_area_body_entered(body: Node2D) -> void:
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
	if(body.is_in_group("Pieces")):
		enemy_left2 = false


func _on_left_3_button_button_up() -> void:
	if(self.name == "WhiteKing"):
		$"../RookH1".global_position = Vector2(496, 603)
		global_position = Vector2(416, 603)
		Globals.rook_h1_moved = true
		Globals.moved = true
		moved = true
		Globals.turn_tracking += 1
#endregion
#region close_to_king

func _on_close_left_area_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_left = true
	else:
		close_to_king_left = false


func _on_close_left_area_body_exited(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_left = false
	else:
		pass

#endregion
#endregion

#region right
#region right1


func _on_right_1_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		right1_tile = area.name
		right1_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right1 = true


func _on_right_1_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right1 = false


func _on_right_1_area_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
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


func _on_right_1_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right1 = false


func _on_right_1_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = right1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region right2

func _on_right_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right2 = true


func _on_right_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right2 = false


func _on_right_2_area_body_entered(body: Node2D) -> void:
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


func _on_right_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right2 = false


func _on_right_2_button_button_up() -> void:
	if(self.name == "WhiteKing"):
		$"../RookH8".global_position = Vector2(736, 603)
		global_position = Vector2(816, 603)
		Globals.rook_h8_moved = true
		Globals.moved = true
		moved = true
		Globals.turn_tracking += 1

#endregion
#region right3

func _on_right_3_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right3 = true


func _on_right_3_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right3 = false


func _on_right_3_area_body_entered(body: Node2D) -> void:
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


func _on_right_3_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_right3 = false


func _on_right_3_button_button_up() -> void:
	if(self.name == "BlackKing"):
		$"../../Black/RookBlackA8".global_position = Vector2(736, 43)
		global_position = Vector2(816, 43)
		Globals.rook_a8_moved = true
		Globals.moved = true
		Globals.turn_tracking += 1
		moved = true
#endregion
#region close to king


func _on_close_right_area_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_right = true
	else:
		close_to_king_right = false


func _on_close_right_area_body_exited(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_right = false
	else:
		pass

#endregion
#endregion

#region back


func _on_back_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		back_tile = area.name
		back_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		back_touching_border = true
		enemy_back = true


func _on_back_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		back_touching_border = false
		enemy_back = false


func _on_back_area_body_entered(body: Node2D) -> void:
	back_tile = body.tile
	back_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_back = true
			back_touching_border = true
		else:
			enemy_back = true
			back_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_back = true
			back_touching_border = true
		else:
			enemy_back = true
			back_touching_border = false


func _on_back_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_back = false


func _on_back_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = back_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#endregion 
#region close_to_king diagonals.

#region forward
func _on_up_forward_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_fl = true
		close_to_king_forward = true


func _on_left_forward_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_fl = true


func _on_down_forward_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_fl = true
		close_to_king_left = true
		close_to_king_castle_left1 = true
		close_to_king_castle_left2 = true


func _on_up_forward_right_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_forward = true
		close_to_king_fr = true


func _on_right_forward_right_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_fr = true


func _on_down_forward_right_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_fr = true
		close_to_king_right = true
		close_to_king_castle_right1 = true
		close_to_king_castle_right2 = true

#endregion

#region back
func _on_up_right_back_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_bl = true
		close_to_king_right = true
		close_to_king_castle_right1 = true
		close_to_king_castle_right2 = true


func _on_right_back_right_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_bl = true


func _on_down_back_right_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_br = true
		close_to_king_back = true


func _on_down_back_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_bl = true
		close_to_king_back = true


func _on_left_back_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_bl = true


func _on_up_back_left_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_bl = true
		close_to_king_left = true
		close_to_king_castle_left1 = true
		close_to_king_castle_left2 = true

#endregion

#region absolute

func _on_absolute_left_up_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_castle_left1 = true
		close_to_king_castle_left2 = true


func _on_absolute_right_up_body_entered(body: Node2D) -> void:
	if(body.name == "BlackKing" && self.name != "BlackKing" || body.name == "WhiteKing" && self.name != "WhiteKing"):
		close_to_king_castle_right1 = true
		close_to_king_castle_right2 = true

#endregion

#endregion
#region diagonal movement

#region forward left

func _on_fl_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		fl_tile = area.name
		fl_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		enemy_fl = true


func _on_fl_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		enemy_fl = false


func _on_fl_area_body_entered(body: Node2D) -> void:
	fl_tile = body.tile
	fl_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_fl = true
			fl_touching_border = true
		else:
			enemy_fl = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_fl = true
			fl_touching_border = true
		else:
			enemy_fl = true
			fl_touching_border = false


func _on_fl_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_fl = false


func _on_fl_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region forward right


func _on_fr_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		fr_tile = area.name
		fr_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		enemy_fr = true


func _on_fr_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		enemy_fr = false


func _on_fr_area_body_entered(body: Node2D) -> void:
	fr_tile = body.tile
	fr_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_fr = true
			fr_touching_border = true
		else:
			enemy_fr = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_fr = true
			fr_touching_border = true
		else:
			enemy_fr = true
			fr_touching_border = false


func _on_fr_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_fr = false


func _on_fr_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region down left


func _on_dl_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		bl_tile = area.name
		bl_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		enemy_bl = true


func _on_dl_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		enemy_bl = false


func _on_dl_area_body_entered(body: Node2D) -> void:
	bl_tile = body.tile
	bl_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_bl = true
			bl_touching_border = true
		else:
			enemy_bl = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_bl = true
			bl_touching_border = true
		else:
			enemy_bl = true
			bl_touching_border = false


func _on_dl_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_bl = false


func _on_dl_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn
#endregion
#region down right


func _on_dr_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		br_tile = area.name
		br_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		br_touching_border = true
		enemy_br = true


func _on_dr_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		enemy_br = false


func _on_dr_area_body_entered(body: Node2D) -> void:
	br_tile = body.tile
	br_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			enemy_br = true
			br_touching_border = true
		else:
			enemy_br = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			enemy_br = true
			br_touching_border = true
		else:
			enemy_br = true
			br_touching_border = false


func _on_dr_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		enemy_br = false


func _on_dr_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#endregion
