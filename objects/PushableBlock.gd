extends RigidBody2D

@onready var sunken_box = preload("res://art/sunken_box.png")
@onready var ray = $RayCast2D
@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D

var tile_size = 64
var inputs = {"right": Vector2.RIGHT,
"left": Vector2.LEFT,
"up": Vector2.UP,
"down": Vector2.DOWN}

var animation_speed = 10
var moving = false

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if not ray.is_colliding():
		transition(dir)
		return true
	var collider = ray.get_collider()
	if collider.is_in_group("pushable"):
		if collider.can_move(dir):
			transition(dir)
			return true
	elif collider.is_in_group("plate"):
		transition(dir)
		return true
	elif collider.is_in_group("hole"):
		# delete hole and replace hole with passable tile
		transition(dir)
		collider.queue_free()
		sprite.texture = sunken_box
		collision_shape.disabled = true
		self.top_level = false
		return true
	return false

func transition(dir):
	var tween = create_tween()
	tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
	moving = true
	await tween.finished
	moving = false

func can_move(dir):
	return move(dir)
