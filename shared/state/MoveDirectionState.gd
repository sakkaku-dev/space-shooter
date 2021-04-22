extends State

class_name MoveDirectionState

export var speed = 100
export var direction = Vector2.UP

export var body_path: NodePath
onready var body: Node2D = get_node(body_path)

func _physics_process(delta):
	body.global_translate(direction * speed * delta)
