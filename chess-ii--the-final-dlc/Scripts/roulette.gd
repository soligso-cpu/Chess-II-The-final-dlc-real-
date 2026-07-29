extends CanvasLayer

var hover_indicator = Vector2(0.5,0.5)
enum winning_colour {
	BLACK,
	RED
}
var winner
var hover = false
var currently_gambling = false 
var red_showing = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and currently_gambling == false:
		print("START GAMBLIN")
		currently_gambling = true
		$SpinTimer.start()
	if currently_gambling == true:
		$SwitchTimer.start()

func _on_area_2d_mouse_entered() -> void:
	$Button.scale += hover_indicator
	hover = true 
func _on_area_2d_mouse_exited() -> void:
	$Button.scale -= hover_indicator
	hover = false


func _on_spin_timer_timeout() -> void:
	currently_gambling = false


func _on_switch_timer_timeout() -> void:
	if red_showing == true:
		print("black")
		$Black.visible = true
		$Red.visible = false
		red_showing = false
	if red_showing == false:
		print("red")
		$Black.visible = false
		$Red.visible = true
		red_showing = true
