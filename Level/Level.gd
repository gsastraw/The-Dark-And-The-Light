extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



func _process(delta):
	var texture = $Viewport.get_texture()
	$Position2D/Screen.texture = texture
	$ScoreUI/LabelNumber.text = str(PlayerVariables.SCORE)
