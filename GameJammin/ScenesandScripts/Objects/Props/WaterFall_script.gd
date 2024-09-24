extends Node3D

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Set variable for waterfall so that we can turn it on & off with lever pull
@onready var waterfall = $"."
#Set variable so we can define when player is under the waterfall
var under_waterfall := false
#Set variable for sound to play when player torch goes out under waterfall
var sizzle = preload("res://Art/Sounds/SFX/PlayerSFX/Sizzle.mp3")
	
#When the player goes under waterfall, douse player torch and play sizzle sound
func _on_waterfall_body_entered(body: Node3D) -> void:
	if waterfall.visible == true:
		if player.torch.visible == true:
			MainMenuMusic.play_SFX(sizzle)
		under_waterfall = true
		player.torch.visible = false
		player.torch.light_color = Color.WHITE
	
func _on_waterfall_body_exited(body: Node3D) -> void:
	under_waterfall = false
	
#For WaterFall_2 (near green brazier)
#WaterFall_2
func _on_lever_kill_waterfall() -> void:
	waterfall.visible = false
#WaterFall_2	
func _on_lever_revive_waterfall() -> void:
	waterfall.visible = true

#For WaterFall_3 (near red brazier)
#WaterFall_3
func _on_lever_revive_waterfall_3() -> void:
	waterfall.visible = false
#WaterFall_3
func _on_lever_kill_waterfall_3() -> void:
	waterfall.visible = true


#For BigWaterFall_2 (near purple door)
#BigWaterFall_2 
func _on_lever_2_kill_waterfall() -> void:
	waterfall.visible = false
#BigWaterFall_2 
func _on_lever_2_revive_waterfall() -> void:
	waterfall.visible = true
