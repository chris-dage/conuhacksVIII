extends Area2D

var player
var facing
var bullet_speed = 7
# Called when the node enters the scene tree for the first time.
	
func fire(fired_position, facing_direction):
	position = fired_position
	facing = facing_direction

func _process(delta):
	position += facing * bullet_speed


func _on_Bullet_body_entered(body):
	if body.is_in_group("zombies"):
		body.get_node("ZombieScript").take_damage()
		queue_free()
