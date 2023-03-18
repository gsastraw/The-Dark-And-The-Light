extends Area2D
signal button_pressed

var isActivated:bool = false
var hold_timer: float = 0
var hold_time_required: float = 0.5

onready var sprite = $Sprite

func _process(delta: float) -> void:
	if (isActivated):
		increase_charge()
	sprite.rotation_degrees = PlayerVariables.CHARGE / 3
	
func _input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT):
		if (event.pressed and shape_idx == 0):
			isActivated = true
		elif (!event.pressed and isActivated):
			emit_signal("button_pressed")
			isActivated = false
			PlayerVariables.CHARGE = 0
	
func increase_charge() -> void:
	if (PlayerVariables.CHARGE > PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE = PlayerVariables.CHARGE_LIMIT;
	elif (PlayerVariables.CHARGE < PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE += 6;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
