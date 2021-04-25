extends Node

func handle(ship: PlayerShip) -> void:
	if ship.health.is_full_health():
		ship.health.max_health += 1
	ship.health.increase(1)
