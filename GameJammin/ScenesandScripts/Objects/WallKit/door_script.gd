extends StaticBody3D
#NOTE - Door's Area3D Collision is assigned to 1 (aka environment)
#NOTE - Door's Area3D Mask is assigned to 2 (aka player) & 3 (aka props: sconce & brazier)

#Set public variable to assign eacg door's color in level_1 scene
@export var matoverride : Material
#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set public variable that will act as a pointer to nearby sconce in level 1 scene
@export var nearby_sconce : OmniLight3D
@export var second_nearby_sconce : OmniLight3D
#Set public variable to easily assign door's animation player
@onready var animation_player = $AnimationPlayer

var door_color
var near_door := false
var door_open := false
var combined_sconce_color

func _ready() -> void:
	door_open = false
	
func _process(delta: float) -> void :
	#Following line allows us to set unique decals (blue, red, etc.) to each door in level_1_scene
	$SlidingDoor/DoorObj.set_surface_override_material(0,matoverride)
	#Following line gets the color (1,1,1,1) of the decal, will use to match to torch.light_color
	door_color = matoverride.get("shader_parameter/Color")
	
func _physics_process(delta: float) -> void:
	torch_open_door()
	sconce_open_door()
	
func _on_door_body_entered(body: Node3D) -> void:
	near_door = true
	
func _on_door_body_exited(body: Node3D) -> void:
	near_door = false
	
func torch_open_door():
	if near_door == true && door_open == false:
		#If Material like "DoorBlue.tres" is not assigned to door in level_1_scene, then pass
		if door_color == null:
			pass
		else:
			if player.torch.light_color.is_equal_approx(Color(door_color.x, door_color.y, door_color.z, door_color.w)):
				animation_player.play("DoorOpen")
				door_open = true
				player.animation_timer.start()
				
func sconce_open_door():
	#NOTE - NEARBY_SCONCE
	#If sconce OmniLight3D is not assigned to door in level_1_scene, then pass			
	if nearby_sconce == null:
		pass
	#Otherwise read following code
	elif nearby_sconce.visible == true && door_open == false:
		#If nearby sconce color matches the color of the door, open door
		if nearby_sconce.light_color.is_equal_approx(Color(door_color.x, door_color.y, door_color.z, door_color.w)):
			animation_player.play("DoorOpen")
			door_open = true
			player.animation_timer.start()
			
	#NOTE - SECONDARY_NEARBY_SCONCE
	#If second sconce OmniLight3D is not assigned to door in level_1_scene, then pass		
	if second_nearby_sconce == null:
		pass
	#Otherwise read following code
	elif  second_nearby_sconce.visible == true && door_open == false:
		#If second nearby sconce color matches the color of the door, open door
		if second_nearby_sconce.light_color.is_equal_approx(Color(door_color.x, door_color.y, door_color.z, door_color.w)):
			animation_player.play("DoorOpen")
			door_open = true
			player.animation_timer.start()	
	
	
			
	#NOTE - COMBINED_SCONCE
	if nearby_sconce != null && second_nearby_sconce != null && door_open == false:
		#If nearby_sconce is RED & secondary_nearby_sconce is BLUE
		#Then set combined_sconce_color to PURPLE 
		if nearby_sconce.light_color == Color(1, 0, 0, 1) && second_nearby_sconce.light_color == Color(0, 0, 1, 1):
			combined_sconce_color = Color(1, 0, 1, 1)
			print(combined_sconce_color)
			if combined_sconce_color == Color(1, 0, 1, 1):
				animation_player.play("DoorOpen")
				door_open = true
				#player.animation_timer.start()
			#If nearby_sconce is BLUE & secondary_nearby_sconce is RED
			#Then set combined_sconce_color to PURPLE 
		elif nearby_sconce.light_color == Color(0, 0, 1, 1) && second_nearby_sconce.light_color == Color(1, 0, 0, 1):
			combined_sconce_color = Color(1, 0, 1, 1)
			print(combined_sconce_color)
			if combined_sconce_color == Color(1, 0, 1, 1):
				animation_player.play("DoorOpen")
				door_open = true
				#player.animation_timer.start()
			
			
			
			##NOTE - will add logic for other colors later
#
			##If combined_sconce_color matches the color of the door, open door
			#if combined_sconce_color.is_equal_approx(Color(door_color.x, door_color.y, door_color.z, door_color.w)):
				#animation_player.play("DoorOpen")
				#door_open = true
				#player.animation_timer.start()
