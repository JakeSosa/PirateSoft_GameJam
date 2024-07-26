extends StaticBody3D

@export var colorChange : Color

signal colorPass

signal areaEnterCheck
signal areaExitCheck

func _ready():
	$OmniLight3D.light_color = colorChange

func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	colorPass.emit(colorChange)


func _on_area_bool_check(body):
	areaEnterCheck.emit()


func _on_area_3d_body_exited(body):
	areaExitCheck.emit()
