extends Node

var board_tiles = { 
	
	"A": {
		"A1": {"state": true}, "A2": {"state": true}, "A3": {"state": true}, "A4": {"state": true}, "A5": {"state": true}, "A6": {"state": true}, "A7": {"state": true},"A8": {"state": true},
		},
	"B": {
		"B1": {"state": true}, "B2": {"state": true}, "B3": {"state": true}, "B4": {"state": true}, "B5": {"state": true}, "B6": {"state": true}, "B7": {"state": true}, "B8": {"state": true},
		},
	"C": {
		"C1": {"state": false}, "C2": {"state": false}, "C3": {"state": false}, "C4": {"state": false}, "C5": {"state": false}, "C6": {"state": false}, "C7": {"state": false}, "C8": {"state": false},
		},
	"D": {
		"D1": {"state": false}, "D2": {"state": false}, "D3": {"state": false}, "D4": {"state": false}, "D5": {"state": false}, "D6": {"state": false}, "D7": {"state": false}, "D8": {"state": false},
		},
	"E": {
		"E1": {"state": false}, "E2": {"state": false}, "E3": {"state": false}, "E4": {"state": false}, "E5": {"state": false}, "E6": {"state": false}, "E7": {"state": false}, "E8": {"state": false},
		},
	"F": {
		"F1": {"state": false}, "F2": {"state": false}, "F3": {"state": false}, "F4": {"state": false}, "F5": {"state": false}, "F6": {"state": false}, "F7": {"state": false}, "F8": {"state": false},
		},
	"G": {
		"G1": {"state": true}, "G2": {"state": true}, "G3": {"state": true}, "G4": {"state": true}, "G5": {"state": true}, "G6": {"state": true}, "G7": {"state": true}, "G8": {"state": true},
		},
	"H": {
		"H1": {"state": true}, "H2": {"state": true}, "H3": {"state": true}, "H4": {"state": true}, "H5": {"state": true}, "H6": {"state": true}, "H7": {"state": true}, "H8": {"state": true},
		}
	
}

var accessing
var accessing_group
var position_target
var state
var turn_count

var lore_won = false

#region Tile Variables

#region "A" Tiles

var a1_state = ""
var a2_state = ""
var a3_state = ""
var a4_state = ""
var a5_state = ""
var a6_state = ""
var a7_state = ""
var a8_state = ""

#endregion
#region "B" Tiles

var b1_state = ""
var b2_state = ""
var b3_state = ""
var b4_state = ""
var b5_state = ""
var b6_state = ""
var b7_state = ""
var b8_state = ""

#endregion
#region "C" Tiles

var c1_state = ""
var c2_state = ""
var c3_state = ""
var c4_state = ""
var c5_state = ""
var c6_state = ""
var c7_state = ""
var c8_state = ""

#endregion
#region "D" Tiles

var d1_state = ""
var d2_state = ""
var d3_state = ""
var d4_state = ""
var d5_state = ""
var d6_state = ""
var d7_state = ""
var d8_state = ""

#endregion
#region "E" Tiles

var e1_state = ""
var e2_state = ""
var e3_state = ""
var e4_state = ""
var e5_state = ""
var e6_state = ""
var e7_state = ""
var e8_state = ""

#endregion
#region "F" TIles

var f1_state = ""
var f2_state = ""
var f3_state = ""
var f4_state = ""
var f5_state = ""
var f6_state = ""
var f7_state = ""
var f8_state = ""

#endregion
#region "G" Tiles

var g1_state = ""
var g2_state = ""
var g3_state = ""
var g4_state = ""
var g5_state = ""
var g6_state = ""
var g7_state = ""
var g8_state = ""

#endregion
#region "H" Tiles


var h1_state = ""
var h2_state = ""
var h3_state = ""
var h4_state = ""
var h5_state = ""
var h6_state = ""
var h7_state = ""
var h8_state = ""

#endregion

#endregion

var turn_tracking
var turn_amount = 2
var moved
var white_turns = 0
var black_turns = 0

