extends AudioStreamPlayer

func play_track(track):
	stream = load(track)
	play()
