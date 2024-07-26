extends StaticBody3D
#Torch Controller reference video (https://www.youtube.com/watch?v=RIJeoJ8qi1w)
#NOTE - Make sure Area 3D collission layer & mask are set to 2

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set onready variable to define brazier color
@onready var brazier_color = $OmniLight3D.light_color
#Set Variable to define when player can interact with the brazier
var interactable = true

func _process(delta: float) -> void:
	change_torch_color()
	
func change_torch_color():
	if interactable == true:
		#After player interacts with brazier, then set interactable to false
		interactable = false
		#If player is near brazier and presses E, change torch color to brazier color
		if player.near_brazier == true && Input.is_action_just_pressed("lightTorch"):
			player.torch.visible = true
			player.torch.light_color = brazier_color
			player.animation_player.play("Light")
			#Set timer to 2 seconds to match time of our Light animation
			await get_tree().create_timer(2.0,false).timeout
		#After the above code has run, set interactable back to true
		interactable = true

func _on_brazier_body_entered(body: Node3D) -> void:
	player.near_brazier = true
	
func _on_brazier_body_exited(body: Node3D) -> void:
	player.near_brazier = false
