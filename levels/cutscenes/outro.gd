extends Node2D

@onready var speaker: AnimatedSprite2D = $Speaker/AnimatedSprite2D

func _ready():
	speaker.visible = true
	speaker.play("speaking")

func _on_speaker_audio_finished():
	speaker.visible = false
