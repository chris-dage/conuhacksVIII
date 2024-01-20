extends Node2D

# Bullet properties
var speed: float = 500
var damage: int = 10

func _process(delta):
	# Move the bullet upwards (adjust this based on your game's orientation)
	set_position(Vector2(position.x, position.y - speed * delta))

	# Check if the bullet is outside the screen
	if position.y < -get_viewport_rect().size.y / 2:
		queue_free()  # Remove the bullet when it goes off-screen

func set_bullet_properties(speed_value, damage_value):
	# Set bullet properties
	speed = speed_value
	damage = damage_value

func set_position(new_position):
	# Manually set the position
	position = new_position
