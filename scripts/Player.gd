extends KinematicBody2D

var equipped_weapon
var facing_direction = Vector2(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
