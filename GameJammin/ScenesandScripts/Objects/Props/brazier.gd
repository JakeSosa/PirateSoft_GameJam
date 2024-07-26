extends StaticBody3D

var current_color

signal colorpass

# Called when the node enters the scene tree for the first time.
func _ready():
	current_color = $OmniLight3D.light_color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	colorpass.emit(current_color)

