extends Node3D
#NOTE - Make sure Area 3D collission layer & mask are set to 2

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D

func _on_waterfall_body_entered(body: Node3D) -> void:
	player.under_waterfall = true
	player.torch.visible = false
	
func _on_waterfall_body_exited(body: Node3D) -> void:
	player.under_waterfall = false
	
func _on_test_character_camera_kill_waterfall():
	$".".queue_free()
