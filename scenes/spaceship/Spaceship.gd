extends KinematicBody2D

onready var input = $PlayerInput
onready var spawner = $LaserSpawner

func _input(event):
	input.handle_input(event)

func _process(delta):
	spawner.set_spawn(input.is_pressed("shoot"))
