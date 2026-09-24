extends Node2D
var hover = false
var stage = 0

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	MusicController.play_first()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Shop/FailedOpenLabel.position.y -= 0.5
	
	#This checks if rouleete failed to open. Why didn't i just put the fuction in that scripts? 
	#Cuz it kept breaking and i don't have time for good solutions. If it works, it works. 
	if Globals.R_failed == true:
		Globals.R_failed = false
		_failed_open()
	if(Globals.turn_tracking == 1):
		#white
		$".".move_child($White, 7)
		$".".move_child($Black, 6)
	elif(Globals.turn_tracking == 0):
		#black
		$".".move_child($White, 6)
		$".".move_child($Black, 7)
	if Input.is_action_just_pressed("Click") and hover == true and Globals.lore_won == true:
		
		if $LoreOrganizer/DirectionalLight2D.visible == true and $LoreOrganizer/CanvasLayer/Label.visible == true:
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
	#print(hover) # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	hover = false
	#print(hover)


func _on_r_train_button_button_up() -> void:
	if(Globals.rook_a_train):
		Globals.rook_a_train = false
	else:
		Globals.rook_a_train = true


func _on_slot_button_button_up() -> void:
	if Globals.slot_unlocked == true:
		$RouletteOrganizer/Camera2D.global_position = $SlotsOrganiser/CameraPositioning.global_position
	else:
		_failed_open()



func _on_return_button_button_up() -> void:
	$RouletteOrganizer/Camera2D.global_position = $RouletteOrganizer/BoardMarker.global_position


func _on_shop_button_button_up() -> void:
	$RouletteOrganizer/Camera2D.global_position = $Shop/ShopMarker.global_position


func _on_shop_return_button_button_up() -> void:
	$RouletteOrganizer/Camera2D.global_position = $RouletteOrganizer/BoardMarker.global_position


func _on_fish_return_button_up() -> void:

	$RouletteOrganizer/Camera2D.global_position = $RouletteOrganizer/BoardMarker.global_position # Replace with function body.
	Globals.fishing_active = false

func _on_fish_button_button_up() -> void:
	if Globals.fish_unlocked == true:
		Globals.fishing_active = true
		$RouletteOrganizer/Camera2D.global_position = $FishingGame/FishMarker.global_position
	else:
		_failed_open()
		
		#makes some text fly up the screen for a better visual indicator of whats going on 
		#behind the scenes. Heuristics! the text is actually always flying up, it just gets
		#teleprted down and mad visible when its needed.
func _failed_open():
	$Shop/FailedOpenLabel.global_position = $Shop/LabelMarker.global_position
	$Shop/FailedOpenLabel.visible = true
	$Shop/FailedOpenLabel.text = str("Buy the game key in the shop
	to unlock this minigame!")
	$Shop/FailedOpenTimer.start()



func _on_failed_open_timer_timeout() -> void:
	$Shop/FailedOpenLabel.visible = false


func _on_tutorial_button_button_up() -> void:
	$Tutorial/ContinueButton.visible = true
	$Tutorial/TutorialButton.visible = false
	$Tutorial/Label.visible = true

#did this system for all the tutroisals but only gonna explain it once, this is just checking a varibale
#and changing the text of the labl to match whatever part of the tutorial you are in. did it so that
# the tutorial was broken up and therefore more palatable. 
func _on_continue_button_button_up() -> void:
	if stage == 0:
		$Tutorial/Label.text = str("The main goal of chess is to capture the opponents king. you capture a piece by putting one
		of your pieces on top of it. the king can be found on the green square of each side and wears a cape")
		
		
	elif stage == 1:
		$Tutorial/Label.text = str("Between you and your partner, one person will be playing as the white pieces, and one
		will be playing as the black peices.")
		
		
	elif stage == 2:
		$Tutorial/Label.text = str("if you haven't yet picked who plays as who, now would be a good time to do so.")
		
		
	elif stage == 3:
		$Tutorial/Label.text = str("White plays first. On each turn you can move one of your pieces according to how that 
		particular kind of piece can move")
		
		
	elif stage == 4:
		$Tutorial/Label.text = str("Clicking on the piece you want to move will display every tile that piece can move on to.")
		
		
	elif stage == 5:
		$Tutorial/Label.text = str("the most common piece is the pawn, which are the line of pieces closest to your opponent. They can move
		2 squares forward on their first turn, and one square forward afterwards.")
		
		
	elif stage == 6:
		$Tutorial/Label.text = str("pawns cannot take like regular pieces can. for most pieces, they take by landing on a pice iwth their regular movement path.
		pawns, however, can only take other pices diagonally, up to 1 square. 
		")
		
		
	elif stage == 7:
		$Tutorial/Label.text = str("pawns cannot move diagonally if they do not have another piece ahead of them to take.
		I know it's complicated but thats chess for you.")
		
		
	elif stage == 8:
		$Tutorial/Label.text = str("next is the rook, which are the two castle-shaped pieces on the outside of the ranks. THey are much, much simpler, as they can move
		as many squares as they want horizontally or vertically.")
		
		
	elif stage == 9:
		$Tutorial/Label.text = str("then there is the knight, which are the horse-shaped pieces next too the rooks. They can move in an L shape, and can also jump 
		over other pieces")
		
		
	elif stage == 10:
		$Tutorial/Label.text = str("the bishop is next, and they are the tall pieces next to the knights. they can move along the diagonals.")
		
		
	elif stage == 11:
		$Tutorial/Label.text = str("then there is the king, who can be seen with a cape to distinguish him. He can move one square in any direction but if he is captured, you loose.")
		
		
	elif stage == 12:
		$Tutorial/Label.text = str("Finally, the queen. She is next to the king and can
		move as many squares and she wants horizontally, vertically, or diagonally. ")
		
		
	elif stage == 13:
		$Tutorial/Label.text = str("Thats all the pieces. I don't expect you to
		remeber all of that, so feel free to come back to the tutorial. Remeber that you can see
		what squares a piece can move to when slecting it if you get stuck. Happy chess-ing!")
		
		
	elif stage == 14:
		$Tutorial/ContinueButton.visible = false
		$Tutorial/TutorialButton.visible = true
		$Tutorial/Label.visible = false
		stage = 0
		$Tutorial/Label.text = str("This is chess, your main objective.")
	if stage < 14:
		stage += 1
		
