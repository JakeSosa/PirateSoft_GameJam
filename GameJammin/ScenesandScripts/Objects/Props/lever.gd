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
var lever_down = false
var lever_up = true
#Send signal to specific waterfall in scene to turn it off
signal kill_waterfall
#Send signal to specific waterfall in scent to turn it on
signal revive_waterfall

func _ready() -> void:
	lever_down = false
	lever_up = true
	
func _physics_process(delta: float) -> void:
	lever_controller()
	
func _on_lever_body_entered(body):
	near_lever = true
	
func _on_lever_body_exited(body):
	near_lever = false
	
func lever_controller():
	#If player is near lever & presses E, play Pull animation
	if near_lever == true && Input.is_action_just_pressed("interact"):
		#If current position of lever is pulled up
		if lever_up == true && lever_down == false:
			#Play animation to pull lever down and set new downward position for lever
			animation_player.play("PullAgain")
			audio_player.play()
			lever_down = true
			lever_up = false
			#Emit signal from lever script to waterfall script to turn off waterfall 2
			kill_waterfall.emit()
			
		elif lever_up == false && lever_down == true:
			#Play animation to pull lever up and set new upward position for lever
			animation_player.play("Pull")
			audio_player.play()
			lever_down = false
			lever_up = true
			#Emit signal from lever script to waterfall script to turn off waterfall 3
			revive_waterfall.emit()
		
	
