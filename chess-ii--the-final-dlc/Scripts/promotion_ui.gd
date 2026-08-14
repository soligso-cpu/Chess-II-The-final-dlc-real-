extends Node2D

const BLACK_QUEEN = preload("res://Scenes/queen_black.tscn")
const WHITE_QUEEN = preload("res://Scenes/queen_white.tscn")

const BLACK_ROOK = preload("res://Scenes/rook_black.tscn")
const WHITE_ROOK = preload("res://Scenes/rook.tscn")

const BLACK_BISHOP = preload("res://Scenes/bishop_black.tscn")
const WHITE_BISHOP = preload("res://Scenes/bishop.tscn")

const BLACK_KNIGHT = preload("res://Scenes/knight_black.tscn")
const WHITE_KNIGHT = preload("res://Scenes/knight.tscn")


var black_turn
var white_turn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Globals.turn_tracking == 1):
		white_turn = true
		black_turn = false
		$WhiteSprites.visible = true
		$BlackSprites.visible = false
	else:
		black_turn = true
		white_turn = false
		$WhiteSprites.visible = false
		$BlackSprites.visible = true


func _on_queen_button_button_up() -> void:
	if(white_turn):
		var white_queen_instance = WHITE_QUEEN.instantiate()
		$"../".add_child(white_queen_instance)
		white_queen_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()
	if(black_turn):
		var black_queen_instance = BLACK_QUEEN.instantiate()
		$"../".add_child(black_queen_instance)
		black_queen_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()


func _on_rook_button_button_up() -> void:
	if(white_turn):
		var white_rook_instance = WHITE_ROOK.instantiate()
		$"../".add_child(white_rook_instance)
		white_rook_instance.global_position = Globals.promotion_instance_position
		white_rook_instance.moved = true
		Globals.turn_tracking += 1
		self.queue_free()
	if(black_turn):
		var black_rook_instance = BLACK_ROOK.instantiate()
		$"../".add_child(black_rook_instance)
		black_rook_instance.global_position = Globals.promotion_instance_position
		black_rook_instance.moved = true
		Globals.turn_tracking += 1
		self.queue_free()


func _on_bishop_button_button_up() -> void:
	if(white_turn):
		var white_bishop_instance = WHITE_BISHOP.instantiate()
		$"../".add_child(white_bishop_instance)
		white_bishop_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()
	if(black_turn):
		var black_bishop_instance = BLACK_BISHOP.instantiate()
		$"../".add_child(black_bishop_instance)
		black_bishop_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()


func _on_knight_button_button_up() -> void:
	if(white_turn):
		var white_knight_instance = WHITE_KNIGHT.instantiate()
		$"../".add_child(white_knight_instance)
		white_knight_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()
	if(black_turn):
		var black_knight_instance = BLACK_KNIGHT.instantiate()
		$"../".add_child(black_knight_instance)
		black_knight_instance.global_position = Globals.promotion_instance_position
		Globals.turn_tracking += 1
		self.queue_free()
