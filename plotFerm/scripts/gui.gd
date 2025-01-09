extends Control

@onready var hud = $HUD
@onready var levels = $Levels
@onready var settings = $Settings
@onready var mobile_option = $Mobile_Option
@onready var clicksfx = $clicksfx

func _on_start_pressed():
	levels.show()
	hud.hide()
	clicksfx.play()
	pass # Replace with function body.


func _on_back_pressed():
	levels.hide()
	settings.hide()
	hud.show()
	clicksfx.play()
	pass # Replace with function body.


func _on_tutorial_pressed():
	clicksfx.play()
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	pass # Replace with function body.


func _on_level_01_pressed():
	clicksfx.play()
	get_tree().change_scene_to_file("res://scenes/level_02.tscn")
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


func _on_settings_pressed():
	settings.show()
	hud.hide()
	clicksfx.play()
	pass # Replace with function body.


func _on_check_box_toggled(toggled_on):
	if Main.mobile_player == true:
		$Settings/CheckBox.button_pressed = true
	else:
		$Settings/CheckBox.button_pressed = false
	if toggled_on:
		Main.mobile_player = true
	else: 
		Main.mobile_player = false
	pass # Replace with function body.
