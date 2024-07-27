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
	sconce_light.visible = false
	
func _on_sconce_body_entered(body: Node3D) -> void:
	variables.emit(sconce_color, sconce_light)
	EnterCheck.emit()
	
	
func _on_sconce_body_exited(body: Node3D) -> void:
	ExitCheck.emit()

#Recieved following signal from player script to deposit light from torch to sconce
func _on_player_deposit_sconce_color(torch_color, change_torch_color) -> void:
	sconce_light.visible = true
	if torch_color == change_torch_color:
		$OmniLight3D.light_color = torch_color
	else:
		$OmniLight3D.light_color = change_torch_color
