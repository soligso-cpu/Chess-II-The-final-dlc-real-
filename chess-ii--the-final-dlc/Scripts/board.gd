extends Node2D
var hover = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and hover == true and Globals.lore_won == true:
		$LoreOrganizer/Label.visible = true


func _on_button_button_up() -> void:
	Globals.black_turns += 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	hover = true
	print(hover)

func _on_area_2d_body_exited(body: Node2D) -> void:
	hover = false
	print(hover)
