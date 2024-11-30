extends Node2D

var velocidad = Vector2(650, 0)
var isFlip = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if isFlip:
		velocidad.x *= -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocidad * delta
	
