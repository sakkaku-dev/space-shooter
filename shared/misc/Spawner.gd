extends Position2D

signal spawned

export(Array, PackedScene) var scene: Array
export var spawn_delay = 1.0
export var spawn = false

onready var timer = $Timer

var can_spawn = true

func set_spawn(value):
	spawn = value

func _process(delta):
	if spawn and can_spawn:
		_spawn()

func _spawn():
	var instance = scene[Random.random_int(0, scene.size())].instance()
	get_tree().current_scene.add_child(instance)
	instance.global_transform = global_transform
	instance.rotation = rotation
	emit_signal("spawned")
	
	can_spawn = false
	timer.start(spawn_delay)


func _on_Timer_timeout():
	can_spawn = true
