extends Node2D

const Movement = preload("res://scripts/player_movement.gd")
var movement:Movement = Movement.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement.move(self)
