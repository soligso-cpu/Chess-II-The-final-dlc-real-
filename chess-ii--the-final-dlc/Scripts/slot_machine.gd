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
	spawn_slot($LineMarkers/Line1)
	spawn_slot($LineMarkers/Line2)
	spawn_slot($LineMarkers/Line3)
	$SpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func spawn_slot(slot):
	
		
	var slot_randi = randi_range(slot_1.SLOT_1_7, slot_1.SLOT_1_JACKPOT)
	if slot_randi == 0:
		var slot_7 = SLOT_7_SCENE.instantiate()
		$SpawnedSlots.add_child(slot_7)
		slot_7.global_position = slot.global_position
		
	if slot_randi == 1:
		var slot_bust = SLOT_BUST_SCENE.instantiate()
		$SpawnedSlots.add_child(slot_bust)
		slot_bust.global_position = slot.global_position
		
	if slot_randi == 2:
		var slot_double = SLOT_DOUBLE_SCENE.instantiate()
		$SpawnedSlots.add_child(slot_double)
		slot_double.global_position = slot.global_position
		
	if slot_randi == 3:
		var slot_jackpot = SLOT_JACKPOT_SCENE.instantiate()
		$SpawnedSlots.add_child(slot_jackpot)
		slot_jackpot.global_position = slot.global_position
	






func _on_area_2d_body_exited(body: Node2D) -> void:
	body.queue_free()


func _on_spawn_timer_timeout() -> void:
	spawn_slot($LineMarkers/Line1)
	spawn_slot($LineMarkers/Line2)
	spawn_slot($LineMarkers/Line3)
	
	#var slot_randi = randi_range(slot_1.SLOT_1_7, slot_1.SLOT_1_JACKPOT)
	#if slot_randi == 0:
		#var slot_7 = SLOT_7_SCENE.instantiate()
		#$SpawnedSlots.add_child(slot_7)
		#slot_7.global_position = $LineMarkers/Line1.global_position
		#
	#if slot_randi == 1:
		#var slot_bust = SLOT_BUST_SCENE.instantiate()
		#$SpawnedSlots.add_child(slot_bust)
		#slot_bust.global_position = $LineMarkers/Line1.global_position
		#
	#if slot_randi == 2:
		#var slot_double = SLOT_DOUBLE_SCENE.instantiate()
		#$SpawnedSlots.add_child(slot_double)
		#slot_double.global_position = $LineMarkers/Line1.global_position
		#
	#if slot_randi == 3:
		#var slot_jackpot = SLOT_JACKPOT_SCENE.instantiate()
		#$SpawnedSlots.add_child(slot_jackpot)
		#slot_jackpot.global_position = $LineMarkers/Line1.global_position
	#
	#print(slot_randi)
