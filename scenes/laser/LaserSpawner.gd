extends Spawner

func get_main_laser_count() -> int:
	return ._get_all_spawn_pos().size()

func _get_all_spawn_pos() -> Array:
	var spawn_pos = []
	for c in get_children():
		if c is Position2D:
			spawn_pos.append(c)
			for cc in c.get_children():
				if cc is Position2D:
					spawn_pos.append(cc)
	return spawn_pos

func duplicate_laser_spawn(gap: int):
	for spawn in ._get_all_spawn_pos():
		if spawn.get_child_count() > 0: # Support only one duplicate for now
			continue
		
		var new_spawn = Position2D.new()
		spawn.add_child(new_spawn)
		
		new_spawn.position.x += gap
		spawn.position.x -= gap / 2

func delete_duplicate_laser_spawn(gap: int):
	for spawn in ._get_all_spawn_pos():
		if spawn.get_child_count() > 0:
			for c in spawn.get_children():
				spawn.remove_child(c)
			spawn.position.x += gap / 2


func add_laser_spawn():
	var new_spawn = Position2D.new()
	add_child(new_spawn)
	return new_spawn
