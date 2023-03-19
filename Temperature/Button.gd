extends Area2D
signal button_pressed


var isActivated:bool = false
var hold_timer: float = 0
var hold_time_required: float = 0.5


onready var collision = $CollisionShape2D
onready var sprite = $Sprite

func _ready():
	disable_button(true)

func disable_button(var option:bool):
	collision.disabled = option

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
			disable_button(true)
			
	
func increase_charge() -> void:
	if (PlayerVariables.CHARGE > PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE = PlayerVariables.CHARGE_LIMIT;
	elif (PlayerVariables.CHARGE < PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE += 6;


func _on_Arrow_arrow_reseted():
	if(PlayerVariables.CURRENTLY_GRILLING):
		disable_button(false) # this needs to be changed to sync with steaks instead
