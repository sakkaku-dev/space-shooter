extends Node2D


func _on_Health_zero_health():
	queue_free()
