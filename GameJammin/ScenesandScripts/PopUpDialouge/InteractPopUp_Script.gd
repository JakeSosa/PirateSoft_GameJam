extends Control

@export var display_time : float = 1
@export var text_to_show : String = "text"

@onready var pop_up_scene = load("res://ScenesandScripts/PopUpDialouge/PopUp.tscn")

func _on_Button_pressed():
		var new_pop_up = pop_up_scene.instance()
		new_pop_up.show_time = display_time
		new_pop_up.text_to_show = text_to_show
		add_child(new_pop_up)
