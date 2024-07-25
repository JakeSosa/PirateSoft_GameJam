extends Node3D

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D

func _on_waterfall_body_entered(body: Node3D) -> void:
	player.under_waterfall = true
	player.torch.visible = false
	print("player under waterfall")

func _on_waterfall_body_exited(body: Node3D) -> void:
	player.under_waterfall = false
	print("player NOT under waterfall")
