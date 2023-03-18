extends KinematicBody2D
signal arrow_succeeded

var speed = 0
var direction_right = Vector2(1, 0)
var direction_left = Vector2(-1, 0)
var velocity
var shot:bool = false

# Called when the node enters the scene tree for the first time.

func _ready():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction_right

func _physics_process(delta):
	# velocity = velocity * speed
	
	var collision_info = move_and_collide(velocity * speed * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		
	
	if (speed > 0):
		speed -= 2.5
	if (speed <= 0 and shot):
		shot = false
		print("Stopped. Checking range.")
		if (global_position.x > PlayerVariables.LOWRANGE and global_position.x < PlayerVariables.HIGHRANGE):
			print("SUCCESS")
			PlayerVariables.SCORE += 1
			emit_signal("arrow_succeeded")
		else:
			print("FAIL")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_pressed():
	speed = PlayerVariables.CHARGE
	shot = true
	print("Signal sent!!")
