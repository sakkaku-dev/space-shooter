extends Area2D

signal pick
signal picked_up(player)
signal powerup_timeout(player)

export var powerup_time = 0

onready var timer := $Timer
onready var free_on_exit := $FreeOnExit

var picked = false
var player

func _on_Powerup_area_entered(area):
	player = area
	if not player: return
	
	emit_signal("pick")
	emit_signal("picked_up", player)
	
	if powerup_time > 0:
		picked = true
		timer.start(powerup_time)
		hide()
		free_on_exit.enabled = false
	else:
		queue_free()


func _on_Timer_timeout():
	if not player: return
	
	emit_signal("powerup_timeout", player)
	queue_free()
