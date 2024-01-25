extends Node2D

@onready var ghost: AnimatedSprite2D = $Ghost
@onready var audio: AudioStreamPlayer2D = $GhostAudio
@onready var hole: PackedScene = preload("res://objects/hole.tscn")
@onready var ghost_fall: AudioStream = preload("res://sound/ghost/temp_ghost_fall.mp3")
@onready var ghost_woo: AudioStream = preload("res://sound/ghost/temp_ghost_woo.mp3")
var curr_animation = 1
var light_on = true

func _ready():
	$LightTimer.start()
	audio.stream = ghost_woo

func _on_light_timer_timeout():
	if not light_on:
		light_on = true
		$LightTimer.start()
		$Lights.visible = true
		audio.stop()
		return
	
	if curr_animation == 1:
		# Move to position 1
		play_anim("lean_left")
		audio.play()
	elif curr_animation == 2:
		# Move to position 2
		play_anim("lean_right")
		audio.play()
	elif curr_animation == 3:
		# Spawn hole where ghost was
		play_anim("fall")
		audio.play()
		await get_tree().create_timer(0.75).timeout
		audio.stop()
		audio.stream = ghost_fall
		audio.play()
		$AudioTimer.start()
		var new_hole = hole.instantiate()
		new_hole.position = ghost.position
		add_child(new_hole)
		ghost.queue_free()
		$Player.pause_input = false
	
	curr_animation = curr_animation + 1
	$LightTimer.start()

func play_anim(anim):
	ghost.play(anim)
	light_on = false
	ghost.position = ghost.position + Vector2(-128, 0)
	$Lights.visible = false

func _on_audio_timer_timeout():
	audio.volume_db = audio.volume_db - 5
	if audio.volume_db > -80:
		$AudioTimer.start()
