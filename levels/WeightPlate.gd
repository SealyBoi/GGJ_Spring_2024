extends StaticBody2D

@export var gate: StaticBody2D

var is_active = false

func _on_area_2d_area_entered(_area):
	call_deferred("_toggle_gate")

func _on_area_2d_area_exited(_area):
	call_deferred("_toggle_gate")

func _on_area_2d_body_entered(_body):
	call_deferred("_toggle_gate")

func _on_area_2d_body_exited(_body):
	call_deferred("_toggle_gate")

func _toggle_gate():
	is_active = not is_active
	if is_active:
		gate.open_gate()
	else:
		gate.close_gate()
