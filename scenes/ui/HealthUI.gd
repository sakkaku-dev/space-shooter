extends HBoxContainer

onready var health_label := $Label

func set_health(health: int) -> void:
	health_label.text = str(health)
