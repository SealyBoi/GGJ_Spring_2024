extends Node2D

@onready var chainsaw_start: AudioStream = preload("res://sound/chainsaw/chainsaw_start.mp3")
@onready var reaction0: AudioStream = preload("res://sound/chainsaw/chainsaw_reaction0.mp3")
@onready var reaction1: AudioStream = preload("res://sound/chainsaw/chainsaw_reaction1.mp3")
@onready var reaction2: AudioStream = preload("res://sound/chainsaw/chainsaw_reaction2.mp3")
@onready var guy_audio: AudioStreamPlayer2D = $GuyAudio
@onready var chainsaw_audio: AudioStreamPlayer2D = $ChainsawAudio
@onready var crank_timer = $CrankTimer
@onready var rest_timer = $RestTimer
@onready var anim = $Chainsaw/AnimationPlayer

var crank_count = 1

func _ready():
	guy_audio.stream = chainsaw_start
	guy_audio.play()
	crank_timer.start()

func _on_crank_timer_timeout():
	if crank_count <= 3:
		chainsaw_audio.play()
		anim.play("crank")
		crank_count = crank_count + 1
		crank_timer.start()
	else:
		chainsaw_audio.stop()
		rest_timer.start()

func _on_rest_timer_timeout():
	var rand = randi() % 3
	if rand == 0:
		guy_audio.stream = reaction0
	elif rand == 1:
		guy_audio.stream = reaction1
	else:
		guy_audio.stream = reaction2
	guy_audio.play()
	crank_count = 1
	crank_timer.start()
