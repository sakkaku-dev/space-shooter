extends Node2D

onready var spawner = $SpawnerRandom/Spawner
onready var powerup_spawner = $SpawnerRandom/PowerUpSpawner

onready var enemy_delay = $EnemyDelay
onready var powerup_delay = $PowerupDelay
onready var wait_clear = $WaitClear

onready var health = $UI/MarginContainer/HBoxContainer/HealthUI
onready var score = $UI/MarginContainer/HBoxContainer/Score
onready var main_menu = $Menu/GUI/MainMenu
onready var game_over = $Menu/GUI/MainMenu/Gameover
onready var score_table = $Menu/GUI/Scoreboard/ScoreTable

onready var game_over_sound = $GameOverSound
onready var bgm = $BGM

var player_ship_scene = preload("res://scenes/spaceship/PlayerShip.tscn")
var time = 0
var started = false
var decreased = false

func _ready():
	main_menu.show()
	game_over.hide()

func _process(delta):
	if started:
		time += delta
		score.text = str(_get_score())
		
		_decrease_spawn(spawner, 1)
		_decrease_spawn(powerup_spawner, 3)

		if get_viewport_rect().has_point(get_global_mouse_position()):
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _decrease_spawn(spawn: Spawner, min_value: int) -> void:
	if int(time) % 50 == 0:
		if not decreased:
			spawn.spawn_delay -= 0.2
			spawn.spawn_delay = max(min_value, spawn.spawn_delay)
			decreased = true
	else:
		decreased = false


func _get_score():
	return Globals.enemy_kill_score + int(time / 5.0)


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
	Globals.enemy_kill_score = 0
	started = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	bgm.play()


func _on_PlayerShip_died():
	enemy_delay.stop()
	powerup_delay.stop()
	spawner.set_spawn(false)
	powerup_spawner.set_spawn(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	main_menu.show()
	game_over.show()
	game_over_sound.play()
	started = false
	score_table.score = _get_score()
	score_table.load_scores()
	bgm.stop()


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
