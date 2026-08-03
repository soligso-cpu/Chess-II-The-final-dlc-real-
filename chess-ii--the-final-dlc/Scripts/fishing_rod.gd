extends CharacterBody2D
var move_speed  = 10
var speed_boost = 5
var direction = Vector2()
var flip = false
var victory_window = false
var won_games = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".global_position = $"../Marker2D2".global_position
	
#Very reudmentary fishing minigame :]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if won_games == 3:
		print("This is when the score would increase")
		won_games = 0
	
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
	move_speed = 15 + speed_boost
	speed_boost += 5
	
