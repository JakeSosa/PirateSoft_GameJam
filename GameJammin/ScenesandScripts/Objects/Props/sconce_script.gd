extends StaticBody3D

#Sconce variables
var sconce_color : Color

#Signal sconce variables to player script
signal variables
#Signal sconce area enter & exit checks to player script
signal EnterCheck
signal ExitCheck

func _ready():
	$OmniLight3D.light_color = sconce_color
	
func _on_sconce_body_entered(body: Node3D) -> void:
	variables.emit(sconce_color)
	EnterCheck.emit()
	
	
func _on_sconce_body_exited(body: Node3D) -> void:
	ExitCheck.emit()
