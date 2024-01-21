extends Node

var currently_cycled_weapon = 0
var weapons:Array = [
	"pistol",
	"ak"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	var player = get_parent()
	player.equipped_weapon = weapons[currently_cycled_weapon]

func _process(delta):
	if Input.is_action_just_pressed("cycle_inventory"):
		cycle_weapon()

func cycle_weapon():
	var player = get_parent()
	if currently_cycled_weapon >= weapons.size() - 1:
		currently_cycled_weapon = 0
	else:
		currently_cycled_weapon += 1
	player.equipped_weapon = weapons[currently_cycled_weapon]
	print(player.equipped_weapon)
