extends Spatial

var initial_position = Vector2.ZERO

func _ready():
	get_viewport().connect("input_event", self, "_input");

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			initial_position = translation
		else:
			initial_position = Vector2.ZERO
	elif event is InputEventMouseMotion and event.button_mask == BUTTON_LEFT:
		var new_position = initial_position + Vector2(event.relative.x, event.relative.y)
		translation = Vector3(new_position.x, new_position.y, 0)
