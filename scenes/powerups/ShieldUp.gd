extends Node

var shield = preload("res://scenes/powerups/Shield.tscn")
var instance

func handle(ship: PlayerShip) -> void:
	if ship.has_shield: return

	instance = shield.instance()
	instance.player = ship
	ship.add_child(instance)
	ship.has_shield = true
	ship.toggle_hurtbox()

func restore(ship: PlayerShip) -> void:
	instance.queue_free()
