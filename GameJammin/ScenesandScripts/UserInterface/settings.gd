extends Control

func _process(delta):
	AudioServer.set_bus_volume_db(2,linear_to_db($MarginContainer/VBoxContainer/MusicVolume.value))
	AudioServer.set_bus_volume_db(1,linear_to_db($MarginContainer/VBoxContainer/SFXVolume.value))


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/main_menu.tscn")
