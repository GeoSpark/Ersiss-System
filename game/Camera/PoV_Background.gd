extends Viewport

var pov
var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = $Camera

func _process(_delta):
	camera.global_transform.basis = pov.global_transform.basis
	camera.global_transform.origin = pov.global_transform.origin / 1000000