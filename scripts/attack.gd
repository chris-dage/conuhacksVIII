extends Node

enum GunType {
	PISTOL,
	AK47,
	SHOTGUN
}

class_name Attack

# Bullet properties
var bullet_speeds = {
	GunType.PISTOL: 700,
	GunType.AK47: 500,
	GunType.SHOTGUN: 400
}

var bullet_damages = {
	GunType.PISTOL: 10,
	GunType.AK47: 15,
	GunType.SHOTGUN: 20
}

var bullet_spreads = {
	GunType.PISTOL: 0,
	GunType.AK47: 5,
	GunType.SHOTGUN: 20
}

# Timer properties
var shoot_interval = 0.5
var can_shoot = true

var gun_type = GunType.PISTOL  # Default gun type

var gun_instances = {
	GunType.PISTOL: load("res://scene/warehouse.tscn"),
	GunType.AK47: load("res://scene/warehouse.tscn"),
	GunType.SHOTGUN: load("res://scene/warehouse.tscn")
}

func _ready():
	pass  # Initialization logic goes here

func _process(delta):
	handle_shooting()

	# Keystroke detector for switching weapons
	if Input.is_action_just_pressed("switch_weapon_1"):
		gun_type = GunType.PISTOL
	elif Input.is_action_just_pressed("switch_weapon_2"):
		gun_type = GunType.AK47
	elif Input.is_action_just_pressed("switch_weapon_3"):
		gun_type = GunType.SHOTGUN

func handle_shooting():
	if can_shoot and Input.is_action_pressed("fire"):
		spawn_bullet()
		can_shoot = false
		$Timer.start(shoot_interval)

func _on_Timer_timeout():
	can_shoot = true

func spawn_bullet():
	var gun_instance = gun_instances[gun_type].instance()
	gun_instance.position = $GunPosition.global_position

	var bullet_speed = bullet_speeds[gun_type]
	var bullet_damage = bullet_damages[gun_type]
	var bullet_spread = bullet_spreads[gun_type]

	# Check if the spawned instance has the setup_bullet_properties method
	if "setup_bullet_properties" in gun_instance:
		# Pass gun properties to the gun instance
		gun_instance.setup_bullet_properties(bullet_speed, bullet_damage, bullet_spread)

		# Add the gun instance to the scene
		get_tree().current_scene.add_child(gun_instance)
	else:
		print("Error: setup_bullet_properties method not found in gun_instance.")
