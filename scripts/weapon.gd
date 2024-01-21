extends Node

var player
export(PackedScene) var Bullet:PackedScene = preload("res://scene/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		shoot()
	pass

func shoot():
	var bullet = Bullet.instance()
	owner.add_child(bullet)
	bullet.fire(player.position, player.facing_direction)
	
