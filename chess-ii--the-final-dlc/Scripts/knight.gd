extends CharacterBody2D

#region Tiles, Group, Border, Enemy Variables

var fl_tile
var fl_tile_group
var fl_touching_border
var fl_enemy

var fr_tile
var fr_tile_group
var fr_touching_border
var fr_enemy

var ru_tile
var ru_tile_group
var ru_touching_border
var ru_enemy

var rd_tile
var rd_tile_group
var rd_touching_border
var rd_enemy

var br_tile
var br_tile_group
var br_touching_border
var br_enemy

var bl_tile
var bl_tile_group
var bl_touching_border
var bl_enemy

var ld_tile
var ld_tile_group
var ld_touching_border
var ld_enemy

var lu_tile
var lu_tile_group
var lu_touching_border
var lu_enemy

#endregion


var focused
var taking

var tile
var tile_group

func _ready() -> void:
	focused = false

func _process(delta: float) -> void:
	if(Globals.piece_focused == self.name):
		focused = true
	else:
		focused = false
	$MovementMarkers.global_position = global_position
	if(self.is_in_group("Black") && Globals.turn_tracking == 0 || self.is_in_group("White") && Globals.turn_tracking == 1):
		$SelectKnight.mouse_filter = Control.MOUSE_FILTER_STOP
		if(focused):
			for child in $MovementMarkers.get_children():
				child.process_mode = Node.PROCESS_MODE_INHERIT
			z_index = 5
			move_to_front()
			taking = true
			#region Marker Visibility
			
			$MovementMarkers.visible = true
			$MovementMarkers/ForwardLeft.visible = true
			$MovementMarkers/ForwardRight.visible = true
			$MovementMarkers/RightUp.visible = true
			$MovementMarkers/RightDown.visible = true
			$MovementMarkers/BackRight.visible = true
			$MovementMarkers/BackLeft.visible = true
			$MovementMarkers/LeftDown.visible = true
			$MovementMarkers/LeftUp.visible = true
			
			if(fl_enemy):
				if(fl_touching_border):
					$MovementMarkers/ForwardLeft.visible = false
			
			if(fr_enemy):
				if(fl_touching_border):
					$MovementMarkers/ForwardRight.visible = false
			
			if(ru_enemy):
				if(ru_touching_border):
					$MovementMarkers/RightUp.visible = false
			
			if(rd_enemy):
				if(rd_touching_border):
					$MovementMarkers/RightDown.visible = false
			
			if(br_enemy):
				if(br_touching_border):
					$MovementMarkers/BackRight.visible = false
			
			if(bl_enemy):
				if(br_touching_border):
					$MovementMarkers/BackLeft.visible = false
			
			if(ld_enemy):
				if(ld_touching_border):
					$MovementMarkers/LeftDown.visible = false
			
			if(lu_enemy):
				if(lu_touching_border):
					$MovementMarkers/LeftUp.visible = false
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
		$SelectKnight.mouse_filter = Control.MOUSE_FILTER_IGNORE

func reset_markers():
	fl_enemy = false
	fr_enemy = false
	ru_enemy = false
	rd_enemy = false
	br_enemy = false
	bl_enemy = false
	ld_enemy = false
	lu_enemy = false
	focused = false
	Globals.piece_focused = ""

func _on_select_knight_button_up() -> void:
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

#region Forward Left

func _on_fl_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = true
		fl_enemy = true
	if(area.is_in_group("Tiles")):
		fl_tile = area.name
		fl_tile_group = str(area.name)[0]


func _on_fl_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fl_touching_border = false
		fl_enemy = false


func _on_fl_area_body_entered(body: Node2D) -> void:
	fl_tile = body.tile
	fl_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			fl_enemy = true
			fl_touching_border = true
		else:
			fl_enemy = true
			fl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			fl_enemy = true
			fl_touching_border = true
		else:
			fl_enemy = true
			fl_touching_border = false


func _on_fl_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		fl_enemy = false


func _on_fl_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fl_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn


#endregion

#region Forward Right


func _on_fr_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = true
		fr_enemy = true
	if(area.is_in_group("Tiles")):
		fr_tile = area.name
		fr_tile_group = str(area.name)[0]


func _on_fr_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		fr_touching_border = false
		fr_enemy = false


func _on_fr_area_body_entered(body: Node2D) -> void:
	fr_tile = body.tile
	fr_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			fr_enemy = true
			fr_touching_border = true
		else:
			fr_enemy = true
			fr_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			fr_enemy = true
			fr_touching_border = true
		else:
			fr_enemy = true
			fr_touching_border = false


func _on_fr_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		fr_enemy = false


func _on_fr_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = fr_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Right Up


