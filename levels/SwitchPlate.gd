extends StaticBody2D

@export var gatePaths: Array[NodePath] = []
@export var start_open = false
var gates: Array

var is_active = false

func _ready():
	if start_open:
		call_deferred("_toggle_gate")
	gates = loadGates()

func loadGates() -> Array:
	var paths = []
	for gatePath in gatePaths:
		var path = get_node(gatePath)
		if path != null:
			paths.append(path)
	return paths

func _on_area_2d_area_entered(_area):
	call_deferred("_toggle_gate")

func _on_area_2d_body_entered(_body):
	call_deferred("_toggle_gate")

func _toggle_gate():
	is_active = not is_active
	if is_active:
		for gate in gates:
			gate.open_gate()
	else:
		for gate in gates:
			gate.close_gate()
