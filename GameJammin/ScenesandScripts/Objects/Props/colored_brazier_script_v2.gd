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

#Pop Up Dialouge Variables
@onready var floating_text = preload("res://ScenesandScripts/PopUpDialouge/PopUp.tscn")

#Preload SFX
var BadMixSFX = preload("res://Art/Sounds/SFX/MenuSounds/BadMix.mp3")

func _ready():
	$OmniLight3D.light_color = brazier_color
	$OmniLight3D.visible = false
	
func _physics_process(delta: float) -> void:
	if near_brazier == true:
		interacting_colored_brazier()
	
func _on_brazier_body_entered(body: Node3D) -> void:
	near_brazier = true

func _on_brazier_body_exited(body: Node3D) -> void:
	near_brazier = false
	
func interacting_colored_brazier():
	if player.moving == false:
		#NOTE - If brazier light is turned OFF
		if $OmniLight3D.visible == false:
			#Deposit color from player's torch to brazier pressing E
			if Input.is_action_just_pressed("interact"):
				player.animation_tree["parameters/conditions/is_lighting"] = true
				player.interacting = true
				#If player torch does NOT match assigned brazier_color 
				#Set pop up text to inform player it doesn't go there
				if player.torch.light_color != brazier_color:
					var pop_up_text = "Does this really go here???"
					var text = floating_text.instantiate()
					text.pop_up_text = pop_up_text
					add_child(text)
					MainMenuMusic.play_SFX(BadMixSFX)
				#If player torch is RED & brazier assigned color is RED
				#Then turn ON visibility for brazier's OmniLight3D 
				if player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(1, 0, 0, 1):
					$OmniLight3D.visible = true
					player.torch.light_color = Color.WHITE
					
				#If player torch is BLUE & brazier assigned color is BLUE
				#Then turn visibility for brazier's OmniLight3D turned ON
				if player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 0, 1, 1):
					$OmniLight3D.visible = true
					player.torch.light_color = Color.WHITE
					
				#If player torch is GREEN & brazier assigned color is GREEN
				#Then turn visibility for brazier's OmniLight3D turned ON
				if player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 1, 0, 1):
					$OmniLight3D.visible = true
					player.torch.light_color = Color.WHITE	
					
				#If player torch is CYAN & brazier assigned color is CYAN
				#Then turn visibility for brazier's OmniLight3D turned ON
				if player.torch.light_color == Color(0, 1, 1, 1) && brazier_color == Color(0, 1, 1, 1):
					$OmniLight3D.visible = true	
					player.torch.light_color = Color.WHITE	
					
				#If player torch is PURPLE & brazier assigned color is PURPLE
				#Then turn visibility for brazier's OmniLight3D turned ON
				if player.torch.light_color == Color(1, 0, 1, 1) && brazier_color == Color(1, 0, 1, 1):
					$OmniLight3D.visible = true
					player.torch.light_color = Color.WHITE	
					
				#If player torch is YELLOW & brazier assigned color is YELLOW
				#Then turn visibility for brazier's OmniLight3D turned ON
				if player.torch.light_color == Color(1, 1, 0, 1) && brazier_color == Color(1, 1, 0, 1):
					$OmniLight3D.visible = true
					player.torch.light_color = Color.WHITE	
			else:
				player.animation_tree["parameters/conditions/is_lighting"] = false
		
		#NOTE - If brazier light is turned ON
		elif $OmniLight3D.visible == true:
			#Mix color from brazier to player's torch pressing E
			if Input.is_action_just_pressed("interact"):
				player.animation_tree["parameters/conditions/is_lighting"] = true
				player.interacting = true
				player.torch.visible = true
				#If player torch is WHITE 
				#Then set player torch color to brazier_color
				if player.torch.light_color == player.default_torch_color:
					player.torch.light_color = brazier_color
					
				#If player torch is RED & brazier assigned color is BLUE
				#Then set player torch color to PURPLE (WORKS)
				elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(0, 0, 1, 1):
					player.torch.light_color = Color(1, 0, 1, 1)
				#If player torch is RED & brazier assigned color is RED
				#Then set player torch color to brazier_color (WORKS)
				elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(1, 0, 0, 1):
					player.torch.light_color = brazier_color
				#If player torch is RED & brazier assigned color is GREEN (WORKS)
				#Then set player torch color to YELLOW
				elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(0, 1, 0, 1):
					player.torch.light_color = Color(1, 1, 0, 1)
					
				#If player torch is BLUE & brazier assigned color is BLUE
				#Then set player torch color to brazier_color (WORKS)
				elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 0, 1, 1):
					player.torch.light_color = Color(0, 0, 1, 1)
				#If player torch is BLUE & brazier assigned color is RED
				#Then set player torch color to PURPLE (WORKS)
				elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(1, 0, 0, 1):
					player.torch.light_color = Color(1, 0, 1, 1)
				#If player torch is BLUE & brazier assigned color is GREEN
				#Then set player torch color to CYAN (WORKS)
				elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 1, 0, 1):
					player.torch.light_color = Color(0, 1, 1, 1)
					
				#If player torch is GREEN & brazier assigned color is GREEN
				#Then set player torch color to brazier_color (WORKS)
				elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 1, 0, 1):
					player.torch.light_color = brazier_color	
				#If player torch is GREEN & brazier assigned color is RED
				#Then set player torch color to YELLOW (WORKS)
				elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(1, 0, 0, 1):
					player.torch.light_color = Color(1, 1, 0, 1)
				#If player torch is GREEN & brazier assigned color is BLUE
				#Then set player torch color to CYAN (WORKS)
				elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 0, 1, 1):
					player.torch.light_color = Color(0, 1, 1, 1)
				
				#If player torch is CYAN & brazier assigned color is CYAN
				#Then set player torch color to CYAN (WORKS)
				elif player.torch.light_color == Color(0, 1, 1, 1) && brazier_color == Color(0, 1, 1, 1):
					player.torch.light_color = Color(0, 1, 1, 1)
					
				#If player torch is YELLOW & brazier assigned color is YELLOW
				#Then set player torch color to YELLOW (WORKS)
				elif player.torch.light_color == Color(1, 1, 0, 1) && brazier_color == Color(1, 1, 0, 1):
					player.torch.light_color = Color(1, 1, 0, 1)
		
				#If player torch is PURPLE & brazier assigned color is PURPLE
				#Then set player torch color to PURPLE (WORKS)
				elif player.torch.light_color == Color(1, 0, 1, 1) && brazier_color == Color(1, 0, 1, 1):
					player.torch.light_color = Color(1, 0, 1, 1)
				else:
					var pop_up_text = "Hmmm...doesn't work."
					var text = floating_text.instantiate()
					text.pop_up_text = pop_up_text
					add_child(text)
					MainMenuMusic.play_SFX(BadMixSFX)
			else:
				player.animation_tree["parameters/conditions/is_lighting"] = false
					
