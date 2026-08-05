extends CharacterBody2D

var forward_touching_border
var touching_border
var left_touching_border

var moved
var focused
var taking

var tile
var tile_group

var close_to_king_left
var close_to_king_right
var close_to_king_forward
var close_to_king_back

var enemy_left1
var enemy_left2
var enemy_right1
var enemy_right2
var enemy_forward
var enemy_back

var forward_tile
var forward_tile_group
var left1_tile
var left1_tile_group
var left2_tile
var left2_tile_group
var right1_tile
var right1_tile_group
var right2_tile
var right2_tile_group
var back_tile
var back_tile_group

func _ready() -> void:
	focused = false


func _process(delta: float) -> void:
	pass

func reset_markers():
	enemy_back = false
	enemy_forward = false
	enemy_left1 = false
	enemy_left2 = false
	enemy_right1 = false
	enemy_right2 = false
	
	focused = false
	Globals.piece_focused = ""


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
	if(area.is_in_group("Tiles")):
		left2_tile = area.name
		left2_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		left_touching_border = true
		enemy_left2 = true


func _on_left_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		enemy_left2 = false


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
	if(body.is_in_group("Pieces")):
		enemy_left2 = false


func _on_left_2_button_button_up() -> void:
	if(self.name == "BlackKing"):
		$RookBlackA1.global_positon = Vector2(576, 43)
		global_position = Vector2(496, 43)
	if(self.name == "WhiteKing"):
		$RookH1.global_position = Vector2(576, 603)
		global_position = Vector2(496, 603)


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
	if(area.is_in_group("Tiles")):
		right2_tile = area.name
		right2_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		touching_border = true
		enemy_right2 = true


func _on_right_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		touching_border = false
		enemy_right2 = false


func _on_right_2_area_body_entered(body: Node2D) -> void:
	right2_tile = body.tile
	right2_tile_group = body.tile_group
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
	if(self.name == "BlackKing"):
		$RookBlackA8.global_positon = Vector2(736, 43)
		global_position = Vector2(816, 43)
	if(self.name == "WhiteKing"):
		$RookH8.global_position = Vector2(736, 603)
		global_position = Vector2(816, 603)

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
