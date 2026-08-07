extends Area2D
var hover = false
var on_roulette = false
var timer_on
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.jumpscared == false and Globals.lore_won == true:
		$"../../LoreOrganizer/AnimationPlayer".play("Jumpscare_real")
		$"../../LoreOrganizer/JumpscareSprite".visible = true

	if Input.is_action_just_pressed("Click") and hover == true and on_roulette == false:
		$"../Roulette".visible = true
		$"../../TileMapLayer".visible = false
		$"../../TileAreas".visible = false
		$"../../White".visible = false
		$"../../Black".visible = false
		on_roulette = true
	elif Input.is_action_just_pressed("Click") and hover == true and on_roulette == true:
		$"../Roulette".visible = false
		$"../../TileMapLayer".visible = true
		$"../../TileAreas".visible = true
		$"../../White".visible = true
		$"../../Black".visible = true
		on_roulette = false
func _on_mouse_entered() -> void:
	hover = true
	

func _on_mouse_exited() -> void:
	hover = false

	



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$"../../LoreOrganizer/JumpscareSprite".visible = false
	Globals.jumpscared = true
