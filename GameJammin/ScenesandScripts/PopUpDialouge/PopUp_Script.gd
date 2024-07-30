extends Control
#Reference video (https://www.youtube.com/watch?v=UlvBqz8bhCo)

#Create a reference to our label
@onready var label = $ColorRect/Label

#This text will indicate that the player can't mix certain colors or light final braziers with wrong color
var pop_up_text
#This text will congratulate the player on winning the level
var winner_text

#Set a variable to how texts timeout after a specified period of time
var show_time : float
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.set_text(str(pop_up_text))

func _on_timer_timeout() -> void:
	queue_free()
