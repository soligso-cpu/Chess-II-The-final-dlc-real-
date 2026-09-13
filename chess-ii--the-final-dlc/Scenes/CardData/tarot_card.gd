extends Sprite2D

#allows me to change what card it is with out making new scenes
@export_range(1,22) var value : int = 1
@export var tarotcardtexture : Texture


var hold = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sets the texture to tarot card texture
	texture = tarotcardtexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hold:
		global_position = get_global_mouse_position()


func _on_area_2d_tarot_card_action(left: bool) -> void:
	if left:
		print(value)
		hold = true
	if not left:
		print("right")
	pass # Replace with function body.


func _on_area_2d_tarot_card_release(left: bool) -> void:
	if left:
		hold = false
	pass # Replace with function body.
