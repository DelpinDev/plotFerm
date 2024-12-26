extends Area2D

@onready var timer = $Timer
@onready var dedsound = $dedsound


func _on_body_entered(body):
	dedsound.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	pass # Replace with function body.
