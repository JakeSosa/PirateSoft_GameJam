extends AudioStreamPlayer

const MainMenuMusic = preload("res://Art/Sounds/Music/TRACK1_mixdown.mp3")

func stop_menu_music():
	$".".queue_free()
