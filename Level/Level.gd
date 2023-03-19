extends Node2D
var held_object = null
var meat_on_grill = null
var light_level: float = 0;
var steak = preload("res://Draggable.tscn")

onready var grillItem = $Draggable/Screen


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnGrillItem()
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
	$ScoreUI/LabelNumber.text = str(PlayerVariables.SCORE)
	$Lighting.set_energy(PlayerVariables.LIGHT_LEVEL_GRILL)

func _on_DropZone_item_dropped():
	$Temperature/Button.disable_button(false)
	$AudioGrilling.play()
	meat_on_grill = true
	var lul = 0
	while meat_on_grill:
		yield(get_tree().create_timer(0.1), "timeout")
	# spawnGrillItem()
	spawnGrillItem()
	
func spawnGrillItem():
	var instance = steak.instance()
	get_tree().get_root().get_child(1).add_child(instance)
	instance.global_position = $Spawnpoint.global_position
	

	# add_child(instance)
	
