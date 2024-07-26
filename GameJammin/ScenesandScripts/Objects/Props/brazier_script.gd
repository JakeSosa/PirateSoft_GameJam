extends StaticBody3D

@export var colorChange : Color

signal colorPass

func _ready():
	$OmniLight3D.light_color = colorChange

func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	colorPass.emit(colorChange)
