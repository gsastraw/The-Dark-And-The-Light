extends Node2D
var held_object = null
var meat_on_grill = null
var light_level: float = 0;
var steak = preload("res://Draggable.tscn")

onready var grillItem = $Draggable/Screen
onready var arrow = get_node("Temperature/Arrow")
onready var button = get_node("Temperature/Button")
var instance


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.LIVES = 3
	PlayerVariables.SCORE = 0
	spawnGrillItem()
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")
	
	arrow.connect("arrow_succeeded", self, "_on_arrow_success")
	button.connect("button_pressed", self, "_on_Button_pressed")


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
	$LivesUI/LabelNumber.text = str(PlayerVariables.LIVES)
	$Lighting.set_energy(PlayerVariables.LIGHT_LEVEL_GRILL)
	
	var texture
	if(is_instance_valid($ViewportPlate)):
		texture = $ViewportPlate.get_texture()
	if(is_instance_valid($ScreenPlate)):
		$ScreenPlate.texture = texture


func _on_DropZone_item_dropped():
	$Temperature/Button.disable_button(false)
	PlayerVariables.CURRENTLY_GRILLING = true
	var lul = 0
	while PlayerVariables.CURRENTLY_GRILLING:
		yield(get_tree().create_timer(0.1), "timeout")
		print(PlayerVariables.ARROW_POS)
	
func spawnGrillItem():
	instance = steak.instance()
	get_tree().get_root().get_child(1).add_child(instance)
	instance.global_position = $Spawnpoint.global_position

func _on_arrow_success():
	instance.queue_free()
	$AudioGrilling.stop()
	spawnGrillItem()

func _on_Button_pressed():	
		$AudioGrilling.play()
	# add_child(instance)
	
