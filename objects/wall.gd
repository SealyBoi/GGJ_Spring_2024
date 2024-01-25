extends StaticBody2D

@export var walls: Array[Texture]

func _ready():
	$Sprite2D.texture = walls.pick_random()
