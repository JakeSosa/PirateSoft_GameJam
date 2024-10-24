extends StaticBody3D
#NOTE - Sconce's Area3D Collision is assigned to 3 (aka props: sconce & brazier)
#NOTE - Sconce's Area3D Mask is assigned to 2 (aka player) 

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Sconce variables
@onready var sconce = $OmniLight3D
var default_sconce_color = Color.WHITE
var near_sconce := false


#Pop Up Dialouge Variables
@onready var floating_text = preload("res://ScenesandScripts/PopUpDialouge/PopUp.tscn")

#Preload SFX
var BadMixSFX = preload("res://Art/Sounds/SFX/MenuSounds/BadMix.mp3")

func _ready():
	sconce.light_color = default_sconce_color
	sconce.visible = false
	
func _physics_process(delta: float) -> void:
	interact_sconce()
	
func _on_sconce_body_entered(body: Node3D) -> void:
	near_sconce = true
func _on_sconce_body_exited(body: Node3D) -> void:
	near_sconce = false
	
func interact_sconce():
	#Deposit or mix color from torch to sconce
	#NOTE - IF SCONCE.VISIBLE = FALSE
	if near_sconce == true && sconce.visible == false && Input.is_action_just_pressed("interact"):
		if player.torch.light_color != player.default_torch_color:
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = player.torch.light_color
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE

	#NOTE - IF SCONCE.VISIBLE = TRUE		
	elif near_sconce == true && sconce.visible == true && Input.is_action_just_pressed("interact"):
		#If sconce is RED & player torch color is BLUE
		#Then set player torch color to PURPLE	
		if sconce.light_color == Color(1, 0, 0, 1) && player.torch.light_color == Color(0, 0, 1, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(1, 0, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is RED & player torch color is RED
		#Then set player torch color to sconce 	
		if sconce.light_color == Color(1, 0, 0, 1) && player.torch.light_color == Color(1, 0, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = sconce.light_color
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is RED & player torch color is GREEN
		#Then set player torch color to YELLOW	
		if sconce.light_color == Color(1, 0, 0, 1) && player.torch.light_color == Color(0, 1, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(1, 1, 0, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
			
		#If sconce is BLUE & player torch color is BLUE
		#Then set player torch color to sconce	
		if sconce.light_color == Color(0, 0, 1, 1) && player.torch.light_color == Color(0, 0, 1, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = sconce.light_color
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is BLUE & player torch color is RED
		#Then set player torch color to PURPLE
		if sconce.light_color == Color(0, 0, 1, 1) && player.torch.light_color == Color(1, 0, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(1, 0, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is BLUE & player torch color is GREEN
		#Then set player torch color to CYAN	
		if sconce.light_color == Color(0, 0, 1, 1) && player.torch.light_color == Color(0, 1, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(0, 1, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
			
		#If sconce is GREEN & player torch color is GREEN
		#Then set player torch color to sconce	
		if sconce.light_color == Color(0, 1, 0, 1) && player.torch.light_color == Color(0, 1, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = sconce.light_color
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is GREEN & player torch color is RED
		#Then set player torch color to YELLOW	
		if sconce.light_color == Color(0, 1, 0, 1) && player.torch.light_color == Color(1, 0, 0, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(1, 1, 0, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
		#If sconce is GREEN & player torch color is BLUE
		#Then set player torch color to CYAN	
		if sconce.light_color == Color(0, 1, 0, 1) && player.torch.light_color == Color(0, 0, 1, 1):
			player.is_lighting = true
			sconce.visible = true
			sconce.light_color = Color(0, 1, 1, 1)
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
			
		#Withdraw color from sconce to player torch			
		elif near_sconce == true && sconce.visible == true:
			if player.torch.light_color == player.default_torch_color:
				if Input.is_action_just_pressed("interact"):
					player.is_lighting = true
					sconce.visible = false
					player.torch.visible = true
					player.torch.light_color = sconce.light_color
					player.animation_player.play("Light")
					player.animation_timer.start()
				else:
					var pop_up_text = "Hmmm...doesn't work."
					var text = floating_text.instantiate()
					text.pop_up_text = pop_up_text
					add_child(text)
					MainMenuMusic.play_SFX(BadMixSFX)
		

