extends HurtBox

var player: PlayerShip

func _on_Shield_tree_exited():
	player.has_shield = false
	player.toggle_hurtbox()
