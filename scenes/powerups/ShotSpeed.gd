extends Node

export var min_delay = 0.1

func handle(ship: PlayerShip) -> void:
	if ship.laser.spawn_delay <= min_delay: return
	ship.laser.spawn_delay /= 2

func restore(ship: PlayerShip) -> void:
	ship.laser.spawn_delay *= 2
