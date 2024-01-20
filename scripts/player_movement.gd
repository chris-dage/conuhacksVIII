extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(player, delta):
	if Input.is_key_pressed(KEY_D):
		player.move_and_collide(Vector2(player.speed, 0))
	elif Input.is_key_pressed(KEY_A):
		player.move_and_collide(Vector2(-player.speed, 0)) 
	elif Input.is_key_pressed(KEY_W):
		player.move_and_collide(Vector2(0, -player.speed))
	elif Input.is_key_pressed(KEY_S):
		player.move_and_collide(Vector2(0, player.speed))
