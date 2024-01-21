extends Node

var player
export(PackedScene) var Bullet:PackedScene = preload("res://scene/bullet.tscn")

var elapsed_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	var required_elapsed
	if player.equipped_weapon == "pistol":
		required_elapsed = 0.1
	elif player.equipped_weapon == "ak":
		required_elapsed = 0.2
		
	if Input.is_action_just_pressed("fire") && elapsed_time >= required_elapsed:
		shoot()
		elapsed_time = 0
	elif Input.is_action_pressed("fire") && player.equipped_weapon == "ak" && elapsed_time >= required_elapsed:
		shoot()
		elapsed_time = 0

func shoot():
	var bullet = Bullet.instance()
	owner.add_child(bullet)
	bullet.fire(player.position, player.facing_direction)
	
