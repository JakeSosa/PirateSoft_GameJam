extends Control
#Reference video (https://www.youtube.com/watch?v=UlvBqz8bhCo)

@onready var label = $ColorRect/Label

var pop_up_text
var winner_text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.set_text(str(pop_up_text))
	label.set_text(str(winner_text))


func _on_timer_timeout() -> void:
	queue_free()
