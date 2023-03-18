extends Node2D

# Normalize the length of the Bar.

onready var leftmost = $LeftMost
onready var rightmost = $RightMost
onready var rightMarker = $RangemarkerRight
onready var leftMarker = $RangemarkerLeft 

var rng = RandomNumberGenerator.new()
onready var distance = abs(leftmost.position.x - rightmost.position.x)

func _ready():
	# print(leftmost.position.x)
	# print(abs(leftmost.position.x))
	# leftmost.position.x - rightmost.position.x
	# leftmost.distance
	
	randomize_range()

func randomize_range():
	# both markers are put at the most right position
	rightMarker.position = rightmost.position
	leftMarker.position = rightmost.position
	
	print(rightMarker.global_position)
	print(leftMarker.global_position)
	
	rng.randomize()
	var random1 = rng.randf_range(0.05,1.0)
	var random2 = rng.randf_range(0.05,1.0)
	
	while(abs(random1 - random2) < 0.05 ):
		if(random1 < 1):
			random1 += 0.01
		if(random2 > 0):
			random2 -= 0.01
	
	
	var highValue = max(random1, random2)
	
	var lowValue = min(random1, random2)
	
	
	
	rightMarker.position.x = rightmost.position.x - distance*lowValue
	leftMarker.position.x = rightmost.position.x - distance*highValue
	PlayerVariables.HIGHRANGE = rightMarker.global_position.x
	PlayerVariables.LOWRANGE = leftMarker.global_position.x
