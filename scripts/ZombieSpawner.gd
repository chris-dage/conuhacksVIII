extends Node2D

export(PackedScene) var Zombie:PackedScene = preload("res://scene/zombie.tscn")

var time_elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	if time_elapsed > 3:
		spawn()
		time_elapsed = 0

func spawn():
	var zombie = Zombie.instance()
	owner.add_child(zombie)
	zombie.get_node("ZombieScript").set_position(position)
	


