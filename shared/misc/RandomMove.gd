extends Node2D

class_name RandomMove

export var node_path: NodePath
onready var node := get_node(node_path)

onready var collision := $CollisionShape2D

func _ready():
	move()

func move():
	var rect_shape = collision.shape as RectangleShape2D
	var rand_local_pos = Vector2(
		Random.random_int(0, rect_shape.extents.x * 2),
		Random.random_int(0, rect_shape.extents.y * 2)
	)
	var start_pos = collision.global_position
	start_pos.x -= rect_shape.extents.x
	start_pos.y -= rect_shape.extents.y
	
	node.global_position = start_pos + rand_local_pos