func _on_ru_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		ru_touching_border = true
		ru_enemy = true
	if(area.is_in_group("Tiles")):
		ru_tile = area.name
		ru_tile_group = str(area.name)[0]


func _on_ru_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		ru_touching_border = false
		ru_enemy = false


func _on_ru_area_body_entered(body: Node2D) -> void:
	ru_tile = body.tile
	ru_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			ru_enemy = true
			ru_touching_border = true
		else:
			ru_enemy = true
			ru_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			ru_enemy = true
			ru_touching_border = true
		else:
			ru_enemy = true
			ru_touching_border = false


func _on_ru_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		ru_enemy = false


func _on_ru_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = ru_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Right Down



func _on_rd_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		rd_touching_border = true
		rd_enemy = true
	if(area.is_in_group("Tiles")):
		rd_tile = area.name
		rd_tile_group = str(area.name)[0]


func _on_rd_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		rd_touching_border = false
		rd_enemy = false


func _on_rd_area_body_entered(body: Node2D) -> void:
	rd_tile = body.tile
	rd_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			rd_enemy = true
			rd_touching_border = true
		else:
			rd_enemy = true
			rd_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			rd_enemy = true
			rd_touching_border = true
		else:
			rd_enemy = true
			rd_touching_border = false


func _on_rd_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		rd_enemy = false


func _on_rd_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = rd_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Back Right



func _on_br_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = true
		br_enemy = true
	if(area.is_in_group("Tiles")):
		br_tile = area.name
		br_tile_group = str(area.name)[0]


func _on_br_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		br_touching_border = false
		br_enemy = false


func _on_br_area_body_entered(body: Node2D) -> void:
	br_tile = body.tile
	br_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			br_enemy = true
			br_touching_border = true
		else:
			br_enemy = true
			br_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			br_enemy = true
			br_touching_border = true
		else:
			br_enemy = true
			br_touching_border = false


func _on_br_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		br_enemy = false


func _on_br_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = br_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Back Left



func _on_bl_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = true
		bl_enemy = true
	if(area.is_in_group("Tiles")):
		bl_tile = area.name
		bl_tile_group = str(area.name)[0]


func _on_bl_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		bl_touching_border = false
		bl_enemy = false


func _on_bl_area_body_entered(body: Node2D) -> void:
	bl_tile = body.tile
	bl_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			bl_enemy = true
			bl_touching_border = true
		else:
			bl_enemy = true
			bl_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			bl_enemy = true
			bl_touching_border = true
		else:
			bl_enemy = true
			bl_touching_border = false


func _on_bl_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		bl_enemy = false


func _on_bl_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = bl_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Left Down



func _on_ld_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		ld_touching_border = true
		ld_enemy = true
	if(area.is_in_group("Tiles")):
		ld_tile = area.name
		ld_tile_group = str(area.name)[0]


func _on_ld_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		ld_touching_border = false
		ld_enemy = false


func _on_ld_area_body_entered(body: Node2D) -> void:
	ld_tile = body.tile
	ld_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			ld_enemy = true
			ld_touching_border = true
		else:
			ld_enemy = true
			ld_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			ld_enemy = true
			ld_touching_border = true
		else:
			ld_enemy = true
			ld_touching_border = false


func _on_ld_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		ld_enemy = false

func _on_ld_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = ld_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion

#region Left Up


func _on_lu_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		lu_touching_border = true
		lu_enemy = true
	if(area.is_in_group("Tiles")):
		lu_tile = area.name
		lu_tile_group = str(area.name)[0]


func _on_lu_area_area_exited(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		lu_touching_border = false
		lu_enemy = false


func _on_lu_area_body_entered(body: Node2D) -> void:
	lu_tile = body.tile
	lu_tile_group = body.tile_group
	if(body.is_in_group("White")):
		if(self.is_in_group("White")):
			lu_enemy = true
			lu_touching_border = true
		else:
			lu_enemy = true
			lu_touching_border = false
	elif(body.is_in_group("Black")):
		if(self.is_in_group("Black")):
			lu_enemy = true
			lu_touching_border = true
		else:
			lu_enemy = true
			lu_touching_border = false


func _on_lu_area_body_exited(body: Node2D) -> void:
	if(body.is_in_group("Pieces")):
		lu_enemy = false


func _on_lu_button_button_up() -> void:
	focused = false
	if(tile != null && tile_group != null): # the piece rids itself of its original tiles state
		Globals.board_tiles[tile_group][tile].state = false
	Globals.accessing = lu_tile # tells the global script that youre accessing tile X
	await get_tree().process_frame # process frame to let process in globals work
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	global_position = Globals.position_target
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	reset_markers()
	await get_tree().process_frame # do so again, MAKE SURE THIS IS HERE.
	Globals.turn_tracking += 1 # change turn

#endregion
