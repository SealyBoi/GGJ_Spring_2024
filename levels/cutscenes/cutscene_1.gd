extends Node2D

@onready var closet: Sprite2D = $Closet
@onready var audio: AudioStreamPlayer2D = $ClosetAudio
@onready var closet_anim: AnimationPlayer = $Closet/AnimationPlayer
@onready var pre_scare: AudioStream = preload("res://sound/closet/pre_scare.mp3")
@onready var post_scare: AudioStream = preload("res://sound/closet/post_scare.mp3")
var can_play = true

func _ready():
	# Play the audio of him getting ready to scare the player
	audio.stream = pre_scare
	audio.play()

func _on_area_2d_area_entered(_area):
	if not can_play:
		return
	
	# Play the animation for him trying to jump out
	closet_anim.play("shake")
	# Play audio of him being stuck
	audio.stream = post_scare
	audio.play()
	# Make it so you cannot play the audio by entering again
	can_play = false
