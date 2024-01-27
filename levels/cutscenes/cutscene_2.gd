extends Node2D

@onready var clown = $Clown
@onready var clown_audio = $ClownAudio
@onready var enter_audio = preload("res://sound/clown/clown_enter.mp3")
@onready var pass_audio = preload("res://sound/clown/clown_pass.mp3")

var can_play = true

func _ready():
	clown_audio.stream = enter_audio
	clown_audio.play()

func _on_area_2d_area_entered(_area):
	if not can_play:
		return
	
	clown_audio.stop()
	clown_audio.stream = pass_audio
	clown_audio.play()
	can_play = false
