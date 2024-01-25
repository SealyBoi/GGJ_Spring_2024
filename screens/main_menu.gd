extends Control

@onready var first_level: PackedScene = preload("res://levels/test_levels/test_level_0.tscn")
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	audio.play()

func _on_play_pressed():
	get_tree().change_scene_to_packed(first_level)

func _on_credits_pressed():
	$Main.visible = false
	$Credits.visible = true

func _on_back_pressed():
	$Credits.visible = false
	$Main.visible = true
