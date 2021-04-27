extends HitBox

export var split = false

func _on_LaserBall_area_entered(area):
	if not split: return
	
	var pos = area.global_position
	var angle = 360 / 5
	
	for i in range(0, 5):
		var new_laser = duplicate()
		get_tree().current_scene.call_deferred("add_child", new_laser)
		new_laser.global_position = pos
		new_laser.global_rotation_degrees = area.global_rotation_degrees + (angle * i)
		new_laser.split = false
