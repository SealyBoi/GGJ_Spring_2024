extends ColorRect

# Reference to the _AnimationPlayer_ node
@onready var _anim_player = $AnimationPlayer

func _ready():
	# Plays the animation backward to fade in
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene):
	# Plays the fade animation and waits till it finishes
	_anim_player.play("Fade")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_packed(_next_scene)
