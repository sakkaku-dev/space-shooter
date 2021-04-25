extends Node2D

class_name PlayerShip

signal died

onready var health: Health = $Health
onready var laser = $Spaceship/LaserSpawner

func _on_Health_zero_health():
	emit_signal("died")
	queue_free()
