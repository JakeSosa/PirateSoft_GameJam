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

func _ready():
	$OmniLight3D.light_color = brazier_color
	
func _physics_process(delta: float) -> void:
	brazier_controller()
	
func _on_brazier_body_entered(body: Node3D) -> void:
	near_brazier = true

func _on_brazier_body_exited(body: Node3D) -> void:
	near_brazier = false
	
func brazier_controller():
	if near_brazier == true && Input.is_action_just_pressed("interact"):
		player.is_lighting = true
		player.torch.visible = true
		player.torch.light_color = brazier_color
		player.animation_player.play("Light")
		player.animation_timer.start()
	
