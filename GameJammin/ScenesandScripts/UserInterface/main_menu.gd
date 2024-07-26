extends Control

@export var startunselected : Texture 
@export var startselected : Texture 
@export var settingunselected : Texture 
@export var settingselected : Texture 
@export var creditunselected : Texture 
@export var creditselected : Texture 

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://ScenesandScripts/Levels/level_1.tscn")

func _on_button_mouse_entered_start():
	$TextureRect/Start/StartImage.texture = startselected

func _on_button_mouse_exited_start():
	$TextureRect/Start/StartImage.texture = startunselected

func _on_button_pressed_credits():
	pass 

func _on_button_mouse_entered_credits():
	$TextureRect/Credits/CreditsImage.texture = creditselected

func _on_button_mouse_exited_credits():
	$TextureRect/Credits/CreditsImage.texture = creditunselected

func _on_button_pressed_settings():
	pass

func _on_button_mouse_entered_settings():
	$TextureRect/Settings/SettingsImage.texture = settingselected

func _on_button_mouse_exited_settings():
	$TextureRect/Settings/SettingsImage.texture = settingunselected
