extends KinematicBody2D
signal arrow_succeeded
signal arrow_failed
signal arrow_reseted

var speed = 0
var direction_right = Vector2(1, 0)
var direction_left = Vector2(-1, 0)
var velocity
var shot:bool = false
var og_position = self.position

# Called when the node enters the scene tree for the first time.

func _ready():
	reset_arrow()

func _physics_process(delta):
	# velocity = velocity * speed
	
	var collision_info = move_and_collide(velocity * speed * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		
	
	if (speed > 0):
		speed -= 2.5
	if (speed <= 0 and shot):
		shot = false
		if (global_position.x > PlayerVariables.LOWRANGE and global_position.x < PlayerVariables.HIGHRANGE):
			print("SUCCESS")
			PlayerVariables.SCORE += 1
			emit_signal("arrow_succeeded")
		else:
			print("FAIL")
		reset_arrow()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_pressed():
	speed = PlayerVariables.CHARGE
	shot = true

func reset_arrow():
	emit_signal("arrow_reseted")
	velocity = direction_right
	self.position = og_position
