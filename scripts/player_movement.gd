extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(player, delta):
	player.vel = Vector2()
	if Input.is_key_pressed(KEY_D):
		player.vel = Vector2(speed, 0)
	if Input.is_key_pressed(KEY_A):
		player.vel = Vector2(-speed, 0) 
	if Input.is_key_pressed(KEY_W):
		player.vel = Vector2(0, -speed) 
	if Input.is_key_pressed(KEY_S):
		player.vel = Vector2(0, speed) 
	player.translate(player.vel * delta) # changing node's position
