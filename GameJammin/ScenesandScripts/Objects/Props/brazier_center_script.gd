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

@onready var white_brazier = $OmniLight3D

var near_brazier_center = false

func _ready() -> void:
	pass
