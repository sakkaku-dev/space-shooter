extends Node

export var laser_gap = 50

func handle(ship: PlayerShip) -> void:
	ship.laser.duplicate_laser_spawn(laser_gap)


func restore(ship: PlayerShip) -> void:
	ship.laser.delete_duplicate_laser_spawn(laser_gap)
