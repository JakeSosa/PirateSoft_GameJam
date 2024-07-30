extends Control

@export var startunselected : Texture 
@export var startselected : Texture 
@export var settingunselected : Texture 
@export var settingselected : Texture 
@export var creditunselected : Texture 
@export var creditselected : Texture

var menu_sound = preload("res://Art/Sounds/SFX/MenuSounds/MenuButtonSound.mp3")


func _ready():
	if MainMenuMusic.playing == false:
		MainMenuMusic.playing = true

func _on_start_button_pressed():
	MainMenuMusic.stop_menu_music()
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/loading_screen.tscn")

func _on_button_mouse_entered_start():
	$TextureRect/Start/StartImage.texture = startselected
	MainMenuMusic.play_SFX(menu_sound)

func _on_button_mouse_exited_start():
	$TextureRect/Start/StartImage.texture = startunselected

func _on_button_pressed_credits():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/credits.tscn")

func _on_button_mouse_entered_credits():
	$TextureRect/Credits/CreditsImage.texture = creditselected
	MainMenuMusic.play_SFX(menu_sound)

func _on_button_mouse_exited_credits():
	$TextureRect/Credits/CreditsImage.texture = creditunselected

func _on_button_pressed_settings():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/settings.tscn")

func _on_button_mouse_entered_settings():
	$TextureRect/Settings/SettingsImage.texture = settingselected
	MainMenuMusic.play_SFX(menu_sound)

func _on_button_mouse_exited_settings():
	$TextureRect/Settings/SettingsImage.texture = settingunselected
