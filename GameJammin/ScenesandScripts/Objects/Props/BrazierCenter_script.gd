extends StaticBody3D

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
	red_brazier.visible = false
	print(red_brazier.visible)
	blue_brazier.visible = false
	green_brazier.visible = false
	cyan_brazier.visible = false
	yellow_brazier.visible = false
	purple_brazier.visible = false
	white_brazier.visible = false
	near_brazier_center = false
	
func _process(delta: float) -> void:
	light_brazier()
	
func _on_brazier_center_body_entered(body: Node3D) -> void:
	near_brazier_center = true

func _on_brazier_center_body_exited(body: Node3D) -> void:
	near_brazier_center = false
	
func light_brazier():
	if near_brazier_center == true && Input.is_action_just_pressed("interact"):
		#RED BRAZIER 
		#If RED brazier is NOT light & player torch is RED
		if red_brazier.visible == false && player.torch.light_color == Color(1, 0, 0, 1):
			#Turn RED brazier to visible
			red_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
		#BLUE BRAZIER 
		#If BLUE brazier is NOT light & player torch is BLUE
		if blue_brazier.visible == false && player.torch.light_color == Color(0, 0, 1, 1):
			#Turn BLUE brazier to visible
			blue_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
		#GREEN BRAZIER 
		#If GREEN brazier is NOT light & player torch is GREEN
		if green_brazier.visible == false && player.torch.light_color == Color(0, 1, 0, 1):
			#Turn GREEN brazier to visible
			green_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
		#CYAN BRAZIER 
		#If CYAN brazier is NOT light & player torch is CYAN
		if cyan_brazier.visible == false && player.torch.light_color == Color(0, 1, 1, 1):
			#Turn CYAN brazier to visible
			cyan_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
		#YELLOW BRAZIER 
		#If YELLOW brazier is NOT lit & player torch is YELLOW
		if yellow_brazier.visible == false && player.torch.light_color == Color(1, 1, 0, 1):
			#Turn YELLOW brazier to visible
			yellow_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
		#PURPLE BRAZIER 
		#If PURPLE brazier is NOT lit & player torch is PURPLE
		if purple_brazier.visible == false && player.torch.light_color == Color(1, 0, 1, 1):
			#Turn PURPLE brazier to visible
			purple_brazier.visible = true
			player.animation_player.play("Light")
			player.animation_timer.start()
			#Set player torch to WHITE
			player.torch.light_color = Color(1, 1, 1, 1)
	elif red_brazier.visible == true && blue_brazier.visible == true && green_brazier.visible == true && cyan_brazier.visible == true && yellow_brazier.visible == true && purple_brazier.visible == true:
		white_brazier.visible = true

	
	
