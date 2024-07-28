extends StaticBody3D

#Set public variable to assign eacg door's color in level_1 scene
@export var matoverride : Material
#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set public variable to easily assign door's animation player
@onready var animation_player = $AnimationPlayer

var door_color
var near_door := false
var door_open := false

func _ready() -> void:
	door_open = false
	
func _process(delta: float) -> void :
	#Following line allows us to set unique decals (blue, red, etc.) to each door in level_1_scene
	$SlidingDoor/DoorObj.set_surface_override_material(0,matoverride)
	#Following line gets the color (1,1,1,1) of the decal, will use to match to torch.light_color
	door_color = matoverride.get("shader_parameter/Color")
	#print(door_color)
func _physics_process(delta: float) -> void:
	door_controller()
	
func _on_door_body_entered(body: Node3D) -> void:
	near_door = true
	
func _on_door_body_exited(body: Node3D) -> void:
	near_door = false
	
func door_controller():
	if near_door == true && door_open == false:
		if door_color == null:
			pass
		else:
			if player.torch.light_color.is_equal_approx(Color(door_color.x, door_color.y, door_color.z, door_color.w)):
				animation_player.play("DoorOpen")
				door_open = true
				player.animation_timer.start()
