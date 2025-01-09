extends Area2D

@onready var timer = $Timer
@onready var dedsound = $dedsound


func _on_body_entered(body):
	dedsound.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").set_deferred("disabled", true)
	timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	Engine.time_scale = 1
	pass # Replace with function body.
