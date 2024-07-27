extends StaticBody3D

##Set variable to determine if player is near door or not
#var near_door := false
##Set variable to tell us whether the door is open or closed
#var is_open = false
##Set variable to determine when the player can or cannot interact with the door
#var interactable = true
#Set public variable to assign eacg door's color in level_1 scene
@export var matoverride : Material
#Set public variable to easily assign door's animation player
@export var animation_player: AnimationPlayer

var door_color
signal variables
#Signal door area enter & exit checks to player script
signal EnterCheck
signal ExitCheck


func _ready():
	pass

func _process(delta: float) -> void :
	#Following line allows us to set unique decals (blue, red, etc.) to each door in level_1 scene
	$SlidingDoor/DoorObj.set_surface_override_material(0,matoverride)
	#Following line gets the color (1,1,1,1) of the decal, will use to match to change_torch_color
	door_color = matoverride.get("shader_parameter/Color")
	#print(door_color)
	
#func interact():
	#if interactable == true:
		##After the player interacts with the door (true) then interactable will be set to false
		#interactable = false
		##And whatever is_open is equal to before will now change to be the opposite
		#is_open = !is_open
		##If the door is open, then the DoorOpen animation will play
		#if is_open == true:
			#animation_player.play("DoorOpen")
		##If the door is closed, then the DoorClose animation will play
		#if is_open == false:
			#animation_player.play("DoorClose")
		##Set timer to 2 seconds which matches the time of our door animation
		#await get_tree().create_timer(2.0, false).timeout
		##After the above code has run, then interactable will be set to true again
		#interactable = true

func _on_player_pass_torch_color(change_torch_color) -> void:
	pass
	

func _on_door_body_entered(body: Node3D) -> void:
	#near_door = true
	variables.emit(door_color)
	EnterCheck.emit()
	
func _on_door_body_exited(body: Node3D) -> void:
	#near_door = false
	ExitCheck.emit()

