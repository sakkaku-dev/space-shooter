extends Node2D


onready var spawner = $SpawnerRandom/Spawner
onready var powerup_spawner = $SpawnerRandom/PowerUpSpawner


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_PlayerShip_died():
	spawner.set_spawn(false)
	powerup_spawner.set_spawn(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
