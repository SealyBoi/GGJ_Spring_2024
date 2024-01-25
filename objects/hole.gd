extends StaticBody2D

@export var holes: Array[Texture]

func _ready():
	$Sprite2D.texture = holes.pick_random()
