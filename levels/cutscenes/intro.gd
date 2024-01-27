extends Node2D

@onready var intro: AudioStream = preload("res://sound/other/introduction.mp3")
@onready var liability: AudioStream = preload("res://sound/other/liability.mp3")
@onready var audio: AudioStreamPlayer2D = $SpeakerAudio

var has_played = false

func _ready():
	audio.stream = intro
	audio.play()

func _on_speaker_audio_finished():
	if has_played:
		return
	
	audio.stream = liability
	audio.pitch_scale = 1.85
	audio.play()
	has_played = true
