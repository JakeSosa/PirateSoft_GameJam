extends StaticBody3D
#Torch Controller reference video (https://www.youtube.com/watch?v=RIJeoJ8qi1w)

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set onready variable to define brazier color
@onready var brazier_color = $OmniLight3D.light_color

func _process(delta: float) -> void:
	change_torch_color()
	
func change_torch_color():
	if player.near_brazier == true && Input.is_action_just_pressed("lightTorch"):
		player.torch.light_color = brazier_color
		player.animation_player.play("Light")

func _on_brazier_body_entered(body: Node3D) -> void:
	player.near_brazier = true
	
func _on_brazier_body_exited(body: Node3D) -> void:
	player.near_brazier = false
	
