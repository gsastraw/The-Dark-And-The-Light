extends Node2D

# Normalize the length of the Bar.

onready var leftmost = $LeftMost
onready var rightmost = $RightMost
onready var rightMarker = $RangemarkerRight
onready var leftMarker = $RangemarkerLeft 

var rng = RandomNumberGenerator.new()
var difficulty_level = 0.7;
onready var distance = abs(leftmost.position.x - rightmost.position.x)

func _ready():
	# print(leftmost.position.x)
	# print(abs(leftmost.position.x))
	# leftmost.position.x - rightmost.position.x
	# leftmost.distance
	PlayerVariables.ARROW_POS_HIGH = rightmost.position.x
	print(PlayerVariables.ARROW_POS_HIGH)
	randomize_range(PlayerVariables.SCORE)

func randomize_range(score: int):
	# both markers are put at the most right position
	rightMarker.position = rightmost.position
	leftMarker.position = rightmost.position
	
	print(rightMarker.global_position)
	print(leftMarker.global_position)
	
	rng.randomize()
	var random1 = rng.randf_range(0,1.0)
	var random2 = rng.randf_range(0,1.0)
	var diff = abs(random1 - random2)
	print('random1')
	print(random1)
	print('random2')
	
	print(diff)
	
	while diff != difficulty_level:
		if diff == difficulty_level:
			break;
		elif diff < difficulty_level:
			if random1 + (difficulty_level - diff) / 2 > 1:
				random2 = 1
				random1 = 1 - difficulty_level
				break;
			else:
				random1 += (difficulty_level - diff) / 2
				random2 -= (difficulty_level - diff) / 2
				

		elif diff > difficulty_level:
			if random1 - (diff - difficulty_level) / 2 < 0:
				random2 = difficulty_level
				random1 = 0
				break;

			else:
				random1 -= (diff - difficulty_level) / 2
				random2 += (diff - difficulty_level) / 2
				
		
		random1 = clamp(random1, 0, 1)
		random2 = clamp(random2, 0, 1)
		
		if (abs(random1 - random2) == difficulty_level):
			break;

	var highValue = max(random1, random2)
	var lowValue = min(random1, random2)
	
	rightMarker.position.x = rightmost.position.x - distance*lowValue
	leftMarker.position.x = rightmost.position.x - distance*highValue
	PlayerVariables.HIGHRANGE = rightMarker.global_position.x
	PlayerVariables.LOWRANGE = leftMarker.global_position.x
	
	difficulty_level = clamp(difficulty_level - (PlayerVariables.SCORE as float / (80)), 0.3, 0.7);
	print(difficulty_level)

func _on_Arrow_arrow_succeeded():
	randomize_range(PlayerVariables.SCORE)
	
func increase_difficulty():
	pass;
