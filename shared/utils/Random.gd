extends Node

class_name Random

static func random_int(min_value: int, max_value: int) -> int:
	return (randi() % max_value) + min_value