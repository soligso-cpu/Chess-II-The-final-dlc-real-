extends AudioStreamPlayer

@onready var first: AudioStreamPlayer = $Start
@onready var second: AudioStreamPlayer = $Loop

func _ready():
	first.finished.connect(_on_first_finished)

func _on_first_finished():
	second.play()

func play_first():
	first.play()
