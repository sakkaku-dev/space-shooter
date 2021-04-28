extends Node2D

class_name PlayerShip

signal died

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

func set_shoot(shoot: bool) -> void:
	laser.spawn = shoot

func set_follow(follow: bool) -> void:
	follow_state.follow = follow
