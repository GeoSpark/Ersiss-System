extends Node

var data = """Capacity : {capacity} Ah
Amperage : {current} A
Voltage : {voltage} V"""

var max_capacity
var capacity
var current
var voltage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var p = capacity/max_capacity
	$Bar/Background/ColorRect.anchor_right = p
	$Bar/Background/Label.text = ("%.1f %%" % (p*100))
	$Legend/Label.text = data.format({
		"capacity":capacity, 
		"current":current, 
		"voltage":voltage,
		})
