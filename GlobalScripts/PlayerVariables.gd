extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var CHARGE: int = 0;
const CHARGE_LIMIT: int = 1000;
var SCORE: int = 0;
var TEMPERATURE: float = 0;
var LOWRANGE
var HIGHRANGE
var ARROW_POS: float = 0;
var CURRENTLY_GRILLING: bool = false
var ARROW_POS_LOW: float = 0;
var ARROW_POS_HIGH: float = 0;
var LIGHT_LEVEL_GRILL: float = 0;
var LIVES  = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