var piece_focused = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	turn_tracking = 1 # 1 = white, 0 = black

	turn_count = 1
	piece_focused = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#region accessing A
	if(accessing == "A1"):
		position_target = Vector2(336, 43)
		board_tiles["A"]["A1"].state = true
	if(accessing == "A2"):
		position_target = Vector2(416, 43)
		board_tiles["A"]["A2"].state = true
	if(accessing == "A3"):
		position_target = Vector2(496, 43)
		board_tiles["A"]["A3"].state = true
	if(accessing == "A4"):
		print("accessing a4")
		position_target = Vector2(576, 43)
		print(position_target)
		board_tiles["A"]["A4"].state = true
	if(accessing == "A5"):
		position_target = Vector2(656, 43)
		board_tiles["A"]["A5"].state = true
	if(accessing == "A6"):
		position_target = Vector2(736, 43)
		board_tiles["A"]["A6"].state = true
	if(accessing == "A7"):
		position_target = Vector2(816, 43)
		board_tiles["A"]["A7"].state = true
	if(accessing == "A8"):
		position_target = Vector2(896, 43)
		board_tiles["A"]["A8"].state = true
	#endregion
	#region accessing B
	if(accessing == "B1"):
		position_target = Vector2(336, 123)
		board_tiles["B"]["B1"].state = true
	if(accessing == "B2"):
		position_target = Vector2(416, 123)
		board_tiles["B"]["B2"].state = true
	if(accessing == "B3"):
		position_target = Vector2(496, 123)
		board_tiles["B"]["B3"].state = true
	if(accessing == "B4"):
		position_target = Vector2(576, 123)
		board_tiles["B"]["B4"].state = true
	if(accessing == "B5"):
		position_target = Vector2(656, 123)
		board_tiles["B"]["B5"].state = true
	if(accessing == "B6"):
		position_target = Vector2(736, 123)
		board_tiles["B"]["B6"].state = true
	if(accessing == "B7"):
		position_target = Vector2(816, 123)
		board_tiles["B"]["B7"].state = true
	if(accessing == "B8"):
		position_target = Vector2(896, 123)
		board_tiles["B"]["B8"].state = true
	#endregion
	#region accessing C
	if(accessing == "C1"):
		position_target = Vector2(336, 203)
		board_tiles["C"]["C1"].state = true
	elif(accessing == "C2"):
		position_target = Vector2(416, 203)
		board_tiles["C"]["C2"].state = true
	elif(accessing == "C3"):
		position_target = Vector2(496, 203)
		board_tiles["C"]["C3"].state = true
	elif(accessing == "C4"):
		position_target = Vector2(576, 203)
		board_tiles["C"]["C4"].state = true
	elif(accessing == "C5"):
		position_target = Vector2(656, 203)
		board_tiles["C"]["C5"].state = true
	elif(accessing == "C6"):
		position_target = Vector2(736, 203)
		board_tiles["C"]["C6"].state = true
	elif(accessing == "C7"):
		position_target = Vector2(816, 203)
		board_tiles["C"]["C7"].state = true
	elif(accessing == "C8"):
		position_target = Vector2(896, 203)
		board_tiles["C"]["C8"].state = true
	#endregion
	#region accessing D
	if(accessing == "D1"):
		position_target = Vector2(336, 283)
		board_tiles["D"]["D1"].state = true
	elif(accessing == "D2"):
		position_target = Vector2(416, 283)
		board_tiles["D"]["D2"].state = true
	elif(accessing == "D3"):
		position_target = Vector2(496, 283)
		board_tiles["D"]["D3"].state = true
	elif(accessing == "D4"):
		position_target = Vector2(576, 283)
		board_tiles["D"]["D4"].state = true
	elif(accessing == "D5"):
		position_target = Vector2(656, 283)
		board_tiles["D"]["D5"].state = true
	elif(accessing == "D6"):
		position_target = Vector2(736, 283)
		board_tiles["D"]["D6"].state = true
	elif(accessing == "D7"):
		position_target = Vector2(816, 283)
		board_tiles["D"]["D7"].state = true
	elif(accessing == "D8"):
		position_target = Vector2(896, 283)
		board_tiles["D"]["D8"].state = true
	#endregion
	#region accessing E
	if(accessing == "E1"):
		position_target = Vector2(336, 363)
		board_tiles["E"]["E1"].state = true
	elif(accessing == "E2"):
		position_target = Vector2(416, 363)
		board_tiles["E"]["E2"].state = true
	elif(accessing == "E3"):
		position_target = Vector2(496, 363)
		board_tiles["E"]["E3"].state = true
	elif(accessing == "E4"):
		position_target = Vector2(576, 363)
		board_tiles["E"]["E4"].state = true
	elif(accessing == "E5"):
		position_target = Vector2(656, 363)
		board_tiles["E"]["E5"].state = true
	elif(accessing == "E6"):
		position_target = Vector2(736, 363)
		board_tiles["E"]["E6"].state = true
	elif(accessing == "E7"):
		position_target = Vector2(816, 363)
		board_tiles["E"]["E7"].state = true
	elif(accessing == "E8"):
		position_target = Vector2(896, 363)
		board_tiles["E"]["E8"].state = true
	#endregion
	#region accessing F
	if(accessing == "F1"):
		position_target = Vector2(336, 443)
		board_tiles["F"]["F1"].state = true
	elif(accessing == "F2"):
		position_target = Vector2(416, 443)
		board_tiles["F"]["F2"].state = true
	elif(accessing == "F3"):
		position_target = Vector2(496, 443)
		board_tiles["F"]["F3"].state = true
	elif(accessing == "F4"):
		position_target = Vector2(576, 443)
		board_tiles["F"]["F4"].state = true
	elif(accessing == "F5"):
		position_target = Vector2(656, 443)
		board_tiles["F"]["F5"].state = true
	elif(accessing == "F6"):
		position_target = Vector2(736, 443)
		board_tiles["F"]["F6"].state = true
	elif(accessing == "F7"):
		position_target = Vector2(816, 443)
		board_tiles["F"]["F7"].state = true
	elif(accessing == "F8"):
		position_target = Vector2(896, 443)
		board_tiles["F"]["F8"].state = true
	#endregion
	#region accessing G
	if(accessing == "G1"):
		position_target = Vector2(336, 523)
		board_tiles["G"]["G1"].state = true
	elif(accessing == "G2"):
		position_target = Vector2(416, 523)
		board_tiles["G"]["G2"].state = true
	elif(accessing == "G3"):
		position_target = Vector2(496, 523)
		board_tiles["G"]["G3"].state = true
	elif(accessing == "G4"):
		position_target = Vector2(576, 523)
		board_tiles["G"]["G4"].state = true
	elif(accessing == "G5"):
		position_target = Vector2(656, 523)
		board_tiles["G"]["G5"].state = true
	elif(accessing == "G6"):
		position_target = Vector2(736, 523)
		board_tiles["G"]["G6"].state = true
	elif(accessing == "G7"):
		position_target = Vector2(816, 523)
		board_tiles["G"]["G7"].state = true
	elif(accessing == "G8"):
		position_target = Vector2(896, 523)
		board_tiles["G"]["G8"].state = true
	#endregion
	#region acdessing H
	if(accessing == "H1"):
		position_target = Vector2(336, 603)
		board_tiles["H"]["H1"].state = true
	elif(accessing == "H2"):
		position_target = Vector2(416, 603)
		board_tiles["H"]["H2"].state = true
	elif(accessing == "H3"):
		position_target = Vector2(496, 603)
		board_tiles["H"]["H3"].state = true
	elif(accessing == "H4"):
		position_target = Vector2(576, 603)
		board_tiles["H"]["H4"].state = true
	elif(accessing == "H5"):
		position_target = Vector2(656, 603)
		board_tiles["H"]["H5"].state = true
	elif(accessing == "H6"):
		position_target = Vector2(736, 603)
		board_tiles["H"]["H6"].state = true
	elif(accessing == "H7"):
		position_target = Vector2(816, 603)
		board_tiles["H"]["H7"].state = true
	elif(accessing == "H8"):
		position_target = Vector2(896, 603)
		board_tiles["H"]["H8"].state = true
	#endregion
	
	if(white_turns >= 1):
		turn_tracking = 1
		if(moved):
			turn_count += 1
			white_turns -= 1
			moved = false
			return
	elif(black_turns >= 1):
		turn_tracking = 0
		if(moved):
			turn_count += 1
			black_turns -= 1
			moved = false
			return
	elif(white_turns == 0 && turn_tracking > 1):
		turn_tracking = 0
		turn_count += 1
		
