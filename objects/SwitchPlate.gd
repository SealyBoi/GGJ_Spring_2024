extends StaticBody2D

@export var gatePaths: Array[NodePath] = []
@export var start_open: Array[bool] = []
@onready var audio = $AudioStreamPlayer2D
var gates: Array

func _ready():
	gates = loadGates()
	var i = 0
	for gate in gates:
		if start_open[i]:
			call_deferred("_toggle_gate", gate)
		i = i + 1

func loadGates() -> Array:
	var paths = []
	for gatePath in gatePaths:
		var path = get_node(gatePath)
		if path != null:
			paths.append(path)
	return paths

func _on_area_2d_area_entered(_area):
	call_deferred("_toggle_all_gates")

func _on_area_2d_body_entered(_body):
	call_deferred("_toggle_all_gates")

func _toggle_gate(gate):
	gate.toggle_gate()

func _toggle_all_gates():
	audio.play()
	for gate in gates:
		gate.toggle_gate()
