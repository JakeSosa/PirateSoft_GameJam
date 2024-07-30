extends Control

var text_to_show = "Hmmm....doesn't work."
var show_time = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/Label.text = text_to_show
	$Timer.start(show_time)


func _on_timer_timeout() -> void:
	queue_free()
