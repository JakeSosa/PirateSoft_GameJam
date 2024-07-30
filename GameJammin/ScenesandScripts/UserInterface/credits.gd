extends Control

@export var backSelected: Texture
@export var backUnselected: Texture

var menu_sound = preload("res://Art/Sounds/SFX/MenuSounds/MenuButtonSound.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://ScenesandScripts/UserInterface/main_menu.tscn")



func _on_button_mouse_entered():
	$ColorRect/PanelContainer/TextureRect.texture = backSelected
	MainMenuMusic.play_SFX(menu_sound)


func _on_button_mouse_exited():
	$ColorRect/PanelContainer/TextureRect.texture = backUnselected
