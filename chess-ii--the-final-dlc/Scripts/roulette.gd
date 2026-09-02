extends CanvasLayer

var hover_indicator = Vector2(0.5,0.5)
enum winning_colour {
	BLACK = 1, 
	RED = 2
}
var white_odds = 100
var black_odds = 0
var winner 
var hover = false
var currently_gambling = false 
var colour_showing = 2
var timer_length = 0.1
var timer_slow = 1.1
var chosen_colour
var spin_speed = 0.7
var spin_change = 0.989
var loosing_colour


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and currently_gambling == false and chosen_colour and hover == true:
		print("START GAMBLIN")
		currently_gambling = true
		$SpinTimer.start()
		timer_length = 0.1
		$SwitchTimer.start(timer_length)
		spin_speed = 0.7
		if Globals.turn_tracking == 1:
			Globals.white_money -= 2
		if Globals.turn_tracking == 0:
			Globals.black_money -= 2
		
	if currently_gambling == true:
		$Button.rotation += spin_speed
		spin_speed  = spin_speed * spin_change
func _on_area_2d_mouse_entered() -> void:
	$Button.scale += hover_indicator
	hover = true 
func _on_area_2d_mouse_exited() -> void:
	$Button.scale -= hover_indicator
	hover = false


func _on_spin_timer_timeout() -> void:
	currently_gambling = false
	print("no more gamba", currently_gambling)
	var roll = randi_range(0,100)
	print(winner, "is winner")
	if Globals.turn_tracking == 1:
		if roll >= Globals.white_odds:
			winner = chosen_colour
		elif roll < Globals.white_odds:
			winner = loosing_colour
		if Globals.gamble_win_white == true:
			winner = chosen_colour
			Globals.gamble_win_white = false
			print("code raqn")
			
	elif Globals.turn_tracking == 0:
		if roll >= Globals.black_odds:
			winner = chosen_colour
		elif roll < Globals.black_odds:
			winner = loosing_colour
		if Globals.gamble_win_black == true:
			winner = chosen_colour
			Globals.gamble_win_black = false
			print("code ran")
	if winner == winning_colour.BLACK:
		$Black.visible = true
		$Red.visible = false
		
	elif winner == winning_colour.RED:
		$Black.visible = false
		$Red.visible = true
		
	if winner == chosen_colour:
		print("WIN")
		$Control/Label.text = str("Congratualtions! You win an extra 
		turn!")
		Globals._game_won()
		if Globals.turn_tracking == 1:
			Globals.white_turns = 3
			print(Globals.white_turns, "id")
			
			Globals.white_money += 4
		
			
		elif Globals.turn_tracking == 0:
			Globals.black_turns = 3
			print(Globals.black_turns, "id")
			Globals.black_money += 4
	elif winner != chosen_colour:
		print("aw dangit")
		$Control/Label.text = str("Oh well, you lost your turn.")
		if Globals.turn_tracking == 1:
			Globals.turn_tracking = 0
			Globals.moved = true
			
		elif Globals.turn_tracking == 0:
			Globals.turn_tracking = 1
			Globals.moved = true
			

func _on_switch_timer_timeout() -> void:
	if currently_gambling == true:
		if colour_showing == 1:
			print("black")
			$Black.visible = true
			$Red.visible = false
			colour_showing = 2
		elif colour_showing == 2:
			print("red")
			$Black.visible = false
			$Red.visible = true
			colour_showing = 1
		
		timer_length = timer_length * timer_slow
		$SwitchTimer.start(timer_length)
		print(currently_gambling)


func _on_red_button_button_up() -> void:
	if currently_gambling == false:
		chosen_colour = winning_colour.RED
		loosing_colour = winning_colour.BLACK
		print("all in on red", str(chosen_colour))
		$Control/Label.text = str("Bet 1 turn on red")
func _on_black_button_button_up() -> void:
	if currently_gambling == false:
		chosen_colour = winning_colour.BLACK
		loosing_colour = winning_colour.RED
		print("all in on black", str(chosen_colour))
		$Control/Label.text = str("Bet 1 turn on black")


func _on_quit_button_button_up() -> void:
	if currently_gambling == false:
		chosen_colour = 0
		print("lame")
		print(hover, "is hover")
		$Control/Label.text = str("You have opted not to gamble.")


func _on_return_button_button_up() -> void:
	
	$"../Camera2D".global_position = $"../BoardMarker".global_position

func _on_move_button_button_up() -> void:
	$"../Camera2D".global_position = $"../RouletteMarker".global_position
	
	
	
	
	
	
	
	
	
