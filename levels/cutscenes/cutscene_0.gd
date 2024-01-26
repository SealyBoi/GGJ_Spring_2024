extends Node2D

@onready var ghost: AnimatedSprite2D = $Ghost
@onready var audio: AudioStreamPlayer2D = $GhostAudio
@onready var floor_audio: AudioStreamPlayer2D = $FloorAudio
@onready var lights: Node2D = $Lighting/Lights
@onready var hole: PackedScene = preload("res://objects/hole.tscn")
@onready var ghost_fall0: AudioStream = preload("res://sound/ghost/temp_ghost_fall.mp3")
@onready var ghost_woo: AudioStream = preload("res://sound/ghost/temp_ghost_woo.mp3")
@onready var ghost_woo0: AudioStream = preload("res://sound/ghost/ghost_woo0.mp3")
@onready var ghost_woo1: AudioStream = preload("res://sound/ghost/ghost_woo1.mp3")
@onready var ghost_woo2: AudioStream = preload("res://sound/ghost/ghost_woo2.mp3")
@onready var ghost_fall: AudioStream = preload("res://sound/ghost/ghost_fall.mp3")
var curr_animation = 1
var light_on = true

func _ready():
	$LightTimer.start()
	audio.stream = ghost_woo0

func _on_light_timer_timeout():
	if not light_on:
		light_on = true
		$LightTimer.start()
		lights.visible = true
		return
	
	if curr_animation == 1:
		# Move to position 1
		play_anim("lean_left")
		audio.play()
	elif curr_animation == 2:
		# Move to position 2
		play_anim("lean_right")
		audio.stream = ghost_woo1
		audio.play()
	elif curr_animation == 3:
		# Spawn hole where ghost was
		play_anim("fall")
		audio.stream = ghost_woo2
		audio.play()
		await get_tree().create_timer(0.75).timeout
		floor_audio.play()
		audio.stop()
		audio.stream = ghost_fall
		audio.play()
		$AudioTimer.start()
		$LightTimer.wait_time = 0.75
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
	lights.visible = false

func _on_audio_timer_timeout():
	audio.volume_db = audio.volume_db - 5
	if audio.volume_db > -80:
		$AudioTimer.start()
	else:
		audio.stop()
