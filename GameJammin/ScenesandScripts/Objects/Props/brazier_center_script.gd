extends StaticBody3D
#Set up Area 3D Collision so that center brazier only interacts with brazier's in the final room
#There is no need for center brazier to interact with the player
#NOTE - Center Brazier's Area3D Collision is assigned to 3 (aka props: sconce & brazier)
#NOTE - Center Brazier's Area3D Mask is assigned to 3 (aka props: sconce & brazier)

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D

#Assign braziers in final room to correspond with the colored decals on the floor
@export var red_brazier : OmniLight3D
@export var blue_brazier : OmniLight3D
@export var green_brazier : OmniLight3D
@export var cyan_brazier : OmniLight3D
@export var yellow_brazier : OmniLight3D
@export var purple_brazier : OmniLight3D

@export var center_brazier_color : Color
var near_brazier_center = false

#Pop Up Dialouge Variables
@onready var floating_text = preload("res://ScenesandScripts/PopUpDialouge/PopUp.tscn")

var winSound = preload("res://Art/Sounds/SFX/MenuSounds/BigWin2.mp3")

func _ready() -> void:
	$OmniLight3D.visible = false
	

func _process(delta: float) -> void:
	turn_on()

func _on_center_brazier_body_entered(body: Node3D) -> void:
	near_brazier_center = true
	
func _on_center_brazier_body_exited(body: Node3D) -> void:
	near_brazier_center = false
	
func turn_on():
	if near_brazier_center == true && $OmniLight3D.visible == false:
		if red_brazier.visible == true && blue_brazier.visible == true && green_brazier.visible == true && cyan_brazier.visible == true && purple_brazier.visible == true && yellow_brazier.visible == true:
			$OmniLight3D.visible = true
			var pop_up_text = "CONGRATULATIONS - YOU WIN"
			var text = floating_text.instantiate()
			text.pop_up_text = pop_up_text
			add_child(text)
			MainMenuMusic.play_SFX(winSound)
