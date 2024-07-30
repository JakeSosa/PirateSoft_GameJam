extends AudioStreamPlayer

const MainMenuMusic = preload("res://Art/Sounds/Music/TRACK1_mixdown.mp3")
var sfxVolumeSave : float = .5
var musicVolumeSave : float = .5

func stop_menu_music():
	$".".playing = false

func play_SFX(stream : AudioStream):
	var SFX_player = AudioStreamPlayer.new()
	SFX_player.stream = stream
	#SFX_player.name = "SFX_Player"
	SFX_player.bus = "SFX"
	add_child(SFX_player)
	SFX_player.play()
	
	await SFX_player.finished
	
	SFX_player.queue_free()
