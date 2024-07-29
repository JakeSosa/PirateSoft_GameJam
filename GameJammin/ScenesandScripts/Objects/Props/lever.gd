extends StaticBody3D

#NOTE - Lever's Collision is assigned to 3 (aka props: sconce & brazier & lever) 
#NOTE - Levers's Mask is assigned to 2 (aka player) 

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set public variable to easily assign lever's animation player
@onready var animation_player = $AnimationPlayer_Lever
#Set public variable to easily call lever's sound effects
@onready var audio_player = $LeverSFX
#Set variable to define when player is near lever
var near_lever := false
var interactable = true
#Send signal to specific waterfall in scene to turn it off
signal kill_waterfall

func _ready() -> void:
	interactable = true
	
func _physics_process(delta: float) -> void:
	lever_controller()
	
func _on_lever_body_entered(body):
	near_lever = true
	
func _on_lever_body_exited(body):
	near_lever = false
	
func lever_controller():
	if interactable == true:
		#If player is near lever & presses E, play Pull animation
		if near_lever == true && Input.is_action_just_pressed("interact"):
			animation_player.play("Pull")
			audio_player.play()
			#Emit signal from lever script to waterfall script
			kill_waterfall.emit()
			#After the player interacts with the lever, change interactable to false
			interactable = false
	
