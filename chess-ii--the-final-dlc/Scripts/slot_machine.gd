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
var spinning = false
var slot1
var slot2
var slot3
var line1
var line2
var line3
var top1
var top2
var top3
var purge = false
var count = 0
var can_gamble = true
var top_check = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in $Area2D2.get_overlapping_bodies():
		if purge == true:
			body.queue_free()
			count -= 1
			print("purge")
			
	print("count is,", count)
	if top_check == true and count < 9:
		spawn_slot($LineMarkers/Line1)
		spawn_slot($LineMarkers/Line2)
		spawn_slot($LineMarkers/Line3)
	if count > 9:
		top_check = false
		
func spawn_slot(slot):
	
		
	var slot_randi = randi_range(slot_1.SLOT_1_7, slot_1.SLOT_1_JACKPOT)
	if slot_randi == 0:
		var slot_7 = SLOT_7_SCENE.instantiate()
		$SpawnedSlots.add_child(slot_7)
		slot_7.global_position = slot.global_position
		slot_7.add_to_group("Slot7Group")
		
	if slot_randi == 1:
		var slot_bust = SLOT_BUST_SCENE.instantiate()
		$SpawnedSlots2.add_child(slot_bust)
		slot_bust.global_position = slot.global_position
		
	if slot_randi == 2:
		var slot_double = SLOT_DOUBLE_SCENE.instantiate()
		$SpawnedSlots3.add_child(slot_double)
		slot_double.global_position = slot.global_position
		
		
	if slot_randi == 3:
		var slot_jackpot = SLOT_JACKPOT_SCENE.instantiate()
		$SpawnedSlots4.add_child(slot_jackpot)
		slot_jackpot.global_position = slot.global_position
		
	
	count += 1





func _on_area_2d_body_exited(body: Node2D) -> void:
	body.queue_free()
	count -= 1


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


func _on_button_button_up() -> void:
	if spinning == false and can_gamble == true:
		purge = false
		
		spawn_slot($LineMarkers/Line1)
		spawn_slot($LineMarkers/Line2)
		spawn_slot($LineMarkers/Line3)
		$SpawnTimer.start()
		$StaticBody2D/CollisionShape2D.disabled = true
		
		spinning = true
		
	elif spinning == true and can_gamble == true:
		top_check = true
		print("next step, gud")
		$StaticBody2D/CollisionShape2D.disabled = false
		$SpawnTimer.stop()
		
		print($SlotDetection/Line3.get_overlapping_bodies(), "work" )
		if count < 9:
			print("count is still", count)
			spawn_slot($LineMarkers/Line1)
			spawn_slot($LineMarkers/Line2)
			spawn_slot($LineMarkers/Line3)
			print("top-up", count)
			if count < 9:
				spawn_slot($LineMarkers/Line1)
				spawn_slot($LineMarkers/Line2)
				spawn_slot($LineMarkers/Line3)
				print("top up again")
		else:
			print("huh", count)
		spinning = false
		$ProcessTimer.start()
		can_gamble = false


	


func _on_slot_3_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		slot1 = 1
	elif body.get_parent() == $SpawnedSlots2:
		slot1 = 2
	elif body.get_parent() == $SpawnedSlots3:
		slot1 = 3
	elif body.get_parent() == $SpawnedSlots4:
		slot1 = 4
	print(slot1)

func _on_slot_2_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		slot2 = 1
	elif body.get_parent() == $SpawnedSlots2:
		slot2 = 2
	elif body.get_parent() == $SpawnedSlots3:
		slot2 = 3
	elif body.get_parent() == $SpawnedSlots4:
		slot2 = 4
	print(slot2)


func _on_slot_1_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		slot3 = 1
	elif body.get_parent() == $SpawnedSlots2:
		slot3 = 2
	elif body.get_parent() == $SpawnedSlots3:
		slot3 = 3
	elif body.get_parent() == $SpawnedSlots4:
		slot3 = 4
	print(slot3)

