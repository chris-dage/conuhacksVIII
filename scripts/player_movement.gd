extends Node

export(int) var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true) # Replace with function body.

func _process(delta):
	move(delta)

func move(delta):
	var player = get_parent()
	if Input.is_key_pressed(KEY_D):
		player.move_and_collide(Vector2(player.speed, 0))
	elif Input.is_key_pressed(KEY_A):
		player.move_and_collide(Vector2(-player.speed, 0)) 
	elif Input.is_key_pressed(KEY_W):
		player.move_and_collide(Vector2(0, -player.speed))
	elif Input.is_key_pressed(KEY_S):
		player.move_and_collide(Vector2(0, player.speed))
