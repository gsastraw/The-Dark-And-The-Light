extends Spatial
export(PackedScene) var grillItem
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# add_child(grillItem)
	# grillItem.global_position = Vector3(0,0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DropZone_item_dropped():
	$AnimationCook.play("Cook")
