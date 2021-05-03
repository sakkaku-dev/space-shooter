extends Node2D

export var kill_score = 5

func _on_Health_zero_health():
	queue_free()
	Globals.enemy_kill_score += kill_score
