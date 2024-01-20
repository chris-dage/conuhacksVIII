extends Node

class_name Pistol

var bullet_speed = 0
var bullet_damage = 0
var bullet_spread = 0

func setup_bullet_properties(speed, damage, spread):
	bullet_speed = speed
	bullet_damage = damage
	bullet_spread = spread
