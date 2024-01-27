extends Node2D

@onready var intro: AudioStream = preload("res://sound/other/introduction.mp3")
@onready var liability: AudioStream = preload("res://sound/other/liability.mp3")
@onready var audio: AudioStreamPlayer2D = $SpeakerAudio
@onready var speaker: AnimatedSprite2D = $Speaker/AnimatedSprite2D

var has_played = false

func _ready():
	audio.stream = intro
	audio.play()
	speaker.visible = true
	speaker.play("speaking")

func _on_speaker_audio_finished():
	if has_played:
		speaker.visible = false
		return
	
	audio.stream = liability
	audio.pitch_scale = 1.85
	audio.play()
	has_played = true
