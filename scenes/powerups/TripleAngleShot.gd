extends Node

export var pos = Vector2(10, 2)
export var laser_rotation = 15

var new_spawns = []

func handle(ship: PlayerShip) -> void:
	if ship.laser.get_main_laser_count() >= 3: return
	
	var new_spawn_left = ship.laser.add_laser_spawn()
	new_spawn_left.position += Vector2(-pos.x, pos.y)
	new_spawn_left.rotation_degrees = -laser_rotation
	new_spawns.append(new_spawn_left)
	
	var new_spawn_right = ship.laser.add_laser_spawn()
	new_spawn_right.position += pos
	new_spawn_right.rotation_degrees = laser_rotation
	new_spawns.append(new_spawn_right)

func restore(ship: PlayerShip) -> void:
	for spawn in new_spawns:
		spawn.queue_free()
