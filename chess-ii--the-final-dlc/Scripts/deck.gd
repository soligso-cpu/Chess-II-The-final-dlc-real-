extends Sprite2D

@export var tarotCards : Array[Resource]
@export var tarotCardScene : PackedScene
@export var tarotCardHand : Node2D

func draw() -> void:
	#preparing the card
	print("card")
	tarotCards.shuffle()
	var data = tarotCards.pop_back()
	var tarot_card = tarotCardScene.instantiate()
	
	# set variables
	tarot_card.value = data.value
	tarot_card.tarotcardtexture = data.tarotcardtexture
	
	# create and add tarot card to scene
	tarot_card.global_position - tarotCardHand.global_position
	tarotCardHand.add_child(tarot_card)
	pass


func _on_button_button_up() -> void:
	draw()
