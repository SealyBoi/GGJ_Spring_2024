extends Node2D

@onready var clown = $Clown
@onready var clown_audio = $ClownAudio
# @onready var pass_audio = preload("res://sound/clown/pass.mp3")

func _ready():
	clown_audio.play()

func _on_area_2d_area_entered(area):
	pass
	# clown_audio.stop()
	# clown_audio.stream = pass_audio
	# clown_audio.play()
