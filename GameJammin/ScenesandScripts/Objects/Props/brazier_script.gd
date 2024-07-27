extends StaticBody3D

#Brazier variables
#Make brazier_color public to assign unique color to each brazier in level_1 scene
@export var brazier_color : Color

#Signal brazier variables to player script
signal variables

#Signal brazier area enter & exit checks to player script
signal EnterCheck
signal ExitCheck

func _ready():
	$OmniLight3D.light_color = brazier_color

func _on_brazier_body_entered(body: Node3D) -> void:
	variables.emit(brazier_color)
	EnterCheck.emit()


func _on_brazier_body_exited(body: Node3D) -> void:
	ExitCheck.emit()
