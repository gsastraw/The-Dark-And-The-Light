extends Node2D

# Hold down left click within the collision, should then increase static value from 1-100
const CHARGE_LIMIT: int = 150;
var charge: int = PlayerVariables.charge;
var isActivated: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.

func _input(event):
	pass;

func _physics_process(delta):
	if (Input.is_mouse_button_pressed(1)):
		isActivated = true;
		increase_charge(isActivated);
	
func increase_charge(isActivated: bool):
	if (charge > CHARGE_LIMIT):
		charge = CHARGE_LIMIT;
	elif (charge < CHARGE_LIMIT):
		charge += 1;
	
	print(charge)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
