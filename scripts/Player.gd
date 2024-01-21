extends KinematicBody2D

var equipped_weapon
var facing_direction = Vector2(0, 1)
var score = 0
var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	get_node("../UI Canvas").get_node("Health").text = "Health: " + String(health)
	get_node("../UI Canvas").get_node("Score").text = "Score: " + String(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func take_damage():
	
	health -= 1
	get_node("../UI Canvas").get_node("Health").text = "Health: " + String(health)
	if health <= 0:
		get_tree().change_scene("res://scene/gameover.tscn")
