extends StaticBody3D
#NOTE - Brazier's Area3D Collision is assigned to 3 (aka props: sconce & brazier)
#NOTE - Brazier's Area3D Mask is assigned to 2 (aka player) 

#Brazier variables
#Make brazier_color public to assign unique color to each brazier in level_1 scene
@export var brazier_color : Color
#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set variable to define when player is near brazier
var near_brazier := false
@export var particle_color : Color

func _ready():
	$OmniLight3D.light_color = brazier_color
	#print(brazier_color)
	#$OmniLight3D/GPUParticles3D.process_material.resource_local_to_scene = true
	#$OmniLight3D/GPUParticles3D.process_material.color = Color(1,0,0,1)
	#print("PaticleColor ",$OmniLight3D/GPUParticles3D.process_material.color)
	
func _physics_process(delta: float) -> void:
	brazier_controller()
	
func _on_brazier_body_entered(body: Node3D) -> void:
	near_brazier = true

func _on_brazier_body_exited(body: Node3D) -> void:
	near_brazier = false
	
func brazier_controller():
	#If player torch is WHITE & brazier assigned color is brazier_color
	#Then set player torch color to BLUE
	if near_brazier == true && Input.is_action_just_pressed("interact"):
		player.is_lighting = true
		player.torch.visible = true
		if player.torch.light_color == player.default_torch_color:
			player.torch.light_color = brazier_color
			player.animation_player.play("Light")
			player.animation_timer.start()
			
		#If player torch is RED & brazier assigned color is BLUE
		#Then set player torch color to PURPLE (WORKS)
		elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(0, 0, 1, 1):
			player.torch.light_color = Color(1, 0, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
		#If player torch is RED & brazier assigned color is RED
		#Then set player torch color to brazier_color (WORKS)
		elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(1, 0, 0, 1):
			player.torch.light_color = brazier_color
			player.animation_player.play("Light")
			player.animation_timer.start()
		#If player torch is RED & brazier assigned color is GREEN (WORKS)
		#Then set player torch color to YELLOW
		elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(0, 1, 0, 1):
			player.torch.light_color = Color(1, 1, 0, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			
		#If player torch is BLUE & brazier assigned color is BLUE
		#Then set player torch color to brazier_color (WORKS)
		elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 0, 1, 1):
			player.torch.light_color = Color(0, 0, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
		#If player torch is BLUE & brazier assigned color is RED
		#Then set player torch color to PURPLE (WORKS)
		elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(1, 0, 0, 1):
			player.torch.light_color = Color(1, 0, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
		#If player torch is BLUE & brazier assigned color is GREEN
		#Then set player torch color to CYAN (WORKS)
		elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 1, 0, 1):
			player.torch.light_color = Color(0, 1, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			
		#If player torch is GREEN & brazier assigned color is GREEN
		#Then set player torch color to brazier_color (WORKS)
		elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 1, 0, 1):
			player.torch.light_color = brazier_color
			player.animation_player.play("Light")
			player.animation_timer.start()	
		#If player torch is GREEN & brazier assigned color is RED
		#Then set player torch color to YELLOW (WORKS)
		elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(1, 0, 0, 1):
			player.torch.light_color = Color(1, 1, 0, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()	
		#If player torch is GREEN & brazier assigned color is BLUE
		#Then set player torch color to CYAN (WORKS)
		elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 0, 1, 1):
			player.torch.light_color = Color(0, 1, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()		
		else:
			print("Can't Mix This Color")
			
