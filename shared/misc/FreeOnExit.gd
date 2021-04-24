extends VisibilityNotifier2D

export var obj_path: NodePath
onready var obj: Node = get_node(obj_path)

func _on_FreeOnExit_screen_exited():
	obj.queue_free()

