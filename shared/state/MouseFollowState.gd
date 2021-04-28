extends Node

class_name MouseFollowState

export var follow = false

export var body_path: NodePath
onready var body: Node2D = get_node(body_path)

func _physics_process(delta):
	if follow:
		body.global_position = body.get_global_mouse_position()
