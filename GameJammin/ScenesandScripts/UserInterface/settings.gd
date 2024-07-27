extends Control




func _on_sfx_volume_changed(value):
	AudioServer.set_bus_volume_db(1,value)
