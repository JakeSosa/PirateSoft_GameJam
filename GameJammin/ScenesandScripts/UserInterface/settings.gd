extends Control


func _on_music_volume_changed(value):
	AudioServer.set_bus_volume_db(2,value)

func _on_sfx_volume_changed(value):
	AudioServer.set_bus_volume_db(1,value)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/main_menu.tscn")
