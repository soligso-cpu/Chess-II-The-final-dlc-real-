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
var bet = 0
var option = 0
var number_bet = 0
var num_betting = false
var bet_tracking = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click") and currently_gambling == false and chosen_colour and hover == true and bet >= 2:
		print("START GAMBLIN")
		currently_gambling = true
		bet_tracking = bet_tracking + 1
		timer_length = 0.1
		
		spin_speed = 0.7
		if Globals.turn_tracking == 1 and Globals.white_money >= bet :
			Globals.white_money -= bet
			$SpinTimer.start()
			$SwitchTimer.start(timer_length)
		elif Globals.turn_tracking == 1 and Globals.white_money < bet:
			print("nope")
			$SwitchTimer.stop()
			$SpinTimer.stop()
			currently_gambling = false
			
		if Globals.turn_tracking == 0 and Globals.black_money >= bet:
			Globals.black_money -= bet
			$SwitchTimer.start(timer_length)
			$SpinTimer.start()
			
		elif Globals.turn_tracking == 0 and Globals.black_money < bet:
			print("nope")
			$SwitchTimer.stop()
			$SpinTimer.stop()
			currently_gambling = false
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
	if bet_tracking >= 3:
		winner = chosen_colour
	if winner == winning_colour.BLACK:
		$Black.visible = true
		$Red.visible = false
		
	elif winner == winning_colour.RED:
		$Black.visible = false
		$Red.visible = true
	
	if winner == chosen_colour:
		print("WIN")
		bet_tracking = 0
		$Control/Label.text = str("Congratualtions! You win an extra 
		turn!")
		Globals._game_won()
		if Globals.turn_tracking == 1:
			Globals.white_turns = 3
			print(Globals.white_turns, "id")
			
			Globals.white_money += bet * 2
		
			
		elif Globals.turn_tracking == 0:
			Globals.black_turns = 3
			print(Globals.black_turns, "id")
			Globals.black_money += bet * 2
	elif winner != chosen_colour:
		print("aw dangit")
		$Control/Label.text = str("Oh well, you lost your turn.")
		if Globals.turn_tracking == 1:
			Globals.turn_tracking = 0
			Globals.moved = true
			
		elif Globals.turn_tracking == 0:
			Globals.turn_tracking = 1
			Globals.moved = true
	calc_bet()		
		

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
	
	
	
	
	
	
	
	
	


func _on_option_button_item_focused(index: int) -> void:
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	option = index
	calc_bet()
	#if index == 0:
		#bet = 2
	#elif index == 1:
		#if Globals.turn_tracking == 1:
			#bet = Globals.white_money * 0.25
#
		#if Globals.turn_tracking == 0:
			#bet = Globals.black_money * 0.25
			#
	#elif index == 2:
		#if Globals.turn_tracking == 1:
			#bet = Globals.white_money * 0.5
#
		#if Globals.turn_tracking == 0:
			#bet = Globals.black_money * 0.5
	#elif index == 3:
		#if Globals.turn_tracking == 1:
			#bet = Globals.white_money
#
		#if Globals.turn_tracking == 0:
			#bet = Globals.black_money 
	#
	
		
	print(bet, " is bet")
	
func calc_bet():

	if option == 0:
		bet = 2
	elif option == 1:
		if Globals.turn_tracking == 1:
			bet = Globals.white_money * 0.25

		if Globals.turn_tracking == 0:
			bet = Globals.black_money * 0.25
			
	elif option == 2:
		if Globals.turn_tracking == 1:
			bet = Globals.white_money * 0.5

		if Globals.turn_tracking == 0:
			bet = Globals.black_money * 0.5
	elif option == 3:
		if Globals.turn_tracking == 1:
			bet = Globals.white_money

		if Globals.turn_tracking == 0:
			bet = Globals.black_money 
	
	
	
	


func _on_number_button_item_selected(index: int) -> void:
	number_bet = index + 1
	print(number_bet)


func _on_number_bet_button_button_up() -> void:
	bet_tracking = bet_tracking + 1
	if currently_gambling == false and bet >= 2:
		print("START GAMBLIN")
		currently_gambling = true
		
		timer_length = 0.1
		
		spin_speed = 0.7
		if Globals.turn_tracking == 1 and Globals.white_money >= bet :
			Globals.white_money -= bet
			$SpinTimerNum.start()
			$SwitchTimer.start(timer_length)
		elif Globals.turn_tracking == 1 and Globals.white_money < bet:
			print("nope")
			$SwitchTimer.stop()
			$SpinTimerNum.stop()
			currently_gambling = false
			
		if Globals.turn_tracking == 0 and Globals.black_money >= bet:
			Globals.black_money -= bet
			$SwitchTimer.start(timer_length)
			$SpinTimerNum.start()
			
		elif Globals.turn_tracking == 0 and Globals.black_money < bet:
			print("nope")
			$SwitchTimer.stop()
			$SpinTimerNum.stop()
			currently_gambling = false



func _on_spin_timer_num_timeout() -> void:
	currently_gambling = false
	var winning_number = randi_range(1,36)
	if Globals.turn_tracking == 1:
		if Globals.gamble_win_white == true:
			number_bet = winning_number
			Globals.gamble_win_white = false
			print("code raqn")
			
	elif Globals.turn_tracking == 0:
		if Globals.gamble_win_black == true:
			number_bet = winning_number
			Globals.gamble_win_black = false
			print("code ran")
			
	if bet_tracking >= 3:
		number_bet = winning_number
		print("third time's the charm")
			
			
			
	if number_bet == winning_number:
		print("crazy ")
		print("WIN")
		$Control/Label.text = str("Congratualtions! You win an extra 
		turn!")
		Globals._game_won()
		if Globals.turn_tracking == 1:
			Globals.white_turns = 3
			print(Globals.white_turns, "id")
			Globals.white_money += bet * 36
			
			
		elif Globals.turn_tracking == 0:
			Globals.black_turns = 3
			print(Globals.black_turns, "id")
			Globals.black_money += bet * 36
		bet_tracking = 0
			
			
	elif winning_number != number_bet:
		print("aw dangit")
		$Control/Label.text = str("Oh well, you should have expected that.")
		if Globals.turn_tracking == 1:
			Globals.turn_tracking = 0
			Globals.moved = true
			
		elif Globals.turn_tracking == 0:
			Globals.turn_tracking = 1
			Globals.moved = true
		calc_bet()		
	
		print("that tracks, ", winning_number)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
