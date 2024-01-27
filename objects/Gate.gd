extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var label = $Label
var is_open = false
var red = Color(1, 0, 0)
var green = Color(0, 1, 0)

func _ready():
	var letters = self.name.split()
	var text = ""
	for letter in letters:
		if letter.is_valid_int():
			text = text + letter
		elif letter == "_":
			text = text + "/"
		else:
			break
	label.text = text
	label.set("theme_override_colors/font_color", red)

func open_gate():
	get_node("CollisionShape2D").disabled = true
	sprite.visible = false
	label.set("theme_override_colors/font_color", green)

func close_gate():
	get_node("CollisionShape2D").disabled = false
	sprite.visible = true
	label.set("theme_override_colors/font_color", red)

func toggle_gate():
	if is_open:
		close_gate()
	else:
		open_gate()
	is_open = not is_open
