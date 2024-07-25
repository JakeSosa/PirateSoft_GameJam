extends StaticBody3D
#Torch Controller referecne video (https://www.youtube.com/watch?v=RIJeoJ8qi1w)
#Change Color reference video (https://www.youtube.com/watch?v=0_ZI-Sz-s_I)

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D

@onready var brazier_color = $OmniLight3D.light_color

var default_torch_color = Color.WHITE

func _process(delta: float) -> void:
	change_torch_color()
	
func change_torch_color():
	if player.near_brazier == true && Input.is_action_just_pressed("lightTorch"):
		player.player_torch.light_color = brazier_color
	
func _on_brazier_body_entered(body: Node3D) -> void:
	player.near_brazier = true
	print("player near brazier")
		
func _on_brazier_body_exited(body: Node3D) -> void:
	player.near_brazier = false
	print("player NOT near brazier")
