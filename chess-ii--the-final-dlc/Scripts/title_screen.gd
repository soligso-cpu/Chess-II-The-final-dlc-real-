extends Node2D

var changing_to_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Start.visible = true
	$Tutorial.visible = true
	$Exit.visible = true
	$Title.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_up() -> void:
	changing_to_level = "res://Scenes/board.tscn"
	get_tree().change_scene_to_file(changing_to_level)


func _on_tutorial_button_up() -> void:
	print("tutorial")


func _on_exit_button_up() -> void:
	get_tree().quit()
