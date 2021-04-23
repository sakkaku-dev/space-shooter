extends State

class_name MoveForwardState

export var speed = 100

export var body_path: NodePath
onready var body: Node2D = get_node(body_path)

func _physics_process(delta):
	if body:
		body.move_local_y(-speed * delta)
