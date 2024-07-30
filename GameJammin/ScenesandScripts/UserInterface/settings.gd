extends Control

@export var backSelected : Texture
@export var backUnselected : Texture

func _process(delta):
	AudioServer.set_bus_volume_db(2,linear_to_db($MarginContainer/VBoxContainer/MusicVolume.value))
	AudioServer.set_bus_volume_db(1,linear_to_db($MarginContainer/VBoxContainer/SFXVolume.value))


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/main_menu.tscn")


func _on_button_mouse_entered():
	$PanelContainer/BackText.texture = backSelected


func _on_button_mouse_exited():
	$PanelContainer/BackText.texture = backUnselected
