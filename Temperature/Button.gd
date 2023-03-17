extends Node2D

# Hold down left click within the collision, should then increase static value from 1-100
const CHARGE_LIMIT = PlayerVariables.CHARGE_LIMIT;
var charge: int = PlayerVariables.CHARGE;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.

func _input(event):
	pass;

func _physics_process(delta):
	if (Input.is_mouse_button_pressed(1)):
		increase_charge();
		
	if (!Input.is_mouse_button_pressed(1)):
		charge = 0;
	
func increase_charge():
	if (charge > CHARGE_LIMIT):
		charge = CHARGE_LIMIT;
	elif (charge < CHARGE_LIMIT):
		charge += 1;
	
	print(charge)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
