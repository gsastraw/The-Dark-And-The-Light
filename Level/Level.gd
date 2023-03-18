extends Node2D
var held_object = null

onready var grillItem = $Draggable/Screen


# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")


func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_speed())
			held_object = null


func _process(delta):
	var texture = $Viewport.get_texture()
	if(is_instance_valid(grillItem)):
		grillItem.texture = texture

	$ScoreUI/LabelNumber.text = str(PlayerVariables.SCORE)
