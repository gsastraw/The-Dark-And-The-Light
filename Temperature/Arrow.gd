extends KinematicBody2D
var speed = 350
var direction_right = Vector2(1, 0)
var direction_left = Vector2(-1, 0)
var velocity

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
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
