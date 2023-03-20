extends Area2D

"""
When clicked on,
can be moved around the screen
"""

var previous_mouse_position = Vector2()
var is_dragging = false
onready var viewport = get_parent().get_node("Viewport")
onready var dropzone = get_parent().get_node("DropZone")
onready var button = get_parent().get_node("Temperature/Button")

func _ready():
	#dropzone.item_dropped.connect("_on_DropZone_item_dropped")
	button.connect("button_pressed", self, "_on_Button_pressed")
	dropzone.connect("item_dropped", self, "_on_DropZone_item_dropped")
	$AnimationCooking.play("Spawning")

func _on_Draggable_input_event(viewport, event, shape_idx):
	
	"""
	Allows dragging if the user clicks inside
	the collision shape
	"""
	
	if event.is_action_pressed("ui_touch") and self.is_in_group("draggable"):
		print(event)
		get_tree().set_input_as_handled()
		previous_mouse_position = event.position
		print(event.position)
		is_dragging = true


func _input(event):
	
	"""
	Works globally so dragging works if
	mouse cursor is outside of Collision Shape
	Disables dragging if the user releases click
	"""
	
	if not is_dragging:
		return
	
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
	
	
	if is_dragging and event is InputEventMouseMotion:
		var new_position = position + event.position - previous_mouse_position
		
		# Get the size of the viewport
		var viewport_size = get_viewport().get_size()
		
		# Clamp the new position to the viewport size
		new_position.x = clamp(new_position.x, 0, viewport_size.x - 30)
		new_position.y = clamp(new_position.y, 0, viewport_size.y - 30)
		
		# Set the new position
		position = new_position
		
		previous_mouse_position = event.position
		
func _process(delta):
	var texture
	if(is_instance_valid(viewport)):
		texture = viewport.get_texture()
	if(is_instance_valid($Screen)):
		$Screen.texture = texture


func _on_Button_pressed():
	$AnimationCooking.play("Cook")
	
func doneCooking():
	$AnimationCooking.play("DoneCooking")
