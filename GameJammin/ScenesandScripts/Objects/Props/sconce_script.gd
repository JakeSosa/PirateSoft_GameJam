extends StaticBody3D

@export var sconce_colorChange : Color

signal sconce_colorPass

signal sconceEnterCheck
signal sconeExitCheck

func _ready():
	$OmniLight3D.light_color = sconce_colorChange
	
	





func _on_sconce_body_entered(body: Node3D) -> void:
	sconce_colorPass.emit(sconce_colorChange)
