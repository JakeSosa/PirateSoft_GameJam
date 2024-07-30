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
	$OmniLight3D.visible = false
	
func _physics_process(delta: float) -> void:
	brazier_controller()
	
func _on_brazier_body_entered(body: Node3D) -> void:
	near_brazier = true

func _on_brazier_body_exited(body: Node3D) -> void:
	near_brazier = false
	
func brazier_controller():
	#If player torch does NOT match assigned brazier_color =
	#Then keep visibilty for brazier's OmniLight3D turned OFF
	if near_brazier == true && Input.is_action_just_pressed("interact"):
		player.is_lighting = true
		if player.torch.light_color != brazier_color:
			$OmniLight3D.visible = false
			player.animation_player.play("Light")
			player.animation_timer.start()
			
		#If player torch is RED & brazier assigned color is RED
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(1, 0, 0, 1) && brazier_color == Color(1, 0, 0, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
			
		#If player torch is BLUE & brazier assigned color is BLUE
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(0, 0, 1, 1) && brazier_color == Color(0, 0, 1, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			player.torch.light_color = Color.WHITE
			
		#If player torch is GREEN & brazier assigned color is GREEN
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(0, 1, 0, 1) && brazier_color == Color(0, 1, 0, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()	
			player.torch.light_color = Color.WHITE	
			
		#If player torch is CYAN & brazier assigned color is CYAN
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(0, 1, 1, 1) && brazier_color == Color(0, 1, 1, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()	
			player.torch.light_color = Color.WHITE	
			
		#If player torch is PURPLE & brazier assigned color is PURPLE
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(1, 0, 1, 1) && brazier_color == Color(1, 0, 1, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()	
			player.torch.light_color = Color.WHITE	
			
		#If player torch is YELLOW & brazier assigned color is YELLOW
		#Then turn visibility for brazier's OmniLight3D turned ON
		elif player.torch.light_color == Color(1, 1, 0, 1) && brazier_color == Color(1, 1, 0, 1):
			$OmniLight3D.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()	
			player.torch.light_color = Color.WHITE	
			
		else:
			print("hmmm....this isn't the right color")
			
