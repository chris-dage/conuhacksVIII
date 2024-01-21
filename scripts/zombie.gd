extends Node

var player
var target
var zombie

var target_position
var zombie_position
var player_position

var health = 3

func _ready():
	set_process(true)
	player = get_node("../../Player")
	zombie = get_parent()
	
func _process(delta):
	move_towards_target()
	if Input.is_key_pressed(KEY_Y):
		take_damage()

func move_towards_target():
	player_position = player.position
	target_position = (player_position - zombie.position).normalized()
	zombie.move_and_collide(target_position)
	
func take_damage():
	health -= 1
	if health <= 0:
		die()

func die():
	zombie.queue_free()
