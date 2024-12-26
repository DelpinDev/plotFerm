extends Control

@onready var hud = $HUD
@onready var levels = $Levels
@onready var mobile_option = $Mobile_Option
@onready var clicksfx = $clicksfx

func _on_start_pressed():
	levels.show()
	hud.hide()
	clicksfx.play()
	pass # Replace with function body.


func _on_back_pressed():
	levels.hide()
	hud.show()
	clicksfx.play()
	pass # Replace with function body.


func _on_tutorial_pressed():
	clicksfx.play()
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	pass # Replace with function body.


func _on_level_01_pressed():
	clicksfx.play()
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")
	pass # Replace with function body.


func _on_computer_pressed():
	mobile_option.hide()
	hud.show()
	Main.mobile_player = false
	clicksfx.play()
	pass # Replace with function body.


func _on_mobile_pressed():
	mobile_option.hide()
	hud.show()
	Main.mobile_player = true
	clicksfx.play()
	pass # Replace with function body.
