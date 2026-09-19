extends CharacterBody2D
var move_speed  = 10
var speed_boost = 5
var direction = Vector2()
var flip = false
var victory_window = false
var won_games = 0
var tutorial_stage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Victory organizer/CommonFish".visible = false
	$"../Victory organizer/RareFish".visible = false
	$"../Victory organizer/EpicFish".visible = false
	$".".global_position = $"../Marker2D2".global_position
	
#Very reudmentary fishing minigame :]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.turn_tracking == 0 and Globals.white_money < 0:
		print("White, you are in debt")
	elif Globals.turn_tracking == 1 and Globals.black_money < 0:
		print("Black, you are in debt")
	if won_games == 3:
		print("This is when the score would increase")
		won_games = 0
		Globals._game_won()
		var prize = randi_range(1,100)
		if prize <= 10:
			print("Win a large prize")
			$"../Victory organizer/AnimationPlayer".play("Epic_win")
			if Globals.turn_tracking == 0:
				Globals.white_money += 15
			elif Globals.turn_tracking == 1:
				Globals.black_money += 15
		elif prize <= 30 and prize > 10:
			print("win a mid prize")
			$"../Victory organizer/AnimationPlayer".play("Rare_win")
			if Globals.turn_tracking == 0:
				Globals.white_money += 3
			elif Globals.turn_tracking == 1:
				Globals.black_money += 3

		else:
			print("win a crap prize")
			$"../Victory organizer/AnimationPlayer".play("Common_win")
			if Globals.turn_tracking == 0:
				Globals.white_money += 1
			elif Globals.turn_tracking == 1:
				Globals.black_money += 1
		
		speed_boost = 5
	
	if flip == false:
		direction = global_position.direction_to($"../Marker2D".global_position)

	elif flip == true:
		direction = global_position.direction_to($"../Marker2D2".global_position)

	
	if Input.is_action_just_pressed("Click") and victory_window == true:
		print("fih")
		move_speed = 0
		$"../RoundTimer".start()
		won_games += 1
	elif Input.is_action_just_pressed("Click") and victory_window == false:
		print("aw dangit")
		move_speed = 0
		$"../RoundTimer".start()
		speed_boost = 5
		won_games = 0
		if Globals.turn_tracking == 0:
			Globals.white_money -= 1
		elif Globals.turn_tracking == 1:
			Globals.black_money -= 1
	move_and_collide(direction * move_speed)
func _on_area_2d_body_entered(body: Node2D) -> void:
	flip = true


func _on_area_2d2_body_entered(body: Node2D) -> void:
	flip = false


func _on_fish_area_body_entered(body: Node2D) -> void:
	victory_window = true


func _on_fish_area_body_exited(body: Node2D) -> void:
	victory_window = false 


func _on_round_timer_timeout() -> void:
	speed_boost = randi_range(-20, 80)
	move_speed = 10 + speed_boost
	if move_speed <= 0:
		move_speed = 1


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == str("Common_win"):
		$"../Victory organizer/CommonFish".visible = false
	elif anim_name == str("Rare_win"):
		$"../Victory organizer/RareFish".visible = false
	elif anim_name == str("Epic_win"):
		$"../Victory organizer/EpicFish".visible = false
	else:
		print("hoh", anim_name)