func _game_won() -> void:
	print("winwinwinwinwinwinwin")
	var lore = randi_range(3, 3)
	if lore == 3:
		print("Ker’vahrah is a lone dryad warrior sent from the outskirts of Mernath, attempting to go on solo raids far into the country, pillaging everything they can. Soon, after many travels, they would find the city of Terkast, a solitary and dark and hallowed ground; the skies are blackened with tar and lampblack and lightning strikes the tip of the castle. Entering such a castle through the lurid gates lined with skin-stretched wooden crude pikes, they would find a chess table. Sat at the other side of such a table is an unknown shadowy figure. They invite Ker’vahrah to play. Slowly, they sit and the game commences. The shadowed figure speaks. “Suppose two men at cards with nothing to wager save their lives. Who has not heard such a tale? A turn of the card. The whole universe for such a player has laboured clanking to this moment which will tell if he is to die at that man's hand or that man at his. What more certain validation of a man's worth could there be? This enhancement of the game to its ultimate state admits no argument concerning the notion of fate. The selection of one man over another is a preference absolute and irrevocable and it is a dull man indeed who could reckon so profound a decision without agency or significance either one. In such games as have for their stake the annihilation of the defeated the decisions are quite clear. This man holding this particular arrangement of cards in his hand is thereby removed from existence. This is the nature of gambling, whose stake is at once the game and the authority and the justification. Seen so, gambling is the truest form of divination. It is the testing of one's will and the will of another within that larger will which because it binds them is therefore forced to select. Gambling is the ultimate game because gambling is at last a forcing of the unity of existence. Gambling is god.”
")
		lore_won = true
