extends Node2D

export var kill_score = 5

onready var move_forward = $MoveForwardState

var explosion = preload("res://scenes/explosion/Explosion.tscn")

func _on_Health_zero_health():
	Globals.enemy_kill_score += kill_score
	var instance = explosion.instance()
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position
	queue_free()

func set_speed(speed) -> void:
	move_forward.speed = speed
