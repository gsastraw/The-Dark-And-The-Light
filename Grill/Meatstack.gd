extends Spatial
var steak = preload("res://Grill/FallingSteak.tscn")
var instance
onready var arrow = get_tree().get_root().get_child(1).get_node("Temperature/Arrow")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	arrow.connect("arrow_succeeded", self, "_on_arrow_success")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn_steak():
	instance = steak.instance()
	self.add_child(instance)
	instance.transform = $Spawnpoint.transform

func _on_arrow_success():
	spawn_steak()
