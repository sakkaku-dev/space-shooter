extends AnimatedSprite

onready var sound = $AudioStreamPlayer

func _ready():
	play()
	sound.play()

func clear():
	if sound.playing or is_playing():
		return
	
	queue_free()


func _on_Explosion_animation_finished():
	stop()
	hide()
	clear()
