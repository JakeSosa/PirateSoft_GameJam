extends StaticBody3D

#Sconce variables
@export var sconce_color : Color
@export var sconce_light : OmniLight3D

#Signal sconce variables to player script
signal variables
#Signal sconce area enter & exit checks to player script
signal EnterCheck
signal ExitCheck

func _ready():
	$OmniLight3D.light_color = sconce_color
	sconce_light.visible = true
	
func _on_sconce_body_entered(body: Node3D) -> void:
	variables.emit(sconce_color, sconce_light)
	EnterCheck.emit()
	
	
func _on_sconce_body_exited(body: Node3D) -> void:
	ExitCheck.emit()
