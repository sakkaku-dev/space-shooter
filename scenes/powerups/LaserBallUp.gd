extends Node

var laser_ball = preload("res://scenes/laser/LaserBall.tscn")
var laser = preload("res://scenes/laser/Laser.tscn")

func handle(ship: PlayerShip) -> void:
	ship.change_laser_type(laser_ball)


func restore(ship: PlayerShip) -> void:
	ship.change_laser_type(laser)
