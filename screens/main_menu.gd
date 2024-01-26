extends Control

@onready var first_level: PackedScene = preload("res://levels/cutscenes/cutscene_0.tscn")
@onready var scene_trans = $HUD/SceneTransitionRect
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	audio.play()

func _on_play_pressed():
	scene_trans.transition_to(first_level)

func _on_credits_pressed():
	$Main.visible = false
	$Credits.visible = true

func _on_back_pressed():
	$Credits.visible = false
	$Settings.visible = false
	$Main.visible = true

func _on_settings_pressed():
	$Main.visible = false
	$Settings.visible = true
