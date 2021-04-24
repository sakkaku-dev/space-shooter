extends Node2D

signal died

func _on_Health_zero_health():
	emit_signal("died")
	queue_free()
