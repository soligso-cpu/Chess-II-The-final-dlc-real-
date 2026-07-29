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


func _ready() -> void:
	pass


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
			$MovementMarkers/Forward2.visible = true
			
			if(forward2_enemy):
				if(forward_touching_border):
					$MovementMarkers/Forward2.visible = false

			if(forward1_enemy):
				if(forward_touching_border):
					$MovementMarkers/Forward.visible = false
				$MovementMarkers/Forward2.visible = false
			
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


#region Forward

#region Forward 1
func _on_forward_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Edge")):
		forward_touching_border = true
		forward_enemy1 = false
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
	if(body != self):
		if(Globals.board_tiles[forward1_tile_group][forward1_tile].state == true):
			forward1_enemy = true

func _on_forward_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_forward_button_button_up() -> void:
	focused = false
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

#endregion
#endregion


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
