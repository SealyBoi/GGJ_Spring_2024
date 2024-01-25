extends Node2D

@onready var closet: Sprite2D = $Closet
@onready var audio: AudioStreamPlayer2D = $ClosetAudio
var can_play = true

func _ready():
	# Play the audio of him getting ready to scare the player
	pass

func _on_area_2d_area_entered(area):
	if not can_play:
		return
	
	# Play the animation for him trying to jump out
	# Play audio of him being stuck
	# Make it so you cannot play the audio by entering again
	can_play = false
