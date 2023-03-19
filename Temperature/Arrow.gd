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
	PlayerVariables.ARROW_POS_LOW = global_position.x

func _physics_process(delta):
	# velocity = velocity * speed
	
	var collision_info = move_and_collide(velocity * speed * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		
	PlayerVariables.ARROW_POS = global_position.x
	PlayerVariables.LIGHT_LEVEL_GRILL = PlayerVariables.ARROW_POS / 750
	
	if (speed > 0):
		speed -= 2.5
	if (speed <= 0 and shot):
		shot = false
		if (global_position.x > PlayerVariables.LOWRANGE and global_position.x < PlayerVariables.HIGHRANGE):
			success()
		else:
			failure()
		reset_arrow()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_pressed():
	speed = PlayerVariables.CHARGE
	shot = true

func success():
	print("SUCCESS")
	PlayerVariables.SCORE += 1
	emit_signal("arrow_succeeded")
	PlayerVariables.CURRENTLY_GRILLING = false
	get_parent().get_node("AudioSuccess").play()

func failure():
	PlayerVariables.LIVES -= 1
	if(PlayerVariables.LIVES <= 0):
		get_tree().change_scene("res://Level/Deathscreen.tscn")



func reset_arrow():
	# $AudioOvercooked.play()
	speed = 0
	emit_signal("arrow_reseted")
	velocity = direction_right
	PlayerVariables.LIGHT_LEVEL_GRILL = 0
	self.position = og_position
