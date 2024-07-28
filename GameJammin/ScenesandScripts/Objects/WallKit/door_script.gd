extends StaticBody3D

#Set public variable to assign eacg door's color in level_1 scene
@export var matoverride : Material
#Set public variable to easily assign door's animation player
@export var door_animation_player: AnimationPlayer

var door_color
signal variables
#Signal door area enter & exit checks to player script
signal EnterCheck
signal ExitCheck

func _process(delta: float) -> void :
	#Following line allows us to set unique decals (blue, red, etc.) to each door in level_1 scene
	$SlidingDoor/DoorObj.set_surface_override_material(0,matoverride)
	#Following line gets the color (1,1,1,1) of the decal, will use to match to change_torch_color
	door_color = matoverride.get("shader_parameter/Color")
	#print(door_color)

func _on_player_pass_torch_color(change_torch_color) -> void:
	pass
	
func _on_door_body_entered(body: Node3D) -> void:
	variables.emit(door_color, door_animation_player)
	EnterCheck.emit()
	
func _on_door_body_exited(body: Node3D) -> void:
	ExitCheck.emit()

