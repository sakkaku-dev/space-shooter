extends Node2D

onready var spawner = $SpawnerRandom/Spawner
onready var powerup_spawner = $SpawnerRandom/PowerUpSpawner
onready var player_ship = $PlayerShip
onready var menu = $Menu/GUI
onready var enemy_delay = $EnemyDelay
onready var powerup_delay = $PowerupDelay

func start_game():
	player_ship.show()
	player_ship.set_shoot(true)
	player_ship.set_follow(true)
	menu.hide()
	enemy_delay.start()
	powerup_delay.start()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_PlayerShip_died():
	spawner.set_spawn(false)
	powerup_spawner.set_spawn(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_StartDelay_timeout():
	spawner.set_spawn(true)


func _on_PowerupDelay_timeout():
	powerup_spawner.set_spawn(true)