func _on_process_timer_timeout() -> void:
	top_check = false
	print(slot1,slot2,slot3)
	if slot1 == slot2 and slot2 == slot3:
	#JQACKPOT is 4 slot7 is 1 bust is2 and double is 3
		print("WOW IT WORKS")
		if slot1 == 1:
			regular_win()
		elif slot1 == 2:
			bust_win()
		elif slot1 == 3:
			double_win()
		elif slot1 == 4:
			jackpot_win()
		
		
		
		
		
	if line1 == line2 and line2 == line3:
		print("WOW IT WORKS PT 2")
		if line1 == 1:
			regular_win()
		elif line1 == 2:
			bust_win()
		elif line1 == 3:
			double_win()
		elif line1 == 4:
			jackpot_win()
		
	if top1 == top2 and top2 == top3:
		print("WOW IT WORKS 3")
		if top1 == 1:
			regular_win()
		elif top1 == 2:
			bust_win()
		elif top1 == 3:
			double_win()
		elif top1 == 4:
			jackpot_win()
	if top1 == line2 and line2 == slot3:
		print("WOW IT WORKS 4")
		if slot3 == 1:
			regular_win()
		elif slot3 == 2:
			bust_win()
		elif slot3 == 3:
			double_win()
		elif slot3 == 4:
			jackpot_win()
	if top3 == line2 and line2 == slot1:
		print("WOW IT WORKS 5")
		if slot1 == 1:
			regular_win()
		elif slot1 == 2:
			bust_win()
		elif slot1 == 3:
			double_win()
		elif slot1 == 4:
			jackpot_win()
	$PurgeTimer.start()
		
	


func _on_purge_timer_timeout() -> void:
	if purge == false:
		purge = true
		$PurgeTimer.start()
	elif purge == true:
		purge = false
		can_gamble = true


func _on_line_1_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		line1 = 1
	elif body.get_parent() == $SpawnedSlots2:
		line1 = 2
	elif body.get_parent() == $SpawnedSlots3:
		line1 = 3
	elif body.get_parent() == $SpawnedSlots4:
		line1 = 4
	print(line1)


func _on_line_2_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		line2 = 1
	elif body.get_parent() == $SpawnedSlots2:
		line2 = 2
	elif body.get_parent() == $SpawnedSlots3:
		line2 = 3
	elif body.get_parent() == $SpawnedSlots4:
		line2 = 4
	print(line2)


func _on_line_3_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		line3 = 1
	elif body.get_parent() == $SpawnedSlots2:
		line3 = 2
	elif body.get_parent() == $SpawnedSlots3:
		line3 = 3
	elif body.get_parent() == $SpawnedSlots4:
		line3 = 4
	print(line3)


func _on_top_1_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		top1 = 1
	elif body.get_parent() == $SpawnedSlots2:
		top1 = 2
	elif body.get_parent() == $SpawnedSlots3:
		top1 = 3
	elif body.get_parent() == $SpawnedSlots4:
		top1 = 4
	print(top1)


func _on_top_2_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		top2 = 1
	elif body.get_parent() == $SpawnedSlots2:
		top2 = 2
	elif body.get_parent() == $SpawnedSlots3:
		top2 = 3
	elif body.get_parent() == $SpawnedSlots4:
		top2 = 4
	print(top2)


func _on_top_3_body_entered(body: Node2D) -> void:
	if body.get_parent() == $SpawnedSlots:
		top3 = 1
	elif body.get_parent() == $SpawnedSlots2:
		top3 = 2
	elif body.get_parent() == $SpawnedSlots3:
		top3 = 3
	elif body.get_parent() == $SpawnedSlots4:
		top3 = 4
	print(top3)
	
	
func regular_win():
	print("reg win")
func bust_win():
	print("bust win")
func double_win():
	print("Double win")
func jackpot_win():
	print("Jackpot win")
