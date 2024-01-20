extends Node2D

# Properties
var speed = 100
var attack_range = 50
var player = null
var detection_range = 200
var health = 100
var damage = 10

# Callbacks
func take_damage(amount):
	health -= amount
	if health <= 0:
		die()

func die():
	# Implement logic for zombie death
	queue_free()

func _on_Zombie_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		attack_player()

# Behaviors
func wander():
	var random_direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	position += random_direction * speed
	update_appearance(random_direction)

func attack_player():
	# Implement the logic for zombie attacking the player
	# For example, reduce player health or trigger game over
	print("Zombie attacks player!")

# Example: Update the zombie appearance
func update_appearance(direction):
	# Modify the appearance of the zombie based on the movement direction
	# You can customize this part according to your needs
	if direction.x > 0:
		# Set appearance for moving right
		print("Moving right")
	elif direction.x < 0:
		# Set appearance for moving left
		print("Moving left")
	elif direction.y > 0:
		# Set appearance for moving up
		print("Moving up")
	elif direction.y < 0:
		# Set appearance for moving down
		print("Moving down")

# Example: Detect and follow the player
func _process(delta):
	if player and position.distance_to(player.position) < detection_range:
		follow_player(player, delta)
	else:
		wander()

# New Function: Follow the player
func follow_player(target_player, delta):
	var direction = (target_player.position - position).normalized()
	position += direction * speed * delta
	update_appearance(direction)
