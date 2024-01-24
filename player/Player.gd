extends Area2D

@onready var ray = $RayCast2D

var tile_size = 64
var inputs = {"right": Vector2.RIGHT,
"left": Vector2.LEFT,
"up": Vector2.UP,
"down": Vector2.DOWN}

var animation_speed = 10
var moving = false

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		transition(dir)
	elif ray.get_collider().is_in_group("pushable"):
		if ray.get_collider().can_move(dir):
			transition(dir)

func transition(dir):
	var tween = create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false
