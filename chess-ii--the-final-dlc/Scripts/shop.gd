extends Node2D
enum game_key {
	ROULETTE_KEY,
	FISH_KEY,
	SLOT_KEY,
	CARD_KEY
}
enum card {
	CARD_SUN,
	CARD_MOON,
	CARD_STAR
}
var card_shown
var key
var new_key = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game_key()
	new_card()
func _process(delta: float) -> void:
	while new_key == false:
		if Globals.turn_tracking == 1 and Globals.white_money >= 10:
			Globals.white_money -= 10
			if key == game_key.ROULETTE_KEY and Globals.roulette_unlocked == false:
				Globals.roulette_unlocked = true
				new_key = true
			elif key == game_key.FISH_KEY and Globals.fish_unlocked == false:
				Globals.fish_unlocked = true
				new_key = true
			elif key == game_key.SLOT_KEY and Globals.slot_unlocked == false:
				Globals.slot_unlocked = true
				new_key = true
			elif key == game_key.CARD_KEY and Globals.cards_unlocked == false:
				Globals.cards_unlocked = true
				new_key = true
			elif Globals.cards_unlocked == true and Globals.slot_unlocked == true and Globals.fish_unlocked == true and Globals.roulette_unlocked == true:
				new_key = true
				Globals.white_money += 10
		elif  Globals.white_money <= 10 and Globals.turn_tracking == 1:
			new_key = true
			print("broke ass")
				
		
			
		elif Globals.turn_tracking == 0 and Globals.black_money >= 10:
			Globals.black_money -= 10
			if key == game_key.ROULETTE_KEY and Globals.roulette_unlocked == false:
				Globals.roulette_unlocked = true
				new_key = true
			elif key == game_key.FISH_KEY and Globals.fish_unlocked == false:
				Globals.fish_unlocked = true
				new_key = true
			elif key == game_key.SLOT_KEY and Globals.slot_unlocked == false:
				Globals.slot_unlocked = true
				new_key = true
			elif key == game_key.CARD_KEY and Globals.cards_unlocked == false:
				Globals.cards_unlocked = true
				new_key = true
			elif Globals.cards_unlocked == true and Globals.slot_unlocked == true and Globals.fish_unlocked == true and Globals.roulette_unlocked == true:
				new_key = true
				Globals.black_money += 10
		elif  Globals.black_money <= 10 and Globals.turn_tracking == 0:
			new_key = true
			print("broke ass")
			
		
			
		print(key)
		

func _on_game_key_button_button_up() -> void:
	new_key = false
	
#Globals.white_money >= 2
#Globals.black_money >= 2
func new_game_key():
	
		key = randi_range(game_key.ROULETTE_KEY, game_key.CARD_KEY)
		if key == game_key.ROULETTE_KEY and Globals.roulette_unlocked == false:
			$GameKey/GameKeyLabel.text = str("roulette")
			new_key = true
		elif key == game_key.FISH_KEY and Globals.fish_unlocked == false:
			$GameKey/GameKeyLabel.text = str("fishing minigame")
			new_key = true
		elif key == game_key.SLOT_KEY and Globals.slot_unlocked == false:
			$GameKey/GameKeyLabel.text = str("slots")
			new_key = true
		elif key == game_key.CARD_KEY and Globals.cards_unlocked == false:
			$GameKey/GameKeyLabel.text = str("cards")
			new_key = true
		elif Globals.cards_unlocked == true and Globals.slot_unlocked == true and Globals.fish_unlocked == true and Globals.roulette_unlocked == true:
			print("agy")
			$GameKey/GameKeyLabel.text = str("Sold out")
		else:
			new_game_key()
		print(key)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func new_card():
	card_shown = randi_range(card.CARD_SUN, card.CARD_STAR)
	if card_shown == card.CARD_SUN:
		print("gud")
		$MajorPowerup/MajorText.text = str("The Sun")
		$MajorPowerup/MajorPopup.text = str("Boosts your odds
		in roulette
		cost: 2")
	elif card_shown == card.CARD_MOON:
		print("also good")
		$MajorPowerup/MajorText.text = str("The Moon")
		$MajorPowerup/MajorPopup.text = str("Lowers your opponents 
		odds in roulette
		cost: 2")
	elif card_shown == card.CARD_STAR:
		print("WOW, GAMBLE")
		$MajorPowerup/MajorText.text = str("The Star")
		$MajorPowerup/MajorPopup.text = str("Guarantees a jackpot 
		on your next gamble
		cost: 20")

func _on_major_button_button_up() -> void:
	if card_shown == card.CARD_SUN:
		print("luck be upon you")
		if Globals.turn_tracking == 1 and Globals.white_money >= 2:
			Globals.white_odds -= 10
			Globals.white_money -= 2
			
		elif Globals.turn_tracking == 0 and Globals.black_money >= 2:
			Globals.black_odds -= 10
			Globals.black_money -= 2
	elif  card_shown == card.CARD_MOON:
		print("no luck for u")
		if Globals.turn_tracking == 1 and Globals.white_money >= 2:
			Globals.black_odds += 10
			Globals.white_money -= 2
		elif Globals.turn_tracking == 0 and Globals.black_money >= 2:
			Globals.black_money -= 2
			Globals.white_odds += 10
	elif  card_shown == card.CARD_STAR:
		print("Bending the rules i see")
		if Globals.turn_tracking == 1 and Globals.white_money >= 20:
			Globals.gamble_win_white = true
			Globals.white_money -= 20
		elif Globals.turn_tracking == 0 and Globals.black_money >= 20:
			Globals.black_money -= 20
			Globals.gamble_win_black = true
	new_card()

func _on_game_key_button_focus_entered() -> void:
	print("print")


func _on_game_key_button_mouse_entered() -> void:
	print("print")
	$GameKey/GameKeyPopUp.visible = true


func _on_game_key_button_mouse_exited() -> void:
	$GameKey/GameKeyPopUp.visible = false


func _on_major_button_mouse_entered() -> void:
	$MajorPowerup/MajorPopup.visible = true


func _on_major_button_mouse_exited() -> void:
	$MajorPowerup/MajorPopup.visible = false
