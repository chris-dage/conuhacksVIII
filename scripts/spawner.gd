extends Node2D

var preloadedZombie = preload("res://scene/rashed.tscn")

onready var spawnTimer := $SpawnTimer

var nextSpawnTime := 2.0

func _ready():
	spawnTimer.start(nextSpawnTime)

func _on_SpawnTimer_timeout():
	# Spawn an enemy
	var viewRect := get_viewport_rect()
	var xPos := rand_range(viewRect.position.x, viewRect.end.x)
	var enemy = preloadedZombie.instance(preloadedZombie)
	enemy.position = Vector2(xPos, position.y)
	get_tree().current_scene.add_child(enemy)
	
	# Restart timer
	spawnTimer.start(nextSpawnTime)
