extends Node

class_name MouseFollowState

export var body_path: NodePath
onready var body: KinematicBody2D = get_node(body_path)

func _physics_process(delta):
	body.global_position = body.get_global_mouse_position()
