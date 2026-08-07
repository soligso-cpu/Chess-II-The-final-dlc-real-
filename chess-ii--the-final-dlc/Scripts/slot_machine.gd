extends Node2D
const SLOT_7_SCENE = preload("res://Scenes/Slots/slot_7.tscn")
const SLOT_BUST_SCENE = preload("res://Scenes/Slots/slot_bust.tscn")
const SLOT_DOUBLE_SCENE = preload("res://Scenes/Slots/slot_double.tscn")
const SLOT_JACKPOT_SCENE = preload("res://Scenes/Slots/slot_jackpot.tscn")
enum slot_1 {
	SLOT_1_7,
	SLOT_1_BUST,
	SLOT_1_DOUBLE,
	SLOT_1_JACKPOT
}
var slot_full_1 = false
var slot_full_2
var slot_full_3
var slot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if slot_full_1 == false:
		var slot_randi = randi_range(slot_1.SLOT_1_7, slot_1.SLOT_1_JACKPOT)
		if slot_randi == 0:
			var slot_1 = SLOT_7_SCENE.instantiate()
			spawn_slot(slot_1, $LineMarkers/Line1)
		if slot_randi == 1:
			var slot_bust = SLOT_BUST_SCENE.instantiate()
			spawn_slot(slot_bust, $LineMarkers/Line1)
		if slot_randi == 2:
			var slot_double = SLOT_DOUBLE_SCENE.instantiate()
			spawn_slot(slot_double, $LineMarkers/Line1)
		if slot_randi == 3:
			var slot_jackpot = SLOT_JACKPOT_SCENE.instantiate()
			spawn_slot(slot_jackpot, $LineMarkers/Line1)
		slot_full_1 = true
		
func spawn_slot(slot, line):
	print(slot)
	slot.global_position = line.global_position
	
	#okay, system is flawed on a few levels. the teleing where to go should be in
	#the og block, not the new one. dang. 
