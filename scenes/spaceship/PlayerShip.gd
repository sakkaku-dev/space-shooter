extends Node2D

class_name PlayerShip

signal died
signal health_changed

onready var health: Health = $Health
onready var laser = $Spaceship/LaserSpawner
onready var hurtbox = $Spaceship/CollisionShape2D
onready var follow_state = $MouseFollowState

var has_shield

func _on_Health_zero_health():
	emit_signal("died")
	queue_free()

func toggle_hurtbox():
	hurtbox.set_deferred("disabled", not hurtbox.disabled)


func change_laser_type(new_laser_scene: PackedScene) -> void:
	laser.scene[0] = new_laser_scene


func _on_Health_health_changed(hp):
	emit_signal("health_changed", hp)
