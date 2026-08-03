extends CharacterBody2D


var forward1_tile
var forward1_tile_group
var forward2_tile
var forward2_tile_group

var right1_tile
var right1_tile_group

var left1_tile
var left1_tile_group

var forward_enemy1
var forward_enemy2
var right_enemy
var left_enemy

var forward1_enemy
var forward2_enemy

var forward_touching_border
var right_touching_border
var left_touching_border

var tile
var tile_group

var focused
var taking

var moved


func _ready() -> void:
	moved = false
	focused = false
	if(self.is_in_group("Black")):
		tile_group = "B"
	else:
		tile_group = "G"
	if(self.global_position == Vector2(338, 523)):
		tile = "G1"
	if(self.global_position == Vector2(418, 523)):
		tile = "G2"
	if(self.global_position == Vector2(498, 523)):
		tile = "G3"
	if(self.global_position == Vector2(578, 523)):
		tile = "G4"
	if(self.global_position == Vector2(685, 523)):
		tile = "G5"
	if(self.global_position == Vector2(738, 523)):
		tile = "G6"
	if(self.global_position == Vector2(818, 523)):
		tile = "G7"
	if(self.global_position == Vector2(898, 523)):
		tile = "G8"
	


func _process(delta: float) -> void:
	if(Globals.piece_focused == self.name):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectPawn.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_INHERIT
			z_index = 5
			move_to_front()
			taking = true
			#region Forward
			
			$MovementMarkers.visible = true
			$MovementMarkers/Forward.visible = true
			if(!moved):
				$MovementMarkers/Forward2.visible = true
			else:
				$MovementMarkers/Forward2.visible = false
			
			if(forward2_enemy):
				$MovementMarkers/Forward2.visible = false

			if(forward1_enemy):
				$MovementMarkers/Forward.visible = false
				$MovementMarkers/Forward2.visible = false
			
			#endregion
			#region Left
			
			$MovementMarkers/Left.visible = false
			
			if(left_enemy):
				if(left_touching_border):
					$MovementMarkers/Left.visible = false
				else:
					$MovementMarkers/Left.visible = true
			
			#endregion
			#region Right
			$MovementMarkers/Right.visible = false
			
			if(right_enemy):
				if(right_touching_border):
					$MovementMarkers/Right.visible = false
				else:
					$MovementMarkers/Right.visible = true
			
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
		$SelectPawn.mouse_filter = Control.MOUSE_FILTER_IGNORE

func reset_markers():
	forward1_enemy = false
	forward2_enemy = false
	right_enemy = false
	left_enemy = false
	
	focused = false
	Globals.piece_focused = ""


func _on_select_pawn_button_up() -> void:
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


func _on_tile_collision_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		tile = area.name
		tile_group = str(area.name)[0]


func _on_tile_collision_area_body_entered(body: Node2D) -> void:
	if(self.name != body.name):
		if(taking):
			body.queue_free()
			taking = false
		else:
			queue_free()


#region Forward

#region Forward 1
func _on_forward_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		forward_enemy1 = true
	if(area.is_in_group("Tiles")):
		forward1_tile = area.name
		forward1_tile_group = str(area.name)[0]

func _on_forward_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		forward1_enemy = false


func _on_forward_area_body_entered(body: Node2D) -> void:
	forward1_tile = body.tile
	forward1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			forward1_enemy = true
			forward_touching_border = true
		else:
			forward1_enemy = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			forward1_enemy = true
			forward_touching_border = true
		else:
			forward1_enemy = true
			forward_touching_border = false

func _on_forward_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		forward1_enemy = false


func _on_forward_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward1_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	var target_with_offset = Globals.position_target + Vector2(2, 0)
	global_position = target_with_offset # change the position to the target.
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
#region Forward 2

func _on_forward_2_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		forward_enemy2 = true
	if(area.is_in_group("Tiles")):
		forward2_tile = area.name
		forward2_tile_group = str(area.name)[0]


func _on_forward_2_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = false
		forward1_enemy = false


func _on_forward_2_area_body_entered(body: Node2D) -> void:
	forward2_tile = body.tile
	forward2_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			forward2_enemy = true
			forward_touching_border = true
		else:
			forward2_enemy = true
			forward_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			forward2_enemy = true
			forward_touching_border = true
		else:
			forward2_enemy = true
			forward_touching_border = false


func _on_forward_2_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		forward2_enemy = false


func _on_forward_2_button_button_up() -> void:
	moved = true
	focused = false
	Globals.moved = true
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = forward2_tile # tells the global script that youre accessing tile X
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

#region Left


func _on_left_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Tiles")):
		left1_tile = area.name
		left1_tile_group = str(area.name)[0]
	if(area.is_in_group("Edge")):
		left_touching_border = true
		left_enemy = true


func _on_left_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		left_touching_border = false
		left_enemy = false



func _on_left_area_body_entered(body: Node2D) -> void:
	left1_tile = body.tile
	left1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			left_enemy = true
			left_touching_border = true
		else:
			left_enemy = true
			left_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			left_enemy = true
			left_touching_border = true
		else:
			left_enemy = true
			left_touching_border = false


func _on_left_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		left_enemy = false


func _on_left_button_button_up() -> void:
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

#region Back



func _on_right_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right_touching_border = true
		right_enemy = true
	if(area.is_in_group("Tiles")):
		right1_tile = area.name
		right1_tile_group = str(area.name)[0]


func _on_right_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		right_touching_border = false
		right_enemy = false


func _on_right_area_body_entered(body: Node2D) -> void:
	right1_tile = body.tile
	right1_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			right_enemy = true
			right_touching_border = true
		else:
			right_enemy = true
			right_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			right_enemy = true
			right_touching_border = true
		else:
			right_enemy = true
			right_touching_border = false


func _on_right_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		right_enemy = false


func _on_right_button_button_up() -> void:
	moved = true
	focused = false
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
