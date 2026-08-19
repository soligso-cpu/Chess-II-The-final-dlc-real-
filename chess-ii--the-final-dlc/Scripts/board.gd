extends Node2D
var hover = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and hover == true and Globals.lore_won == true:
		
		if $LoreOrganizer/DirectionalLight2D.visible == true and$LoreOrganizer/CanvasLayer/Label.visible == true:
			$LoreOrganizer/CanvasLayer/Label.visible = false
			$LoreOrganizer/DirectionalLight2D.visible = false
		else:
			$LoreOrganizer/CanvasLayer/Label.visible = true
			$LoreOrganizer/DirectionalLight2D.visible = true
		


func _on_button_button_up() -> void:
	Globals.black_turns += 1


	
#jumpscare()

	


func _on_area_2d_mouse_entered() -> void:
	hover = true
	print(hover) # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	hover = false
	print(hover)


func _on_r_train_button_button_up() -> void:
	if(Globals.rook_a_train):
		Globals.rook_a_train = false
	else:
		Globals.rook_a_train = true
