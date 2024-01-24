extends Node2D

@export var levelName: String = ""
@onready var nextLevel: PackedScene = load("res://levels/" + levelName + ".tscn")
@onready var scene_trans = get_node("/root/Main/HUD/SceneTransitionRect")

func _on_area_2d_area_entered(area):
	area._pause_input()
	call_deferred("_load_next_level")

func _load_next_level():
	scene_trans.transition_to(nextLevel)
