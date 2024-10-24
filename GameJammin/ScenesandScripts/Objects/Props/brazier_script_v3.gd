extends StaticBody3D
#NOTE - Brazier's Area3D Collision is assigned to 3 (aka props: sconce & brazier)
#NOTE - Brazier's Area3D Mask is assigned to 2 (aka player) 

#Brazier variables
#Make brazier_color public to assign unique color to each brazier in scene
@export var brazier_color : Color
#Set public variable that will act as a pointer to the player in scene
@export var player : CharacterBody3D
#Set variable to define when player is near brazier
var near_brazier := false

#Pop Up Dialouge Variables
@onready var floating_text = preload("res://ScenesandScripts/PopUpDialouge/PopUp.tscn")

#Preload SFX
var BadMixSFX = preload("res://Art/Sounds/SFX/MenuSounds/BadMix.mp3")

func _ready():
	$OmniLight3D.light_color = brazier_color
	
func _physics_process(delta: float) -> void:
	if near_brazier == true:
		interact_brazier()
	
func _on_brazier_body_entered(body: Node3D) -> void:
	near_brazier = true

func _on_brazier_body_exited(body: Node3D) -> void:
	near_brazier = false
	
func interact_brazier():
	if player.moving == false:
		#If player torch is WHITE & brazier assigned color is brazier_color
		#Then set player torch color to BLUE
		if Input.is_action_just_pressed("interact"):
			player.interacting = true
			player.torch.visible = true
			player.animation_tree["parameters/conditions/is_lighting"] = true
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
			else:
				var pop_up_text = "Hmmm...doesn't work."
				var text = floating_text.instantiate()
				text.pop_up_text = pop_up_text
				add_child(text)
				MainMenuMusic.play_SFX(BadMixSFX)
		else:
			#Set following animation parameters for animation tree
			player.animation_tree["parameters/conditions/is_lighting"] = false
