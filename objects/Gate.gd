extends StaticBody2D

@onready var sprite = $Sprite2D
var is_open = false

func open_gate():
	get_node("CollisionShape2D").disabled = true
	sprite.visible = false

func close_gate():
	get_node("CollisionShape2D").disabled = false
	sprite.visible = true

func toggle_gate():
	print(is_open)
	if is_open:
		close_gate()
	else:
		open_gate()
	is_open = not is_open
