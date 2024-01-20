extends Node

class_name AK47

var bullet_scene = load("res://scene/warehouse.tscn")
var bullet_speed = 0
var bullet_damage = 0
var bullet_spread = 0

func setup_bullet_properties(speed, damage, spread):
	bullet_speed = speed
	bullet_damage = damage
	bullet_spread = spread

var shoot_interval = 0.1
var can_shoot = true

func _process(_delta):
	handle_shooting()

func handle_shooting():
	if can_shoot and Input.is_action_pressed("fire"):
		spawn_bullet()
		can_shoot = false
		$Timer.start(shoot_interval)

func _on_Timer_timeout(_delta):
	can_shoot = true

func spawn_bullet():
	var bullet_instance = bullet_scene.instance()
	
	# Use the parent node's global position
	bullet_instance.position = get_parent().global_position

	var bullet_speed_local = bullet_speed
	var bullet_damage_local = bullet_damage
	var bullet_spread_local = bullet_spread

	# Rotate the bullet randomly based on spread for AK47
	bullet_instance.rotation_degrees += rand_range(-bullet_spread_local, bullet_spread_local)

	# Set bullet properties
	bullet_instance.set_bullet_properties(bullet_speed_local, bullet_damage_local)

	# Add the bullet to the scene
	get_tree().get_root().add_child(bullet_instance)
