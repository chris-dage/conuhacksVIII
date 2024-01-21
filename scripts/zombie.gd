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

func move_towards_target():
	player_position = player.position
	var target_vector:Vector2 = player_position - zombie.position
	target_position = target_vector.normalized()
	zombie.move_and_collide(target_position)

	if player_position.y < zombie.position.y:
		get_parent().get_node("AnimatedSprite").animation = "zombieup"
	elif player_position.y > zombie.position.y:
		get_parent().get_node("AnimatedSprite").animation = "zombiedown"

	
func take_damage():
	health -= 1
	if health <= 0:
		die()

func die():
	zombie.queue_free()
	
func set_position(spawn_position):
	zombie.position = spawn_position
