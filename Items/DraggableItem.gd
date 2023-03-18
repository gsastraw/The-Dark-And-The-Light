class_name DraggableItem
extends KinematicBody2D

var is_dragged = false;
var drag_offset: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				drag_offset = self.position - event.position;
				set_physics_process(true);
			else:
				set_physics_process(false);

func _physics_process(delta):
	self.global_position = get_global_mouse_position() + drag_offset;
