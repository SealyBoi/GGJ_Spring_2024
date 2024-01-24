extends StaticBody2D

@onready var gate_closed = preload("res://art/crate.png")
@onready var gate_open = preload("res://art/sunken_box.png")

func open_gate():
	get_node("CollisionShape2D").disabled = true
	get_node("Sprite2D").texture = gate_open

func close_gate():
	get_node("CollisionShape2D").disabled = false
	get_node("Sprite2D").texture = gate_closed
