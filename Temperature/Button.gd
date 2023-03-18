extends Node2D

signal button_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass; # Replace with function body.

var isActivated:bool = false


func _input(event):
	pass;

func _physics_process(delta):
	if (Input.is_mouse_button_pressed(1)):
		isActivated = true
		increase_charge();
		
	if (!Input.is_mouse_button_pressed(1) and isActivated):
		emit_signal("button_pressed")
		isActivated = false
		PlayerVariables.CHARGE = 0;
		
	
func increase_charge() -> void:
	if (PlayerVariables.CHARGE > PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE = PlayerVariables.CHARGE_LIMIT;
	elif (PlayerVariables.CHARGE < PlayerVariables.CHARGE_LIMIT):
		PlayerVariables.CHARGE += 6;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
