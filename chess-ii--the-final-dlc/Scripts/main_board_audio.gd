extends Node

var audio_player: AudioStreamPlayer

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = preload("res://Sounds/Chess2TFDLCcalm2.mp3")
	audio_player.play()
