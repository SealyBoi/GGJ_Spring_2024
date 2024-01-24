extends StaticBody2D

@onready var gate_closed = preload("res://art/crate.png")
@onready var gate_open = preload("res://art/sunken_box.png")
var is_open = false

func open_gate():
	get_node("CollisionShape2D").disabled = true
	get_node("Sprite2D").texture = gate_open

func close_gate():
	get_node("CollisionShape2D").disabled = false
	get_node("Sprite2D").texture = gate_closed

func toggle_gate():
	if is_open:
		close_gate()
	else:
		open_gate()
	is_open = not is_open
