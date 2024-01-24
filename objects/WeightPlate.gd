extends StaticBody2D

@export var gatePaths: Array[NodePath] = []
var gates: Array

func _ready():
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

func _on_area_2d_area_exited(_area):
	call_deferred("_toggle_gate")

func _on_area_2d_body_entered(_body):
	call_deferred("_toggle_gate")

func _on_area_2d_body_exited(_body):
	call_deferred("_toggle_gate")

func _toggle_gate():
	for gate in gates:
		gate.toggle_gate()
