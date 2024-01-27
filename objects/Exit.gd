extends Node2D

@export var levelName: String = ""
@onready var nextLevel: PackedScene
@onready var scene_trans = get_node("/root/Main/HUD/SceneTransitionRect")
@onready var audio = $AudioStreamPlayer2D

func _ready():
	if levelName == "menu":
		nextLevel = load("res://screens/main_menu.tscn")
	else:
		nextLevel = load("res://levels/" + levelName + ".tscn")

func _on_area_2d_area_entered(area):
	area._pause_input()
	audio.play()
	call_deferred("_load_next_level")

func _load_next_level():
	scene_trans.transition_to(nextLevel)
