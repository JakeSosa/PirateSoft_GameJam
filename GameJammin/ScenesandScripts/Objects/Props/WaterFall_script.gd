extends Node3D

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D

var under_waterfall := false

func _on_waterfall_body_entered(body: Node3D) -> void:
	under_waterfall = true
	player.torch.visible = false
	player.torch.light_color = Color.WHITE
	
func _on_waterfall_body_exited(body: Node3D) -> void:
	under_waterfall = false
	
func _on_lever_kill_waterfall() -> void:
	$".".queue_free()
	print("waterfall turned off")
	
