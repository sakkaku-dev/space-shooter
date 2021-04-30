extends Node2D

onready var spawner = $SpawnerRandom/Spawner
onready var powerup_spawner = $SpawnerRandom/PowerUpSpawner

onready var enemy_delay = $EnemyDelay
onready var powerup_delay = $PowerupDelay
onready var wait_clear = $WaitClear

onready var health = $UI/MarginContainer/HBoxContainer/HealthUI
onready var score = $UI/MarginContainer/HBoxContainer/Score
onready var main_menu = $Menu/GUI/MainMenu
onready var game_over = $Menu/GUI/GameOver

var player_ship_scene = preload("res://scenes/spaceship/PlayerShip.tscn")
var time = 0
var started = false

func _ready():
	main_menu.show()


func _process(delta):
	if started:
		time += delta
		score.text = str(_get_score())


func _get_score():
	return int(time / 5.0)


func spawn_player():
	var player_ship = player_ship_scene.instance()
	add_child(player_ship)
	player_ship.connect("died", self, "_on_PlayerShip_died")
	player_ship.connect("health_changed", health, "set_health")


func start_or_wait():
	main_menu.hide()
	if _is_screen_clear():
		start_game()
	else:
		wait_clear.start()


func start_game():
	spawn_player()
	enemy_delay.start()
	powerup_delay.start()
	time = 0
	started = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_PlayerShip_died():
	enemy_delay.stop()
	powerup_delay.stop()
	spawner.set_spawn(false)
	powerup_spawner.set_spawn(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	game_over.show()
	started = false


func _on_StartDelay_timeout():
	spawner.set_spawn(true)


func _on_PowerupDelay_timeout():
	powerup_spawner.set_spawn(true)


func _on_WaitClear_timeout():
	if _is_screen_clear():
		start_game()
	else:
		wait_clear.start()
	

func _is_screen_clear() -> bool:
	return get_tree().get_nodes_in_group("Enemy").size() == 0 and \
		get_tree().get_nodes_in_group("Powerup").size() == 0
